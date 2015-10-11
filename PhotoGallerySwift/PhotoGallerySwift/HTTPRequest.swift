//
//  HTTPRequest.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/8/15.
//  Copyright © 2015 Sachin Apps. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class HTTPRequest {
    
    func sendRequestWithResourcePath (let resourcePath:String,
        successHandler: (httpResponse: AnyObject) -> Void,
        failureHandler: (httpError:NSError) -> Void) {
        
            Alamofire.request(.GET, resourcePath).responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    successHandler(httpResponse: response.result.value!)
                }else {
                    print("Error receiving data: \(response.result.error)")
                    failureHandler(httpError: response.result.error!)
                }
                
            }
        
    }
    
    func getImageWithResourcePath (let resourcePath:String,
        successHandler: (httpResponse: AnyObject) -> Void,
        failureHandler: (httpError:NSError) -> Void) {
    
            Alamofire.request(.GET, resourcePath).response() {
                (_, _, data, error) in
                
                if((data) != nil) {
                    successHandler(httpResponse: data!)
                }else{
                    failureHandler(httpError: error!)
                }

            }
    }
    
}
