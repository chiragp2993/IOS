//
//  ViewCell_1.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 10/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit

class ViewCell_1: UICollectionViewCell {

    @IBOutlet weak var vc_1: UIView!
    @IBOutlet weak var img_vc1: UIImageView!
    @IBOutlet weak var lbl_vc1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img_vc1.layer.cornerRadius=6
        img_vc1.layer.masksToBounds=true
    }

}
