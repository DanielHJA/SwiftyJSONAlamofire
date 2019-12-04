//
//  ViewController.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var personViews = [PersonView]()
    
    private lazy var verticalView: VerticalView = {
        let temp = VerticalView.loadNib()
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        temp.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://demo6427581.mockable.io/"
        WebService.fetch(urlString: url) { [weak self] result in
            switch result {
            case .success(let json):
                let people = Person.arrayFromJSON(json)
                
                for person in people {
                    let view = PersonView.makeView(object: person)
                    self?.personViews.append(view)
                    self?.verticalView.stackView.addArrangedSubview(view)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

