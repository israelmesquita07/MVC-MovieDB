//
//  Utils.swift
//  PagMovies
//
//  Created by Israel on 17/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation
import Kingfisher

class Utils {
    
    func loadImage(_ backdropPath:String, _ imageView:UIImageView) {
        let urlString = "\(Endpoints.imageURL)\(backdropPath)"
        if let urlImage = URL(string: urlString) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: urlImage)
        }
    }
    
    func changeDate(_ date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertedDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: convertedDate!)
        return date
    }
    
    func saveFavoriteMovies(movies: [Movie]) {
        
        let moviesData = try! JSONEncoder().encode(movies)
        UserDefaults.standard.set(moviesData, forKey: Constants.movieDefaults)
    }
    
    func loadFavoriteMovies() -> [Movie] {
        
        if let moviesData = UserDefaults.standard.data(forKey: Constants.movieDefaults) {
            let movieArray = try! JSONDecoder().decode([Movie].self, from: moviesData)
            return movieArray
        }
        return []
    }
    
    func removeFavoriteMovie(id: Double) {
        var movies:[Movie] = Utils().loadFavoriteMovies()
        movies.removeAll(where: { $0.id == id })
        saveFavoriteMovies(movies: movies)
    }
    
    func ascendingSortMovies(movies: [Movie]) -> [Movie] {
        return movies.sorted { $0.title!.localizedCaseInsensitiveCompare($1.title!) == ComparisonResult.orderedAscending }
    }
    
    func descendingSortMovies(movies: [Movie]) -> [Movie] {
        return movies.sorted { $0.title!.localizedCaseInsensitiveCompare($1.title!) == ComparisonResult.orderedDescending }
    }
    
}
