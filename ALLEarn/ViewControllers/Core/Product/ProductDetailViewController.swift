//
//  ProductDetailViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var donateLabel: UILabelBold!
    @IBOutlet weak var pagingPageControl: UIPageControl!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var gPlusShareLabel: UILabelBold!
    @IBOutlet weak var twitterShareLabel: UILabelBold!
    @IBOutlet weak var facebookShareLabel: UILabelBold!
    @IBOutlet weak var usedLabel: UILabelBold!
    @IBOutlet weak var viewNumberLabel: UILabelBold!
    @IBOutlet weak var dateLabel: UILabelLight!
    @IBOutlet weak var brandTitleLabel: UILabelBold!
    @IBOutlet weak var titleLabel: UILabelBold!
    @IBOutlet weak var getButtonButtomConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        AppDelegate.drawer?.leftDrawerViewControlle
        title = "Seobinggo (서빙고 / ซอบิงโก)"
        
        brandTitleLabel.text = "Seobinggo (서빙고 / ซอบิงโก)"
        dateLabel.text = "ภายใน " + "8/9/59"
        brandImageView.image = UIImage(named: "test")
        titleLabel.text = "อันยอง~ Korean Dessert Cafe สไตล์เกาหลีของจริง รับประกันความอร่อยก็ตรงที่ต้องรอคิวนานเนี่ยแหละ"
        detailLabel.text = "อันยอง~ Korean Dessert Cafe สไตล์เกาหลีของจริง รับประกันความอร่อยก็ตรงที่ต้องรอคิวนานเนี่ยแหละ บิงซูของที่นี่รสชาติเข้มข้น เน้นเครื่องเยอะ ทำให้เราลิ้มรสชาติความอร่อยได้อย่างเต็มที่เหมือนไปกินที่เกาหลีเลย และเมนูของหวานขึ้นชื่อของที่นี่ก็คือ injeolmi (อินจอลมิ) บิงซูโรยด้วยผงถั่วเหลือง ต๊อกอินจอล อัลมอนด์ และ Mango Cheese Bingsu บิงซูมะม่วงชีส ให้ทั้งความสดชื่นของน้ำแข็งไส บวกกับชีสเข้มข้นและมะม่วงรสหวานฉ่ำ นอกจากนี้ก็ยังมีเมนูของหวานให้เลือกกันอีกมากมาย เช่น Toast, เค้ก, เครื่องดื่ม soft drink, smooties เป็นต้น"
    }
    
    override func viewDidAppear(animated: Bool) {
        //        toggleButton()
    }
    override func initView() {
         AppDelegate.drawer?.openDrawerGestureModeMask  = .None
        self.navigationController!.tabBarController?.tabBar.translucent = false
        
    }
    
    func toggleButton(){
        UIView.animateWithDuration(10, delay:0.1, options: .CurveEaseInOut, animations: {
            self.getButtonButtomConstraint.constant = 0
            }, completion: { (r) in
                
            }
        )
        
    }
    
    var index = 0
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
         index = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
        pagingPageControl.currentPage = index
    }
    
    // MARK: Image Collection View
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductDetailCollectionViewCell", forIndexPath: indexPath) as! ProductDetailCollectionViewCell
        cell.imageImageView.image = UIImage(named: "test")
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.bounds.width)
        return CGSizeMake(size  ,180)
    }
    
    
    
    
}
