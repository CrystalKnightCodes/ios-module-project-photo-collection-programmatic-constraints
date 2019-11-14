//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var photo: Photo! {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    
    
    
    func setUpSubviews() {
        // Image
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageViewTop = NSLayoutConstraint(item: imageView,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: safeAreaLayoutGuide,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 4)
        let imageViewLeading = NSLayoutConstraint(item: imageView,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: safeAreaLayoutGuide,
                                                  attribute: .leading,
                                                  multiplier: 1,
                                                  constant: 4)
        let imageViewWidth = NSLayoutConstraint(item: imageView,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1,
                                                constant: 150)
        let imageViewHeight = NSLayoutConstraint(item: imageView,
                                                 attribute: .height,
                                                 relatedBy: .lessThanOrEqual,
                                                 toItem: imageView,
                                                 attribute: .width,
                                                 multiplier: 1,
                                                 constant: 0)
        
        NSLayoutConstraint.activate([imageViewTop, imageViewWidth, imageViewHeight, imageViewLeading])
        
        self.imageView = imageView
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        self.nameLabel = label
        
    }
    
    func updateViews() {
        
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
}
