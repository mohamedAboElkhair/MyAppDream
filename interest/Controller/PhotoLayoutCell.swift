//
//  PhotoLayoutCell.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 6/24/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import UIKit

class PhotoLayoutCell: UICollectionViewCell {
    
     var image:UIImage!{
          didSet{
              imageView.image = image
          }
      }
      
      
      fileprivate let imageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 12
   
          imageView.clipsToBounds = true
        
        
          return imageView
      }()
      
      fileprivate lazy var verticalStackView: UIStackView = {
          let stack = UIStackView(arrangedSubviews: [imageView, horizontalStackView])
          stack.axis = .vertical
          return stack
      }()
      
      fileprivate let label: UILabel = {
         let label = UILabel()
          label.text = "ITalkWithComputer.com"
          label.textColor = .white
          label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
          return label
      }()
      
      fileprivate lazy var horizontalStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [label])
                stack.translatesAutoresizingMaskIntoConstraints = false
                stack.axis = .horizontal
            return stack
        }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
        
          contentView.addSubview(verticalStackView)
          verticalStackView.frame = contentView.frame
          verticalStackView.translatesAutoresizingMaskIntoConstraints = false
          verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
          verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
          verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
          verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
      
          horizontalStackView.heightAnchor.constraint(equalToConstant: 26).isActive = true
      }
      
      override func layoutSubviews() {
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4))
      }

      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
