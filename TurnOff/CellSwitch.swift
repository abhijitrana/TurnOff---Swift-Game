//
//  CellSwitch.swift
//  TurnOff
//
//  Created by Abhijit Rana on 06/04/18.
//

import UIKit

class CellSwitch: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius  = 10
    }
 
}
