//
//  LevelsVC.swift
//  TurnOff
//
//  Created by Abhijit Rana on 06/04/18.
//

import UIKit

class LevelsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
    }

}

extension LevelsVC : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CellLevel = collectionView.dequeueReusableCell(withReuseIdentifier: "CellLevel", for: indexPath) as! CellLevel
        
 
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize.init()
        size.width = collectionView.frame.width  * 0.6
        size.height = size.width / 2
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
    }
        
}

