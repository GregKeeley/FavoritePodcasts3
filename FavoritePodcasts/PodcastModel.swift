//
//  PodcastModel.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct PodcastSearch: Decodable {
    let results: [Podcast]
}

struct Podcast: Decodable {
    let collectionId: Int
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let artworkUrl600: String
    let releaseDate: String
    let primaryGenreName: String
    let trackCount: Int
    let genres: [String]
    let collectionName: String
   // let contentAdvisoryRating: 
}

