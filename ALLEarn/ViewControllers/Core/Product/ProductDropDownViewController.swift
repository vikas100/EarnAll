//
//  ProductDropDownViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ProductDropDownViewController: BaseViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    let texts = ["ทั้งหมด","อาหาร และ เครื่องดื่ม", "แฟชั่น","กีฬา","ที่พัก","คาร์แคร์", "ประดับยนต์","สปา","กิจกรรม"]
    
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
        return texts.count
    }
    
    @IBAction func closeButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
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
