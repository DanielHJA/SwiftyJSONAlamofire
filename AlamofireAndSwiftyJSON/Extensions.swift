//
//  Extensions.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

extension UIView {
    static func loadNib() -> Self {
        let bundle = Bundle.main
        return bundle.loadNibNamed(String(describing: self), owner: self, options: nil)![0] as! Self
    }
}

extension PersonView {
    static func makeView(person: Person) -> Self {
        let view = Self.loadNib()
        view.header = person.name
        view.value = person.headline
        return view
    }
}
