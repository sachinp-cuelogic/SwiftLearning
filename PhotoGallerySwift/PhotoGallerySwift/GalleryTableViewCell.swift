//
//  GalleryTableViewCell.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/11/15.
//  Copyright © 2015 Sachin Apps. All rights reserved.
//

import Foundation
import UIKit

protocol GalleryTableViewCellProtocol {
    
    func onImageSelected(selectedImage: UIImage)
    
}

class GalleryTableViewCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate : GalleryTableViewCellProtocol?
    
    @IBOutlet weak var galleryCollectionView : UICollectionView?
   
    var allImageData: Array = [ImageInfo]()
        
    func loadImages (let arrayImages : Array<ImageInfo>) {
        allImageData = arrayImages
        galleryCollectionView?.reloadData()
    }
    
    
    //MARK: CollectionView Delegate & Data Source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImageData.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:GalleryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCollectionViewCell", forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        let imageInfo: ImageInfo = allImageData[indexPath.row]
        
        let url: String = SERVER_URL + "/" + imageInfo.imageURL
        let serviceManager : ServiceManager = ServiceManager()
        serviceManager.getImageWithResourcePath(url, successHandler: { (imageData) -> Void in
            let image = UIImage(data: imageData)
            cell.thumbnailView?.thumbnailImageView?.image = image
            cell.actualImage = image
            }) { (error) -> Void in
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("GalleryTableViewCell: didSelectItemAtIndexPath")
        let cell:GalleryCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! GalleryCollectionViewCell
        delegate?.onImageSelected(cell.actualImage!)
    }
    
}