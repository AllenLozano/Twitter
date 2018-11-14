//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tweetz: UIView!
    var tweets: [Tweet]!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate  = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.rowHeight = 100
        
        
        fetchTweets()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        let tweet = tweets[indexPath.row]
        cell.indexPath = indexPath
        
        cell.tweetLabel.text = tweet.text
        cell.timeLabel.text = tweet.createdAtString
        cell.handleLabel.text = "@\((tweet.user?.screenName)!)"
        cell.nameLabel.text = (tweet.user?.name)!
        cell.retweetLabel.text = "\((tweet.retweetCount)!)"
        cell.favoriteLabel.text = "\((tweet.favoriteCount)!)"
        
        let avatarUrl = tweet.user?.profImageUrl!
        let data = try? Data(contentsOf: avatarUrl!)
        if let imageData = data {
            cell.pictureImageView.image = UIImage(data: imageData)
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            return tweets.count
        } else {
            return 0
        }
    }
    func fetchTweets() {
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                self.tweets = tweets!
                self.tableView.reloadData()
            }
        }
    }
}
