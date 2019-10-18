//
//  DetailsMovieViewController.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class DetailsMovieViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = self.movie else { return }
        setup(movie: movie)
    }
    
    private func setup(movie:Movie) {
        
        let movies:[Movie] = Utils().loadFavoriteMovies()
        if isFavorite(movies: movies, movie: movie) {
            changeLayoutButton(favoriteButton, title: "Sou favorito!", color: .red)
        }
        if let backdropPath = movie.backdropPath {
            Utils().loadImage(backdropPath, movieImageView)
        }
        if let releaseDate = movie.releaseDate {
            dateLabel.text = Utils().changeDate(releaseDate)
        }
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }
    
    private func isFavorite(movies: [Movie], movie:Movie) -> Bool {
        movies.contains(where: { $0.id == movie.id }) ? true : false
    }
    
    private func changeLayoutButton(_ button: UIButton, title: String, color:UIColor) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
    }
    
    @IBAction func favoriteMovie(_ sender: UIButton) {
        
        var movies:[Movie] = Utils().loadFavoriteMovies()
        guard let movie = self.movie else { return }
        
        if isFavorite(movies: movies, movie: movie) {
            Utils().removeFavoriteMovie(id: movie.id!)
            changeLayoutButton(sender, title: "Favoritar", color: .blue)
        } else {
            movies.append(movie)
            Utils().saveFavoriteMovies(movies: movies)
            changeLayoutButton(sender, title: "Sou favorito!", color: .red)
        }
    }
    
}
