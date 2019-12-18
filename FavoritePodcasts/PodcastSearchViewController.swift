//
//  ViewController.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class PodcastSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var podcasts = [Podcast]() {
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
        searchBar.delegate = self
        searchPodcasts(searchQuery: "Swift")
    }

    // MARK: PrepareForSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let podcastDVC = segue.destination as? PodcastDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Failed to segue to PodcastDetailViewController")
        }
        let podcast = podcasts[indexPath.row]
        podcastDVC.podcast = podcast
    }
    //MARK: Funcs
    func searchPodcasts(searchQuery: String) {
        PodcastSearchAPI.searchPodcasts(for: searchQuery, completion: { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error: \(appError)")
            case .success(let podcasts):
                DispatchQueue.main.async {
                    self?.podcasts = podcasts
                }
            }
        } )
    }
    
}
// MARK: UITableViewDataSource
extension PodcastSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath) as? PodcastCell else {
            fatalError("failed to dequeue to podcastCell")
        }
        let podcast = podcasts[indexPath.row]
        cell.configureCell(podcast)
        return cell
    }
    
    
}
// MARK: SearchBar Delegate
extension PodcastSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            print("missing search text")
            return
        }
        searchPodcasts(searchQuery: searchText )
        searchBar.resignFirstResponder()
    }
}

