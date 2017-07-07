//
//  String+Styles.swift
//  BeatsApp
//
//  Created by Malcolm Kumwenda on 2017/07/07.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit
import BonMot

extension String {
    func styleTitle() -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont(name: "Futura", size: 18)!),
            .color(UIColor.white)
        )
        
        let attributedString = self.styled(with: style)
        return attributedString
    }
    
    func styleHeading() -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont(name: "Avenir-Black", size: 20)!),
            .color(UIColor.red)
        )
        
        let attributedString = self.styled(with: style)
        return attributedString
    }
    
    func stylePrice() -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont(name: "Avenir-Black", size: 24)!),
            .color(UIColor.lightGray)
        )
        
        let attributedString = self.styled(with: style)
        return attributedString
    }
    
    func styleBody() -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont(name: "Avenir", size: 14)!),
            .color(UIColor.flatBlack)
        )
        
        let attributedString = self.styled(with: style)
        return attributedString
    }
    
}

