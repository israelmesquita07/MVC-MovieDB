//
//  Movie.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let results:[Movie]?
}

class Movie: Decodable {
    let title: String?
    let overview: String?
    let releaseDate: String?
    let backdropPath: String?
    let genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
    }
    
}
