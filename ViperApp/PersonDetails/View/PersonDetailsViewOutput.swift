//
//  PersonDetailsPersonDetailsViewOutput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol PersonDetailsViewOutput {

    /**
        @author Danishpan
        Notify presenter that view is ready
    */
    func getPerson()
    func openMovieDetails(with id: Int)
    func viewIsReady()
}
