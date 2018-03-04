//
//  MovieApiManager.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 3/3/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import Foundation

class MovieApiManager {
    
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func nowPlayingMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
        let url = URL(string: MovieApiManager.baseUrl + "now_playing?api_key=\(MovieApiManager.apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                
                let movies = Movie.movies(dictionaries: movieDictionaries)
                completion(movies, nil)
            } else {
//                print(error.localizedDescription)
//                if (error.localizedDescription == "The Internet connection appears to be offline."){
//                    //alert functionality:
//                    let alertController = UIAlertController(title: "Network Connection Failure", message: "The Internet connection appears to be offline. Would you like to reload?", preferredStyle: .alert)
//                    
//                    let cancelAction = UIAlertAction(title: "Cancel: Exit App", style: .cancel) { (action) in
//                        exit(0)
//                    }
//                    
//                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
//                        self.fetchMovies()
//                    }
//                    
//                    alertController.addAction(cancelAction)
//                    alertController.addAction(okAction)
//                    
//                    self.present(alertController, animated: true){
//                        print("success!")
//                    }
//                }
                completion(nil, error)
            }
        }
        task.resume()
    }
}
