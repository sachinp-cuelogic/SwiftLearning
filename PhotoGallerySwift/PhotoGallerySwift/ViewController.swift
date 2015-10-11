//
//  ViewController.swift
//  PhotoGallerySwift
//
//  Created by Sachin Patil on 10/8/15.
//  Copyright © 2015 Sachin Apps. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, GalleryTableViewCellProtocol {

    //Outlets
    @IBOutlet weak var tableView:  UITableView?
    @IBOutlet weak var imageView: UIImageView?
    
    //Variables
    var allImageCategories  = [ImageCategoryData]()
    var galleryTableViewCell:GalleryTableViewCell?
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: viewDidLoad")
        loadImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    //MARK: Helper Functions
    func loadImages() {
        let serviceManager : ServiceManager = ServiceManager()
        serviceManager.getImageDataWithResourcePath(SERVER_URL + SERVICE_PATH, successHandler: { (imageData) -> Void in
            print("Successfully received the data")
            self.allImageCategories = imageData.allImageData
            self.tableView?.reloadData()
            }) { (error) -> Void in
                print("Failed to receive the data")
        }
    }

        
    //MARK: TableView Delegate & DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.allImageCategories.count
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoryData:ImageCategoryData = self.allImageCategories[section]
        let categoryName : String = categoryData.categoryName.capitalizedString
        return categoryName
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : GalleryTableViewCell = tableView.dequeueReusableCellWithIdentifier("GalleryTableViewCell", forIndexPath: indexPath) as! GalleryTableViewCell
        cell.delegate = self
        let categoryData:ImageCategoryData = self.allImageCategories[indexPath.section]
        cell.loadImages(categoryData.allImageInfo)
        return cell
    }

    
    //MARK: GalleryTableViewCell Protocol    
    func onImageSelected(selectedImage: UIImage) {
        imageView?.image = selectedImage
    }

}

