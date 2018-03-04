//
//  Movie.swift
//  flix
//
//  Created by Raquel Figueroa-Opperman on 3/3/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import Foundation

enum MovieKeys {
    static let title = "title"
    static let releaseDate = "release_date"
    static let overview = "overview"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}


class Movie {
    var backDropURL: URL?
    var posterUrl: URL?
    
    var title: String
    var releaseDate: String
    var overView: String

//    var id: String
    var baseURL = "https://image.tmdb.org/t/p/w500"
    
    init(dictionary: [String: Any]) {
        backDropURL = URL(string: baseURL + (dictionary[MovieKeys.backdropPath] as! String))
        posterUrl = URL(string: baseURL + (dictionary[MovieKeys.posterPath] as! String))
        
        title = dictionary[MovieKeys.title] as? String ?? "No title"
        releaseDate = dictionary[MovieKeys.releaseDate] as? String ?? "No release date"
        overView = dictionary[MovieKeys.overview] as? String ?? "No overview found"
    }
    
    // helper function: 
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
}
