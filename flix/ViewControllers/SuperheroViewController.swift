//
//  SuperheroViewController.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 2/7/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine:CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width/cellsPerLine - interItemSpacingTotal/cellsPerLine
        layout.itemSize = CGSize(width: width, height: width*3/2)
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func fetchMovies() {
        MovieApiManager().superHeroMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
            }
//            self.refreshControl.endRefreshing()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
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
