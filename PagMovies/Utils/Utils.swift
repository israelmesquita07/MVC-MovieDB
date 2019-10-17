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
    
}
