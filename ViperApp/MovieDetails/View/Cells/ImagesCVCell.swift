//
//  ImagesCVCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import UIKit
import Kingfisher

class ImagesCVCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    public static let identifier: String = "ImagesCVCell"
    
    public var image: ImagesEntity.Image? {
        didSet {
            if let image = image {
                let imageURL = URL(string: "https://image.tmdb.org/t/p/w400" + (image.file_path ?? ""))!
                imageView.kf.setImage(with: imageURL)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = true    }

}
