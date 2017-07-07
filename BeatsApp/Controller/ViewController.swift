//
//  ViewController.swift
//  BeatsApp
//
//  Created by Malcolm Kumwenda on 2017/07/07.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController  {
    
    lazy var colors: [UIColor] = {
        let c1 = GradientColor(.diagonal, frame: self.view.frame, colors: [UIColor.init(hexString: "#649173")! , UIColor.init(hexString: "#DBD5A4")!])
        let c2 = GradientColor(.diagonal, frame: self.view.frame, colors: [UIColor.init(hexString: "#B993D6")!, UIColor.init(hexString: "#8CA6DB")!])
        let c3 = GradientColor(.diagonal, frame: self.view.frame, colors: [UIColor.init(hexString: "#FFB88C")!, UIColor.init(hexString: "#DE6262")!])
        return [c1, c2, c3]
    }()
    
    lazy var items: [Headphone] = {
        let soloOne = Headphone(price: 899.99, name: "Beats Solo 2 (Black)", description: "", image: #imageLiteral(resourceName: "gold"), color: self.colors[0])
        let soloTwo = Headphone(price: 899.99, name: "Beats Solo 2 (Purple)", description: "", image: #imageLiteral(resourceName: "purpleV2"), color: self.colors[1])
        let soloThree = Headphone(price: 899.99, name: "Beats Solo 2 (Red)", description: "", image: #imageLiteral(resourceName: "redV2"), color: self.colors[2])
        return [soloOne, soloTwo, soloThree]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = self.colors[0]
        cv.delegate = self
        cv.dataSource = self
        cv.bounces = false
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor.black
        pc.currentPageIndicatorTintColor = UIColor.white
        pc.numberOfPages = self.items.count
        return pc
    }()
    
    let logo: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle("WISHLIST".styleTitle(), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return button
    }()
    
    var lastXPosition: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ShowcaseCell.self)
        setupViews()
    }
    
    func setupViews(){
        
        // 1. Add views
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(logo)
        view.addSubview(skipButton)
        
        // 2. Set constraints
        logo.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        skipButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 100, heightConstant: 50)
        collectionView.anchorFillSuperview()
        pageControl.anchor(nil, left: collectionView.leftAnchor, bottom: collectionView.bottomAnchor, right: collectionView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        pageControl.anchorCenterXToSuperview()
    }
    
    func animateImage(){
        
    }
    
    @objc func skip(){
        print("perform skip")
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ShowcaseCell
        cell.headphone = items[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let pageNumber = pageControl.currentPage
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.curveEaseIn], animations: {
           self.collectionView.backgroundColor = self.items[pageNumber].color.withAlphaComponent(0.5)
        }, completion:nil)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        UIView.animate(withDuration: 1, animations: {
            self.collectionView.backgroundColor = self.items[pageNumber].color
        })
    }
    
}




