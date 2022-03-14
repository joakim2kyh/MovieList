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


struct Movie: Decodable, Identifiable {
    
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    //let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
    let genres: [MovieGenre]?
    
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var rating: String {
        //let rating = Int(voteAverage)
        return "\(Int(voteAverage))/10"
    }
    
    var ratingStars: String {
        let rating = Int(voteAverage)
        var ratingStars = ""
        for _ in 0..<rating {
            ratingStars += "★"
        }
        return ratingStars
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var duration: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        guard let runtime = runtime else {
            return "n/a"
        }
        return formatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
    var releaseYear: String {
        if let releaseDate = releaseDate {
        
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-mm-dd"
            let date = formatter.date(from: releaseDate)
            formatter.dateFormat = "yyyy"
            
            return formatter.string(from: date!)
        }
        return "n/a"
    }
}

struct MovieGenre: Decodable {
    
    let name: String
}

