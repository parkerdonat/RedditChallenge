//
//  SubredditTableViewController.swift
//  Subreddit
//
//  Created by Parker Donat on 3/28/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

/*
 Challenge: SubReddit Posts
 
 Build a simple app that allows users to enter in the name of a subreddit in a textfield, hit submit, and see the titles of the current posts for that subreddit.
 List the current posts in a tableview.
 Black diamond: If the user taps on a cell, open a SafariViewController to the URL of that post.'
 */

// https://www.reddit.com/r/AskReddit.json
// https;//www.reddit.com/r/\(insertSubRedditHere).json

import UIKit
import SafariServices

class SubredditTableViewController: UITableViewController, UISearchBarDelegate, SFSafariViewControllerDelegate {
    
    var subreddits = [Reddit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subreddits.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let subreddit = subreddits[indexPath.row]
        
        cell.textLabel?.text = subreddit.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subreddit = subreddits[indexPath.row]
        if let url = NSURL(string: subreddit.url) {
            let safariVC = SFSafariViewController(URL: url)
            presentViewController(safariVC, animated: true, completion: nil)
        }
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            RedditController.searchForSubreddits(searchText, completion: { (subreddits) in
                self.subreddits = subreddits
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            })
        }
    }
}
