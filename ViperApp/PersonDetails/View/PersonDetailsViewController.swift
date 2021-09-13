//
//  PersonDetailsPersonDetailsViewController.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    var output: PersonDetailsViewOutput!
    @IBOutlet weak var profileImageVIew: UIImageView!
    @IBOutlet weak var depLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moviesCV: UICollectionView!
    
    private var movies: [TrendingMovieEntity.Movie] = [] {
        didSet {
            moviesCV.reloadData()
        }
    }
    
    private var person: PeopleEntity.Person? {
        didSet {
            if let person = person {
                let avatarURL = URL(string: "https://image.tmdb.org/t/p/w400" + (person.profile ))!
                profileImageVIew.kf.setImage(with: avatarURL)
                self.nameLabel.text = person.name
                self.depLabel.text = person.dep
                self.movies = person.movies
            }
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        output?.getPerson()
        
        profileImageVIew.layer.cornerRadius = 10
        profileImageVIew.layer.masksToBounds = true
        
        moviesCV.delegate = self
        moviesCV.dataSource = self
        moviesCV.register(UINib(nibName: MoviesCVCell.identifier, bundle: Bundle(for: MoviesCVCell.self)), forCellWithReuseIdentifier: MoviesCVCell.identifier)
    }


    // MARK: PersonDetailsViewInput
    func setupInitialState() {
    }
}

extension PersonDetailsViewController: PersonDetailsViewInput {
    func setPersonDetails(_ person: PeopleEntity.Person) {
        self.person = person
    }
    
    func getController() -> UIViewController {
        return self
    }
}

extension PersonDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCV.dequeueReusableCell(withReuseIdentifier: MoviesCVCell.identifier, for: indexPath) as! MoviesCVCell
        cell.movie = movies[indexPath.row]
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovies(_:))))
        return cell
    }
    
    @objc func tapMovies(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.moviesCV)
       let indexPath = self.moviesCV.indexPathForItem(at: location)

       if let index = indexPath {
        output?.openMovieDetails(with: movies[index.row].id)
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }

}


