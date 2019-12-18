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
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var podcastImage: UIImageView!

       func configureCell(_ podcast: Podcast) {
           podcastShowLabel.text = podcast.trackName
           artistNameLabel.text = podcast.artistName
           genreLabel.text = podcast.primaryGenreName
           releaseDateLabel.text = podcast.releaseDate.convertISODate()
       }
}
