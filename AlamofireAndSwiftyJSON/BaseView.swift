//
//  BaseView.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-04.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class BaseView<T: Objectifiable>: UIView {
    
    var object: T?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrames()
    }
    
    private func configureFrames() {
        
    }
    
    private func commonInit() {}
    
}
