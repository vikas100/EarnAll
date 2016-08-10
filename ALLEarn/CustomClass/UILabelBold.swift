//
//  UILabelExcelBKK.swift
//  SiamPiwat
//
//  Created by o.c on 3/2/2559 BE.
//  Copyright © 2559 o.c. All rights reserved.
//

import UIKit

class UILabelBold: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         self.font = UIFont(name: "SukhumvitSet-Bold", size: self.font!.pointSize)
          }
   
    
}
