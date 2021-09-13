//
//  ReviewDetailsReviewDetailsViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 13/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol ReviewDetailsViewInput: class {


    func setupInitialState()
    
    func setReviewDetails(_ review: ReviewEntity.Review)
}
