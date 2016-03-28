//
//  ViewController.swift
//  RedditChallenge
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

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        
    }

}

