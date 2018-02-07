//
//  SuperheroViewController.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 2/7/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    
    
    
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
        
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func fetchMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=8c45ce5939493dbfdb3ff90cc9573d51")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, respo, error) in
            if let error = error {
                print(error.localizedDescription)
                if (error.localizedDescription == "The Internet connection appears to be offline."){
                    //alert functionality:
                    let alertController = UIAlertController(title: "Network Connection Failure", message: "The Internet connection appears to be offline. Would you like to reload?", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "Cancel: Exit App", style: .cancel) { (action) in
                        exit(0)
                    }
                    
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.fetchMovies()
                    }
                    
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true){
                        print("success!")
                    }
                }
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
                // self.refreshControl.endRefreshing()
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
