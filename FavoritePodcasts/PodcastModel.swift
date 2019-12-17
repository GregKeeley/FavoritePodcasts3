//
//  PodcastModel.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct Podcasts: Decodable {
    let resultCount: Double
    let results: [Podcast]
}

struct Podcast: Decodable {
    let collectionId: Double
    let trackId: Double
    let artistName: String
    let trackname: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenre: String
    let contentAdvisoryRating: String
}
