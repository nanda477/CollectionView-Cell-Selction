//
//  ViewController.swift
//  Collection
//
//  Created by Ramanan D2V on 12/9/19.
//  Copyright © 2019 D2V Software Solutions pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resultLabel: UILabel!
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~step1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    var selectedIndex : Int = 999 // some dummy value
    
    var data = ["iOS", "iPhone", "iMac"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as! CollectionCell
        cell.name.text = data[indexPath.item]
        
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~step4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        if selectedIndex == indexPath.item {
            cell.backgroundColor = .blue
        }else{
            cell.backgroundColor = .white
        }
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~step2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        selectedIndex = indexPath.item
        resultLabel.text = "Selected Device: " + data[indexPath.item] + "\n" + "Selected Item: " + "\(indexPath.item)"
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~step3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    
}


