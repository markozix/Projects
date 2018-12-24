//
//  BlurSignUpView.swift
//  ReserveYourSpot
//
//  Created by Marko Vukicevic on 8/6/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import UIKit

@IBDesignable class BlurSignUpView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
   
}
