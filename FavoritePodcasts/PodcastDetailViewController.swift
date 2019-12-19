//
//  PodcastDetailViewController.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class PodcastDetailViewController: UIViewController {
    
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    //@IBOutlet weak var contentAdvisoryLabel: UILabel!
    @IBOutlet weak var podcastImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!

    var podcast: Podcast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        showNameLabel.text = podcast?.trackName
        artistNameLabel.text = podcast?.artistName
        trackCountLabel.text = podcast?.trackCount?.description
        releaseDateLabel.text = podcast?.releaseDate?.convertISODate()
        
        podcastImage.getImage(with: podcast!.artworkUrl600) { [weak self] (result) in
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
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        let favoritedBy = "Greg K"
        guard let podcast = podcast else {
                return
        }
               
        let favoritePodcast = Podcast(trackId: podcast.trackId, artistName: nil, trackName: nil, artworkUrl100: nil, artworkUrl600: podcast.artworkUrl600, releaseDate: nil, primaryGenreName: nil, trackCount: nil, genres: nil, collectionName: podcast.collectionName, favoritedBy: favoritedBy, contentAdvisoryRating: nil)

        
        FavoritePodcastAPI.postFavorite(podcast: favoritePodcast) { (result) in
            switch result {
            case .failure(let appError):
                print("AppError: \(appError)")
            case .success:
                print("Post successful")
            }
        }
    }
    
}
