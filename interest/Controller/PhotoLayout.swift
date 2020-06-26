//
//  PhotoLayout.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 6/24/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import UIKit
protocol PhotoLayoutDelegate: AnyObject {
    func collectionView (_ collectionView: UICollectionView, numberOfColumns:Int, heightForPhotoAtIndexPath indexPath:IndexPath )->CGFloat
    
}

class PhotoLayout : UICollectionViewFlowLayout {
    
    
    weak var delegate: PhotoLayoutDelegate!
   
    var cacha = [UICollectionViewLayoutAttributes]()
    
    fileprivate let numberOfColumns = 2
      private let cellPadding: CGFloat = 6
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth : CGFloat {
        guard let collectionView = collectionView else {return 0.0}
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    override var collectionViewContentSize: CGSize {
      return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collection = collectionView else {return }
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        var yOffset = [CGFloat](repeating: 20, count: numberOfColumns)
        for column in 0 ..< numberOfColumns{
            xOffset.append(CGFloat(column) * columnWidth )
        }
        var columnToPlacePhoto = 0
        
        for item in 0 ..< collection.numberOfItems(inSection: 0){
            
        let  indexPath = IndexPath(item: item, section: 0)
            
            
            
            let photoHight: CGFloat = delegate.collectionView(collection, numberOfColumns: numberOfColumns, heightForPhotoAtIndexPath: indexPath)
             let height = cellPadding * 2 + photoHight
            
        let frame = CGRect(x: xOffset[columnToPlacePhoto], y: yOffset[columnToPlacePhoto], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
              
            // 5
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame

      
        self.cacha.append(attributes)
            
             contentHeight = max(contentHeight, frame.maxY)
        yOffset[columnToPlacePhoto] = yOffset[columnToPlacePhoto] + photoHight

        columnToPlacePhoto = columnToPlacePhoto < (numberOfColumns - 1 ) ? (columnToPlacePhoto + 1): 0
            
            // 6
//                 contentHeight = max(contentHeight, frame.maxY)
//                 yOffset[columnToPlacePhoto] = yOffset[columnToPlacePhoto] + height
//
//                 columnToPlacePhoto = columnToPlacePhoto < (numberOfColumns - 1) ? (columnToPlacePhoto + 1) : 0
        }
        
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes =  [UICollectionViewLayoutAttributes]()
      
        return cacha
    }
}
