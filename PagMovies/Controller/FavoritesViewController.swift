//
//  FavoritesViewController.swift
//  PagMovies
//
//  Created by Israel on 17/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var moviesArray:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        moviesArray = Utils().loadFavoriteMovies()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - DataSource
extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MovieTableViewCell
        let movie = moviesArray[indexPath.row]
        cell.setupCell(movie)
        return cell
    }
    
}
