//
//  GameVC.swift
//  TurnOff
//
//  Created by Abhijit Rana on 06/04/18.
//

import UIKit




class GameVC: UIViewController {

    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    let itemsInRow = 4
 
    
    
    
    
    
    //-----------
    
    //    0  1  2  3
    //    4  5  6  7
    //    8  9  10 11
    //    12 13 14 15
    
    //    var selectionFlags : [Int] = [0,0,1,0,
    //                                  1,1,1,0,
    //                                  0,0,1,0,
    //                                  0,0,0,0]
    
//    var selectionFlags : [Int] = [0,0,0,0,
//                                  1,1,1,1,
//                                  1,1,1,1,
//                                  0,0,0,0]
    
        var selectionFlags : [Int] = [1,0,1,0,
                                      0,0,0,1,
                                      1,0,0,0,
                                      0,1,0,1]
    
    
    var adjacentMap : [String : Any] = [
        "switch_0" : [1,4,5],
        "switch_1"  : [0,4,5,6,2],
        "switch_2"  : [1,5,6,7,3],
        "switch_3"  : [2,6,7],
        "switch_4"  : [0,1,5,9,8],
        "switch_5"  : [0,1,2,6,10,9,8,4],
        "switch_6"  : [1,2,3,7,11,10,9,5],
        "switch_7"  : [2,6,10,11,3],
        "switch_8"  : [4,5,9,13,12],
        "switch_9"  : [4,5,6,10,14,13,12,8],
        "switch_10" : [5,6,7,11,15,14,13,9],
        "switch_11" : [6,10,14,15,7],
        "switch_12" : [8,9,13],
        "switch_13" : [8,9,10,14,12],
        "switch_14" : [9,10,11,15,13],
        "switch_15" : [10,11,14]
    ]
 
    
    
    //--------------


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.bgColor
        self.view.applyGradient()
        
        self.boardCollectionView.backgroundColor = UIColor.containerColor
        self.boardCollectionView.layer.cornerRadius = 10
        
        self.boardCollectionView.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
             self.boardCollectionView.alpha = 1
        }) { (finished) in
            
        }
        
    }
 
}

extension GameVC : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (itemsInRow * itemsInRow)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CellSwitch = collectionView.dequeueReusableCell(withReuseIdentifier: "CellSwitch", for: indexPath) as! CellSwitch
        
         let selectFlag = selectionFlags[indexPath.row]
        if selectFlag == 0 {
            cell.containerView.backgroundColor = UIColor.onColor
        }else{
            cell.containerView.backgroundColor = UIColor.offColor
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize.init()
        size.width = collectionView.frame.width / CGFloat(itemsInRow)
        size.height = size.width
 
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        self.changeSwitch(index: indexPath.row)
        collectionView.reloadData()
        
        print(indexPath.row)
        
    }
    
    func changeSwitch(index : Int) {
//        if (selectionFlags[index] == 0){
//            selectionFlags[index] = 1
//        }else{
//            selectionFlags[index] = 0
//        }
        
        let switch_key = "switch_" + String(index)
        
        let adjacentArr : [Int] = adjacentMap[switch_key] as! [Int]
        
        for idx in adjacentArr {
            if (selectionFlags[idx] == 0){
                selectionFlags[idx] = 1
            }else{
                selectionFlags[idx] = 0
            }
        }
        
    }
    
    
}

