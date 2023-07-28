//
//  MoviesOverviewTableViewCTableViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/28.
//

import UIKit

class MoviesOverviewTableViewCTableViewController: UITableViewController {
    let movieInfo = MovieInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieOverviewCell") as? MoviesOverviewTableViewCeTableViewCell else { return UITableViewCell() }
        
        cell.setCellUI(row: indexPath.row, movieInfo: movieInfo.movie)
        
        return cell
        
    }

}
