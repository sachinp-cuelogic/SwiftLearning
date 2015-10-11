//
//  ServiceManager.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/9/15.
//  Copyright © 2015 Sachin Apps. All rights reserved.
//

import Foundation


class ServiceManager {
    
    func getImageDataWithResourcePath(let resourcePath: String,
        successHandler: (imageData: ImageData) -> Void,
        failureHandler: (error:NSError) -> Void) {
        
        let httpRequest:HTTPRequest = HTTPRequest()
        httpRequest.sendRequestWithResourcePath (resourcePath, successHandler: { (httpResponse) -> Void in
            let imgData : ImageData = ImageDataParser().getImageDataFromResponse(httpResponse)
            successHandler(imageData: imgData)
            } ) { (httpError) ->Void in
                failureHandler(error: httpError)
         }
    }
    
    
    func getImageWithResourcePath(let resourcePath: String,
        successHandler: (imageData: NSData) -> Void,
        failureHandler: (error:NSError) -> Void) {
            
            let httpRequest:HTTPRequest = HTTPRequest()
            httpRequest.getImageWithResourcePath (resourcePath, successHandler: { (httpResponse) -> Void in
                successHandler(imageData: httpResponse as! NSData)
                } ) { (httpError) ->Void in
                    failureHandler(error: httpError)
            }
    }
    
}
