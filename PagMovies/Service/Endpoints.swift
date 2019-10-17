//
//  Endpoints.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation


class Endpoints {
    private static var baseUrl:String = "https://api.themoviedb.org/3/"
    static var getMovies = "\(baseUrl)movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR&page=1"
    static var getGenres = "\(baseUrl)genre/movie/list?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR"
}
