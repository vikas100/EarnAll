//
//  UILabelLight.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/11/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit

class UILabelLight: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.font = UIFont(name: "SukhumvitSet-Medium", size: self.font!.pointSize)
    }
    
    


}
