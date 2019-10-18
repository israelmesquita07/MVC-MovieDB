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
    private var genresArray:[Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        getGenres()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        moviesArray = Utils().loadFavoriteMovies()
        if moviesArray.isEmpty {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func getGenres() {
        
        if !moviesArray.isEmpty {
            API().getGenres(onComplete: { (genres) in
                guard let genres = genres.genres else { return }
                self.genresArray = genres
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }) { (error) in
                print(error)
            }
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
        cell.setupCell(movie, genresArray)
        return cell
    }
    
}
