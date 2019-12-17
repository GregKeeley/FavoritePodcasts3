//
//  AppError.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

public enum AppError: Error {
case badURL(String)
case networkError(Error)
case noResponse
case decodingError(Error)
case badStatusCode(Int)
case badMimeType(String)
case noData

}
