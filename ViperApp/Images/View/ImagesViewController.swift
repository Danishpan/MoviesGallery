//
//  ImagesImagesViewController.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesViewController: UIViewController {

    var output: ImagesViewOutput!
    @IBOutlet weak var backdropsTableView: UITableView!
    @IBOutlet weak var postersTableView: UITableView!
    @IBOutlet weak var imagesSC: UISegmentedControl!
    
    private var backdrops: [ImagesEntity.Image] = [] {
        didSet {
            backdropsTableView.reloadData()
            print("reload")
        }
    }
    
    private var posters: [ImagesEntity.Image] = [] {
        didSet {
            postersTableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.getImages()
        output.viewIsReady()
        
        backdropsTableView.delegate = self
        backdropsTableView.dataSource = self
        backdropsTableView.separatorStyle = .none
        backdropsTableView.register(UINib(nibName: ImageCell.identifier, bundle: Bundle(for: ImageCell.self)), forCellReuseIdentifier: ImageCell.identifier)
        
        postersTableView.delegate = self
        postersTableView.dataSource = self
        postersTableView.separatorStyle = .none
        postersTableView.register(UINib(nibName: ImageCell.identifier, bundle: Bundle(for: ImageCell.self)), forCellReuseIdentifier: ImageCell.identifier)
        
    }

    @IBAction func stateChanged(_ sender: Any) {
        switch imagesSC.selectedSegmentIndex
            {
            case 0:
                backdropsTableView.isHidden = false
                postersTableView.isHidden = true
            case 1:
                backdropsTableView.isHidden = true
                postersTableView.isHidden = false
            default:
                break
            }
    }
    
    // MARK: ImagesViewInput
    func setupInitialState() {
    }
}

extension ImagesViewController: ImagesViewInput {
    func setImages(_ backdrops: [ImagesEntity.Image], _ posters: [ImagesEntity.Image]) {
        self.backdrops = backdrops
        self.posters = posters
    }
}

extension ImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == backdropsTableView {
            return backdrops.count
        } else {
            return posters.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == backdropsTableView {
            let cell = backdropsTableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            let imageURL = URL(string: "https://image.tmdb.org/t/p/w400" + (backdrops[indexPath.row].file_path ?? ""))!
            cell.pictureImageView.kf.setImage(with: imageURL)
            return cell
        } else {
            let cell = postersTableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            let imageURL = URL(string: "https://image.tmdb.org/t/p/w400" + (posters[indexPath.row].file_path ?? ""))!
            cell.pictureImageView.kf.setImage(with: imageURL)
            return cell
        }

    }
    
}



