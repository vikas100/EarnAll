//
//  ProductDropDownViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ProductDropDownViewController: BaseViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        titleColor = UIColor.blackColor()
        super.viewDidLoad()
        disableLeftBarButton()
    }
    
    // MARK: - For Dropdown
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    @IBAction func closeButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    let texts = ["ทั้งหมด","ความงาม", "อาหาร","รถยนต์","เครื่องแต่งกาย","ที่พักอาศัย", "อาหาร","รถยนต์","เครื่องแต่งกาย"]
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductDropDownViewCell", forIndexPath: indexPath) as! ProductDropDownCollectionViewCell
        cell.titleLable.text = texts[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.bounds.width / 2)
        return CGSizeMake(size  ,size)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
