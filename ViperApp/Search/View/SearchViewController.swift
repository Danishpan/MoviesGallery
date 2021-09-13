//
//  SearchSearchViewController.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var output: SearchViewOutput!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var queriesTableView: UITableView!
    
    private var isLoading: Bool = false
    private var pageNumber: Int = 1

    private var results:[TrendingMovieEntity.Movie] = [TrendingMovieEntity.Movie]() {
        didSet {
            isLoading = false
            resultTableView.reloadData()
        }
    }
    
    private var queries: [String] = [] {
        didSet {
            queriesTableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        title = "Search"
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.separatorStyle = .none
        resultTableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle(for: MovieCell.self)), forCellReuseIdentifier: MovieCell.identifier)
        
        queriesTableView.delegate = self
        queriesTableView.dataSource = self
        queriesTableView.separatorStyle = .none
        
        getQueries()
    }

    @IBAction func searchClicked(_ sender: Any) {
        if let query = searchTextField.text {
            if query != "" {
                output?.getResults(pageNumber, query)
                CoreDataManager.shared.addQuery(query)
                self.results.removeAll()
                
                queriesTableView.isHidden = true
                resultTableView.isHidden = false
            }
        }
    }
    
    // MARK: SearchViewInput
    func setupInitialState() {
    }
    
    func getQueries() {
        let allQueries = CoreDataManager.shared.allQueries()
        var savedQueries: [String] = []

        for query in allQueries{
            if let queryString = query.query {
                savedQueries.append(queryString)
            }
        }
        
        self.queries = savedQueries
    }
}

extension SearchViewController: SearchViewInput {
    func setResults(_ movies: [TrendingMovieEntity.Movie]) {
        self.results += movies
    }
    
    func getController() -> UIViewController {
        return self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == resultTableView {
            let movieId = results[indexPath.row].id
            output?.openMovieDetails(with: movieId)
        } else {
            output?.getResults(pageNumber, queries[indexPath.row])
            queriesTableView.isHidden = true
            resultTableView.isHidden = false
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == resultTableView {
            return results.count
        } else {
            return queries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == resultTableView {
            let cell = resultTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
            cell.movie = results[indexPath.row]
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = queries[indexPath.row]
            cell.textLabel?.textColor = .darkGray
            return cell
        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 10 && currentOffset > 200 && !isLoading {
            if !resultTableView.isHidden {
                isLoading = true
                pageNumber += 1
                output?.getResults(pageNumber, searchTextField.text ?? "")
            }
        }
    }
}
