//
//  TrendingMoviesTrendingMoviesViewController.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class TrendingMoviesViewController: UIViewController {


    @IBOutlet weak var trendingTableView: UITableView!
    @IBOutlet weak var soonTableView: UITableView!
    @IBOutlet weak var playingTableView: UITableView!
    @IBOutlet weak var viewSC: UISegmentedControl!
    var output: TrendingMoviesViewOutput!

    private var trendingMovies:[TrendingMovieEntity.Movie] = [TrendingMovieEntity.Movie]() {
        didSet {
            isLoading = false
            trendingTableView.reloadData()
        }
    }
    
    private var soonMovies:[TrendingMovieEntity.Movie] = [TrendingMovieEntity.Movie]() {
        didSet {
            isLoading = false
            soonTableView.reloadData()
        }
    }
    
    private var playingMovies:[TrendingMovieEntity.Movie] = [TrendingMovieEntity.Movie]() {
        didSet {
            isLoading = false
            playingTableView.reloadData()
        }
    }
    
    private var isLoading: Bool = false
    private var pageNumberTrending: Int = 1
    private var pageNumberSoon: Int = 1
    private var pageNumberPlaying: Int = 1

    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        super.viewDidLoad()
        title = "News"
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        trendingTableView.separatorStyle = .none
        trendingTableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle(for: MovieCell.self)), forCellReuseIdentifier: MovieCell.identifier)
        
        soonTableView.delegate = self
        soonTableView.dataSource = self
        soonTableView.separatorStyle = .none
        soonTableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle(for: MovieCell.self)), forCellReuseIdentifier: MovieCell.identifier)
        
        playingTableView.delegate = self
        playingTableView.dataSource = self
        playingTableView.separatorStyle = .none
        playingTableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle(for: MovieCell.self)), forCellReuseIdentifier: MovieCell.identifier)
        
        output?.getTrendingMovies(pageNumberTrending)
        output?.getSoonMovies(pageNumberSoon)
        output?.getPlayingMovies(pageNumberPlaying)
    }
    @IBAction func stateChanged(_ sender: Any) {
        switch viewSC.selectedSegmentIndex
            {
            case 0:
                soonTableView.isHidden = true
                trendingTableView.isHidden = false
                playingTableView.isHidden = true
            case 1:
                soonTableView.isHidden = false
                trendingTableView.isHidden = true
                playingTableView.isHidden = true
            case 2:
                soonTableView.isHidden = true
                trendingTableView.isHidden = true
                playingTableView.isHidden = false
            default:
                break
            }
    }
}


// MARK: TrendingMoviesViewInput
extension TrendingMoviesViewController: TrendingMoviesViewInput {
    func setPlayingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        self.playingMovies += movies
    }
    
    func setSoonMovies(_ movies: [TrendingMovieEntity.Movie]) {
        self.soonMovies += movies
//        print("soon movies received")
    }
    
    
    func setupInitialState() {
    }
    
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        self.trendingMovies += movies
    }
    
    func getController() -> UIViewController {
        return self
    }
}

extension TrendingMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == trendingTableView {
            let movieId = trendingMovies[indexPath.row].id
            output?.openMovieDetails(with: movieId)
        } else if tableView == soonTableView{
            let movieId = soonMovies[indexPath.row].id
            output?.openMovieDetails(with: movieId)
        } else {
            let movieId = playingMovies[indexPath.row].id
            output?.openMovieDetails(with: movieId)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == trendingTableView {
            return trendingMovies.count
        } else if tableView == soonTableView {
            return soonMovies.count
        } else {
            return playingMovies.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == trendingTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
            cell.movie = trendingMovies[indexPath.row]
            return cell
        } else if tableView == soonTableView {
            let cell = soonTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
            cell.movie = soonMovies[indexPath.row]
            return cell
        } else {
            let cell = playingTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
            cell.movie = playingMovies[indexPath.row]
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 10 && currentOffset > 200 && !isLoading {
            isLoading = true
            if trendingTableView.isHidden && playingTableView.isHidden {
                pageNumberSoon += 1
                output?.getSoonMovies(pageNumberSoon)
            } else if soonTableView.isHidden && playingTableView.isHidden {
                pageNumberTrending += 1
                output?.getTrendingMovies(pageNumberTrending)
            } else {
                pageNumberPlaying += 1
                output?.getPlayingMovies(pageNumberPlaying)
            }
        }
    }
}
