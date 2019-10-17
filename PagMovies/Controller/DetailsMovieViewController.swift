//
//  DetailsMovieViewController.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class DetailsMovieViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
    }
    
}
