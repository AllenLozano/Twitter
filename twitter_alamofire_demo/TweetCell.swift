//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Allen Lozano on 11/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
   
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var indexPath: IndexPath?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
