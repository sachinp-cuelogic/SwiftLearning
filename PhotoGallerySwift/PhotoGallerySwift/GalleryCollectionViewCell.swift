//
//  GalleryCollectionViewCell.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/11/15.
//  Copyright © 2015 Sachin Softwares. All rights reserved.
//

import Foundation
import UIKit

class GalleryCollectionViewCell : UICollectionViewCell  {
    
    @IBOutlet weak var thumbnailView : ThumbnailView?
    var actualImage: UIImage?
    override func awakeFromNib() {
        thumbnailView?.layer.cornerRadius = 5.0
        thumbnailView?.clipsToBounds = true
    }
}