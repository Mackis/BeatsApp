//
//  ShowcaseCell.swift
//  BeatsApp
//
//  Created by Malcolm Kumwenda on 2017/07/07.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

class ShowcaseCell: UICollectionViewCell {
    
    let descriptionView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.4
        v.layer.shadowOffset = CGSize(width: 5, height: 7)
        v.clipsToBounds = false
        return v
    }()
    
    let wishListView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        v.layer.cornerRadius = 8
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.4
        v.layer.shadowOffset = CGSize(width: 5, height: 7)
        return v
    }()
    
    let wishListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle("WISH LIST".styleTitle(), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(wishList), for: .touchUpInside)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 18
        return button
    }()
    
    let itemImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "redV2")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = "Beats Solo 2".styleHeading()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.attributedText = "R 1,499.00".stylePrice()
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.attributedText = "Beats and Apple are changing the way you listen to music with the introduction of Apple W1 technology in Beats Solo3 Wireless. Incorporating the incredible W1 chip brings seamless setup and switching for your Apple devices.".styleBody()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    var headphone: Headphone?  {
        didSet {
            self.setupViews()
        }
    }
    
    func setupViews(){
        // 1. Add subviews
        addSubview(wishListView)
        addSubview(descriptionView)
        addSubview(wishListButton)
        addSubview(itemImage)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        
        // 2. Set up constraints
        descriptionView.anchorCenterSuperview()
        descriptionView.anchor(nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 250)
        
        itemImage.anchor(nil, left: nil, bottom: descriptionView.topAnchor, right: descriptionView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -120, rightConstant: -30, widthConstant: 200, heightConstant: 200)
        
        titleLabel.anchor(descriptionView.topAnchor, left: descriptionView.leftAnchor, bottom: nil, right: nil, topConstant: 40, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 30)
        
        priceLabel.anchor(titleLabel.bottomAnchor, left: descriptionView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 40)
        
        descriptionLabel.anchor(priceLabel.bottomAnchor, left: descriptionView.leftAnchor, bottom: descriptionView.bottomAnchor, right: descriptionView.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        wishListView.anchor(descriptionView.bottomAnchor, left: descriptionView.leftAnchor, bottom: nil, right: descriptionView.rightAnchor, topConstant: -10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 80)
        
        wishListButton.anchor(nil, left: wishListView.leftAnchor, bottom: wishListView.bottomAnchor, right: wishListView.rightAnchor, topConstant: 0, leftConstant: 40, bottomConstant: 16, rightConstant: 40, widthConstant: 0, heightConstant: 36)
        
        updateUI()
    }
    
    func updateUI(){
        guard let headphone = headphone else {return}
        itemImage.image = headphone.image
        
    }
    
    @objc func wishList(){
        
    }
}
