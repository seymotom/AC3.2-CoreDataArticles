//
//  Article+Extension.swift
//  CoreDataArticles
//
//  Created by Jason Gresh on 11/28/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

//"2016-12-01T14:13:41-05:00"

extension Article {
    func populate(from dict: [String:Any]) {
        if let title = dict["title"] as? String,
            let abstract = dict["abstract"] as? String,
            let byline = dict["byline"] as? String,
            let section = dict["section"] as? String,
            let subsection = dict["subsection"] as? String,
            let url = dict["url"] as? String,
            let publishedDateString = dict["published_date"] as? String {
            self.title = title
            self.abstract = abstract
            self.byline = byline
            self.section = section
            self.subsection = subsection
            self.url = url
            
            let formatter = ISO8601DateFormatter()
            
            let publishedDate = formatter.date(from: publishedDateString)! as NSDate
            
            self.publishedDate = publishedDate
        }
    }
}
