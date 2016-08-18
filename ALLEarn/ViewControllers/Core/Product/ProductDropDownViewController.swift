//
//  ProductDropDownViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

protocol ProductDropDownDelegate {
    func onDropDownSelected(index : Int, categoryName : String)
}

class ProductDropDownViewController: BaseViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate : ProductDropDownDelegate?
    let texts = ["ทั้งหมด","อาหาร และ เครื่องดื่ม", "แฟชั่น","สปา","ความงาม","ที่พัก","กีฬา","คาร์แคร์", "ประดับยนต์","กิจกรรม"]
    let images = ["all","foodCategory","fashion","spa","beauty","resident","sport","carcare","caraccessories","activity"]
  
    let imageIcon = ["allIcon","foodIcon","fashionIcon","spaIcon","beautifulIcon","residentIcon","sportIcon","carcareIcon","caraccessoriesIcon","activitiesIcon"]
    
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
        let index = indexPath.row
        
        if index == 0 {
            cell.titleLable.hidden = true
            cell.imageImageView.hidden = true
            cell.allLabel.hidden = false
        }
        else{
            cell.titleLable.hidden = false
            cell.imageImageView.hidden = false
            cell.allLabel.hidden = true
            cell.titleLable.text = texts[index]
            cell.imageImageView.image = UIImage(named: imageIcon[index])
        }
              cell.backgroundImageView.image = UIImage(named: images[index])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.bounds.width / 2)
        return CGSizeMake( size ,size)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        delegate!.onDropDownSelected(indexPath.row,categoryName: texts[indexPath.row])
        dismissViewControllerAnimated(true, completion: nil)
    }
}
