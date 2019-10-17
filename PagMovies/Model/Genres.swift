//
//  Genre.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

struct Genres: Decodable {
    let genres: [Genre]?
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
