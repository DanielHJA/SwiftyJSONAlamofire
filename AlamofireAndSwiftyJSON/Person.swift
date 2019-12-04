//
//  Person.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol Objectifiable {
    init?(json: JSON)
}

extension Objectifiable {
    init?(json: JSON) {
        self.init(json: json)
    }
}

struct Person: Objectifiable {
    
    var id: String?
    var name: String!
    var headline: String!
    var age: Int!
    var hobbies = [String]()
    
}

// MARK: - SwiftyJSON Init

extension Person {
    
    init?(json: JSON) {
        guard let id = json["id"].string else { return nil }
        let name = json["name"].string
        let headline = json["headline"].string
        let age = json["age"].int
        let hobbies = json["hobbies"].exists() ? json["hobbies"].arrayValue.compactMap { $0.string } : []
        
        self.id = id
        self.name = name
        self.headline = headline
        self.age = age
        self.hobbies = hobbies
    }
    
}
