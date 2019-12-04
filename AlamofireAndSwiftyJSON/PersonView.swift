//
//  PersonView.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class PersonView: BaseView<Person> {
    
    override var object: Person? {
        didSet {
            headerLabel.text = object?.headline
            valueLabel.text = object?.name
        }
    }

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        }
    }
    
    @IBOutlet weak var valueLabel: UILabel! {
        didSet {
            headerLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        }
    }
    
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
    
    private func commonInit() {
        
    }
    
}
