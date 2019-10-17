//
//  MovieTableViewCell.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ movie: Movie) {
        movieImageView.image = UIImage()
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        genderLabel.text = "Aventura"
    }
    
}
