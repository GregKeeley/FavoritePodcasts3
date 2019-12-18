//
//  PodcastSearchAPI.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation
struct PodcastSearchAPI {
    static func searchPodcasts(for searchQuery: String, completion: @escaping (Result<[Podcast], AppError>) -> ()) {
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let podcastSearchEndpointURL = "https://itunes.apple.com/search?media=podcast&limit=200&term=\(searchQuery ?? "swift")"
        guard let url = URL(string: podcastSearchEndpointURL) else {
            completion(.failure(.badURL(podcastSearchEndpointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode(PodcastSearch.self, from: data)
                    let podcasts = searchResults.results
                    completion(.success(podcasts))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
    }
}
