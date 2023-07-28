//
//  MoviesOverviewTableViewCeTableViewCell.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/28.
//

import UIKit

class MoviesOverviewTableViewCeTableViewCell: UITableViewCell {

    @IBOutlet weak var movieSummaryTextView: UITextView!
    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellUI(row: Int, movieInfo: [Movie]){
        let currentMovie = movieInfo[row]
        movieTitleLabel.text = currentMovie.title
        movieTitleLabel.font = .boldSystemFont(ofSize: 17)
        movieImg.image = UIImage(named: currentMovie.title)
        movieImg.contentMode = .scaleAspectFit
        movieInfoLabel.text = "\(currentMovie.releaseDate) | \(currentMovie.runtime)분 | \(currentMovie.rate)점"
        movieSummaryTextView.text = currentMovie.overview
    }

}
