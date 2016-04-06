//
//  RedditController.swift
//  Subreddit
//
//  Created by Parker Donat on 3/28/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class RedditController {
    
    static func searchForSubreddits(searchTerm: String, completion: (subreddits: [Reddit]) -> Void) {
        if let url = NetworkController.redditUrl(searchTerm) {
            NetworkController.dataAtUrl(url, completion: { (data) in
                if let data = data {
                    do {
                        let jsonAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                        guard let jsonDict = jsonAnyObject as? [String: AnyObject],
                            dataDict = jsonDict["data"] as? [String: AnyObject],
                            childrenArray = dataDict["children"] as? [[String: AnyObject]] else {
                                completion(subreddits: [])
                                return
                        }
                        var tempRedditArray = [Reddit]()
                        for dict in childrenArray {
                            if let reddit = Reddit(dictionary: dict) {
                                tempRedditArray.append(reddit)
                            }
                        }
                        completion(subreddits: tempRedditArray)
                    } catch {
                        print("Could not serialized data")
                        completion(subreddits: [])
                    }
                } else {
                    print("Could not get data at url")
                    completion(subreddits: [])
                }
            })
        } else {
            print("Could not get reddit url")
            completion(subreddits: [])
        }
    }
}