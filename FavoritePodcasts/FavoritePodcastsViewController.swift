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
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var refreshControl: UIRefreshControl!
    
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
    }
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(loadFavoritePodcasts), for: .valueChanged)
    }
@objc
    private func loadFavoritePodcasts() {
    
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
