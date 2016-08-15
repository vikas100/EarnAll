//
//  ProductFilterUITableViewCell.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/10/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ProductFilterUITableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabelBold!
    @IBOutlet weak var dateLabel: UILabelLight!
    @IBOutlet weak var viewNumberLabel: UILabelBold!
    @IBOutlet weak var usedNumberLabel: UILabelBold!

    @IBOutlet weak var donateNumberLabel: UILabelBold!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var ratingStarRatingView: HCSStarRatingView!
    @IBOutlet weak var imageStoreImageView: UIImageView!
    @IBOutlet weak var imageContentImageView: UIImageView!
    @IBOutlet weak var rootView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
