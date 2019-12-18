//
//  PodcastCell.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastShowLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var episodesCountLabel: UILabel!
    @IBOutlet weak var podcastImage: UIImageView!
    
    func configureCell(_ podcast: Podcast) {
        
        podcastShowLabel.text = podcast.trackName
        artistNameLabel.text = podcast.artistName
        genreLabel.text = podcast.primaryGenreName
        episodesCountLabel.text = ("Episode Count: \(podcast.trackCount.description)")
        podcastImage.getImage(with: podcast.artworkUrl100) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
                DispatchQueue.main.async {
                    self?.podcastImage.image = UIImage(systemName: "person")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.podcastImage.image = image
                }
            }
        }
    }
}
