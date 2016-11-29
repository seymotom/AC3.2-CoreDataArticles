//
//  Article+Extension.swift
//  CoreDataArticles
//
//  Created by Jason Gresh on 11/28/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

extension Article {
    func populate(from dict: [String:Any]) {
        if let title = dict["title"] as? String,
            let abstract = dict["abstract"] as? String {
            self.title = title
            self.abstract = abstract
        }
    }
}
