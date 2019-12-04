//
//  Extensions.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

extension BaseView {
    
    static func makeView(object: Objectifiable) -> Self {
        let view = Self.loadNib()
        view.object = object as? T 
        return view
    }
    
    static func loadNib() -> Self {
        let bundle = Bundle.main
        return bundle.loadNibNamed(String(describing: self), owner: self, options: nil)![0] as! Self
    }
    
}
