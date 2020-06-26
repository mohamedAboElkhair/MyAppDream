
//  HomeViewController.swift
//  interest
//  Created by Mohamed AbouElkhair on 1/11/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.

import UIKit
import Alamofire



class HomeViewController: UIViewController {
//    let getCategory = CategoryModel()
        
    fileprivate var images: [String] = ["photo1","photo2","photo3","photo4","photo5","photo6","photo7"
    ,"photo10","photo8","photo9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   // getCategory.getCategory()
    
   let layout = PhotoLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collection.register(PhotoLayoutCell.self, forCellWithReuseIdentifier: "Cell")
        collection.dataSource = self
        if let layout = collection.collectionViewLayout as? PhotoLayout{
            layout.delegate = self
        }
         view.addSubview(collection)

    }
    // MARK: - Table view data source
}

extension HomeViewController:PhotoLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfColumns: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
       let image = UIImage(named: self.images[indexPath.item])!
               let imageHeight = image.size.height
               let imageWidth = image.size.width
               let columnRatio:CGFloat = 1/CGFloat(numberOfColumns)
               let imageSizeRation = (collectionView.frame.width * columnRatio) / imageWidth
               let heightIm = imageHeight * imageSizeRation
               return heightIm
    }
    
    
}
extension HomeViewController :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
              as! PhotoLayoutCell
              let image = UIImage(named: self.images[indexPath.row])
              cell.image = image
        
              return cell
      
    }
    
    
}
    

