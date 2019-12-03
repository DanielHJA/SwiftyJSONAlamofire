//
//  WebService.swift
//  AlamofireAndSwiftyJSON
//
//  Created by Daniel Hjärtström on 2019-12-03.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WebService: NSObject {

    class func fetch(urlString: String, completion: @escaping (Swift.Result<JSON, Error>) -> ()) {
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            
            if let error = response.error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            if let data = response.data {
                
                let json: JSON
                
                do {
                    json = try JSON(data: data)
                    completion(.success(json))
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    
}
