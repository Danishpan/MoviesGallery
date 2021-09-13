//
//  ImageCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 15.06.2021.
//

import UIKit

class ImageCell: UITableViewCell {


    @IBOutlet public weak var pictureImageView: UIImageView!
    public static let identifier: String = "ImageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView.layer.cornerRadius = 15
        pictureImageView.layer.masksToBounds = true
    }
    
}
