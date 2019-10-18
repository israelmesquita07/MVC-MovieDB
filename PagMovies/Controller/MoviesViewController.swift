//
//  MoviesViewController.swift
//  PagMovies
//
//  Created by Israel on 16/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var moviesArray:[Movie] = []
    private var isOrderAsc: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        API().getMovies(onComplete: { (result) in
            guard let movies = result.results else { return }
            self.moviesArray = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    @IBAction func sortAscAndDesc(_ sender: UIBarButtonItem) {
        moviesArray = isOrderAsc ? Utils().descendingSortMovies(movies: moviesArray) : Utils().ascendingSortMovies(movies: moviesArray)
        isOrderAsc = !isOrderAsc
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - DataSource
extension MoviesViewController: UITableViewDataSource {
    
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


//MARK: - Delegate
extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "DetailsMovieViewController")
                                                                    as? DetailsMovieViewController {
            vc.movie = moviesArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
