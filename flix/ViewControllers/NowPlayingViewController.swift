//
//  NowPlayingViewController.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 2/1/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource{
    
    //property to store returned movies:
    var movies: [Movie] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        
        fetchMovies()
        activityIndicator.stopAnimating()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    
    
    func fetchMovies() {

        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
            self.refreshControl.endRefreshing()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = movies[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let movie = movies[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.movie = movie
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
