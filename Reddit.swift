//
//  Reddit.swift
//  Subreddit
//
//  Created by Parker Donat on 3/28/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

struct Reddit {
    
    private let kTitle = "title"
    private let kUrl = "url"
    private let kData = "data"
    
    var title: String
    var url: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let data = dictionary[kData] as? [String: AnyObject],
            title = data[kTitle] as? String,
            url = data[kUrl] as? String else {
                return nil
        }
        
        self.title = title
        self.url = url
    }
}