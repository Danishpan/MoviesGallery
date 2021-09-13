//
//  SearchSearchViewOutput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol SearchViewOutput {

    /**
        @author Danishpan
        Notify presenter that view is ready
    */
    func getResults(_ pageNumber: Int, _ query: String)
    func openMovieDetails(with id: Int)
    func viewIsReady()
}
