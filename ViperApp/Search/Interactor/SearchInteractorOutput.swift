//
//  SearchSearchInteractorOutput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

protocol SearchInteractorOutput: class {
    func setResults(_ movies: [TrendingMovieEntity.Movie])
}
