//
//  ProductDetailViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/12/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    
    @IBOutlet weak var getButtonButtomConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ที่กินเกาะสมุย"
        detailLabel.text = "อันยอง~ Korean Dessert Cafe สไตล์เกาหลีของจริง รับประกันความอร่อยก็ตรงที่ต้องรอคิวนานเนี่ยแหละ บิงซูของที่นี่รสชาติเข้มข้น เน้นเครื่องเยอะ ทำให้เราลิ้มรสชาติความอร่อยได้อย่างเต็มที่เหมือนไปกินที่เกาหลีเลย และเมนูของหวานขึ้นชื่อของที่นี่ก็คือ injeolmi (อินจอลมิ) บิงซูโรยด้วยผงถั่วเหลือง ต๊อกอินจอล อัลมอนด์ และ Mango Cheese Bingsu บิงซูมะม่วงชีส ให้ทั้งความสดชื่นของน้ำแข็งไส บวกกับชีสเข้มข้นและมะม่วงรสหวานฉ่ำ นอกจากนี้ก็ยังมีเมนูของหวานให้เลือกกันอีกมากมาย เช่น Toast, เค้ก, เครื่องดื่ม soft drink, smooties เป็นต้น"
    }
    
    override func viewDidAppear(animated: Bool) {
//        toggleButton()
    }
    override func initView() {
        self.navigationController!.tabBarController?.tabBar.translucent = false
        
    }
    
    func toggleButton(){
        UIView.animateWithDuration(10, delay:0.1, options: .CurveEaseInOut, animations: {
            self.getButtonButtomConstraint.constant = 0
            }, completion: { (r) in
                
            }
        )
        
    }
    
}
