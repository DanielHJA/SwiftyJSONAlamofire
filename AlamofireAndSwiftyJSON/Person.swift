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

struct Person: Objectifiable {
    
    var id: String?
    var name: String!
    var headline: String!
    var age: Int!
    var hobbies = [String]()
    
}

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

extension Objectifiable {
    static func arrayFromJSON(_ json: JSON) -> [Self] {
        var result = [Self]()
        for (_, item) in json {
            if let item = Self(json: item) {
                result.append(item)
            }
        }
        return result
    }
}
