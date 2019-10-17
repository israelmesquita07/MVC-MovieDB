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
    
    public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = self.movie else { return }
        setup(movie: movie)
    }
    
    private func setup(movie:Movie) {
        if let backdropPath = movie.backdropPath {
            Utils().loadImage(backdropPath, movieImageView)
        }
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
    }

}
