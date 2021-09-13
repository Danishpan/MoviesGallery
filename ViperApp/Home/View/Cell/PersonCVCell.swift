//
//  PersonCVCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 14.06.2021.
//

import UIKit
import Kingfisher

class PersonCVCell: UICollectionViewCell {
    public static let identifier: String = "PersonCVCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PersonCVCell", bundle: nil)
    }

    public var person: PeopleEntity.Person? {
        didSet {
            if let person = person {
                let personURL = URL(string: "https://image.tmdb.org/t/p/w400" + (person.profile))!
                personImageView.kf.setImage(with: personURL)
                nameLabel.text = person.name
                depLabel.text = person.dep
            }
        }
    }
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var depLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        personImageView.layer.cornerRadius = 45
        personImageView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = true
    }

}
