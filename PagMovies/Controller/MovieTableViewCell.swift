//
//  MovieTableViewCell.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ movie: Movie) {
        if let backdropPath = movie.backdropPath {
            loadImage(backdropPath)
        }
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        genderLabel.text = "Aventura"
    }
    
    private func loadImage(_ backdropPath:String) {
        let urlString = "\(Endpoints.imageURL)\(backdropPath)"
        if let urlImage = URL(string: urlString) {
            movieImageView.kf.indicatorType = .activity
            movieImageView.kf.setImage(with: urlImage)
        }
    }
    
}
