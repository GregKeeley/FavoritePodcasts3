//
//  FavoritePodcastsViewController.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class FavoritePodcastsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoritePodcasts = [Podcast]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadFavoritePodcasts()
    }
    
    func loadFavoritePodcasts() {

        FavoritePodcastAPI.getFavorites(for: "Greg K", completion: { (result) in
            switch result {
            case .failure(let appError):
                print("Error: \(appError)")
            case .success(let podcasts):
                self.favoritePodcasts = podcasts
                dump(self.favoritePodcasts)
            }
        })
    }
}
// MARK: TableViewDataSource
extension FavoritePodcastsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritePodcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoritePodcastCell", for: indexPath) as? PodcastCell else {
            fatalError("failed to dequeue to podcastCell")
        }
        let podcast = favoritePodcasts[indexPath.row]
        cell.configureCell(podcast)
        return cell
        
    }
    
    
}
