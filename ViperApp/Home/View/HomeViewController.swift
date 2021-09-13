//
//  HomeHomeViewController.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var output: HomeViewOutput!
    
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    private var trendingMovies: [TrendingMovieEntity.Movie] = [] {
        didSet {
            trendingCV.reloadData()
        }
    }

    private var trendingPeople: [PeopleEntity.Person] = [] {
        didSet {
            trendingPeopleCV.reloadData()
        }
    }
    
    @IBOutlet weak var trendingPeopleCV: UICollectionView!
    @IBOutlet weak var trendingCV: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        output?.getTrendingMovies()
        output?.getTrendingPeople()
        
        configureView()
    }

    @IBAction func trendingOpen(_ sender: Any) {
        output?.openTrendingMovies()
    }
    @IBAction func searchOpen(_ sender: Any) {
        output?.openSearch()
    }
    
    private func configureView() {
        
        trendingCV.delegate = self
        trendingCV.dataSource = self
        trendingCV.register(UINib(nibName: MoviesCVCell.identifier, bundle: Bundle(for: MoviesCVCell.self)), forCellWithReuseIdentifier: MoviesCVCell.identifier)
        
        trendingPeopleCV.delegate = self
        trendingPeopleCV.dataSource = self
        trendingPeopleCV.register(UINib(nibName: PersonCVCell.identifier, bundle: Bundle(for: PersonCVCell.self)), forCellWithReuseIdentifier: PersonCVCell.identifier)
    }
    
    // MARK: HomeViewInput
    func setupInitialState() {
    }
}

extension HomeViewController: HomeViewInput {
    func setTrendingPeople(_ people: [PeopleEntity.Person]) {
        self.trendingPeople = people
    }
    
    
    
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        self.trendingMovies = movies
    }
    
    func getController() -> UIViewController {
        return self
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingCV {
            return trendingMovies.count
        } else {
            return trendingPeople.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == trendingCV {
            let cell = trendingCV.dequeueReusableCell(withReuseIdentifier: MoviesCVCell.identifier, for: indexPath) as! MoviesCVCell
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTrending(_:))))
            cell.movie = trendingMovies[indexPath.row]
            return cell
        } else {
            let cell = trendingPeopleCV.dequeueReusableCell(withReuseIdentifier: PersonCVCell.identifier, for: indexPath) as! PersonCVCell
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPeople(_:))))
            cell.person = trendingPeople[indexPath.row]
            return cell
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == trendingCV {
            return CGSize(width: 200, height: 300)
        } else {
            return CGSize(width: 120, height: 165)
        }
    }

    
    @objc func tapTrending(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.trendingCV)
       let indexPath = self.trendingCV.indexPathForItem(at: location)

       if let index = indexPath {
          let movieId = trendingMovies[index.row].id
          output?.openMovieDetails(with: movieId)
       }
    }
    
    @objc func tapPeople(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.trendingPeopleCV)
       let indexPath = self.trendingPeopleCV.indexPathForItem(at: location)

       if let index = indexPath {
          let person = trendingPeople[index.row]
          output?.openPersonDetails(with: person)
       }
    }

}
