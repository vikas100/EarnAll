//
//  ProductDetailTableViewCell.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/16/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import HCSStarRatingView 
class ProductDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabelLight!
    @IBOutlet weak var userNameLabel: UILabelLight!

    @IBOutlet weak var dateLabel: UILabelLight!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var ratingView: HCSStarRatingView!

    @IBOutlet weak var detailLabel: UILabelLight!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
