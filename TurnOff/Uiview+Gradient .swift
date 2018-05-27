//
//  Uiview+Gradient .swift
//  TurnOff
//
//  Created by Abhijit Rana on 06/04/18.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.bgColor,
                           UIColor.containerColor,
                           UIColor.bgColor]   // your colors go here
        gradient.locations = [0.0,0.5, 1.0]
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}

