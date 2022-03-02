//
//  Movie.swift
//  MovieList
//
//  Created by Joakim Andersson on 2022-03-01.
//

import Foundation

struct MovieResponse: Decodable {
    
    let results: [Movie]
}


struct Movie: Decodable, Identifiable, Hashable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    //let voteCount: Int
    //let runtime: Int?
    let releaseDate: String?
    
    
    var posterURL: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
    }
    
    var rating: String {
        //let rating = Int(voteAverage)
        return "\(voteAverage)/10"
    }
}

