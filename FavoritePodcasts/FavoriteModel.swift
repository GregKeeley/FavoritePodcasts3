//
//  FavoriteModel.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct FavoritePodcasts: Encodable {
    let favoriteId: String
    let createdAt: Int
    let trackId: Int
    let collectionName: String
    let artworkUrl600: String
    let favoritedBy: String
}
