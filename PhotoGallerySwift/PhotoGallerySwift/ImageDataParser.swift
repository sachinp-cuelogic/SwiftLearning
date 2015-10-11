//
//  ImageDataParser.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/10/15.
//  Copyright © 2015 Sachin Apps. All rights reserved.
//

import Foundation

class ImageDataParser {
    
    func getImageDataFromResponse (response: AnyObject) -> ImageData {
        print("ImageDataParser : getImageDataFromResponse()")
       
        let imageData: ImageData = ImageData()
        
        if let responseDict : Dictionary = response as? Dictionary<String, AnyObject> {
            var allCategoryArr : Array = [ImageCategoryData]()

            let keys = Array (responseDict.keys)
            print("All Keys : \(keys)")
            
            for key:String in keys {
                var allImageInfoArr: Array = [ImageInfo]()
                let categoryData : ImageCategoryData = ImageCategoryData()
                categoryData.categoryName = key

                if let imageArray = responseDict[key] as? [[String : AnyObject]] {
                
                    for categoryDict:Dictionary in imageArray {
                        let imageName = categoryDict["name"] as! String
                        let imageURL = categoryDict["imgURL"] as! String
                        
                        let imageInfo : ImageInfo = ImageInfo()
                        imageInfo.imageName = imageName
                        imageInfo.imageURL = imageURL
                        
                        allImageInfoArr.append(imageInfo)
                        
                    }
                    categoryData.allImageInfo = allImageInfoArr
                    allCategoryArr.append(categoryData)
                }
            }
            imageData.allImageData = allCategoryArr            
        }
      
        return imageData
    }
    
}
