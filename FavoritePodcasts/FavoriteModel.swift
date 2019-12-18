//
//  FavoriteModel.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct FavoritePodcast: Codable {
    //let favoriteId: String - Assigned by API server?
    //let createdAt: Int - Assigned by API server?
    let trackId: Int
    let collectionName: String
    let artworkUrl600: String
    let favoritedBy: String
}
