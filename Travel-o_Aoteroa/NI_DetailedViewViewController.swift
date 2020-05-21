//
//  NI_DetailedViewViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 19/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit

class NI_DetailedViewViewController: UIViewController {
    
    
    @IBOutlet weak var NI_title: UILabel!
    @IBOutlet weak var NI_img: UIImageView!
    @IBOutlet weak var NI_desc: UILabel!
    
    var Image = UIImage()
    var lbl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        NI_img.image = Image
        NI_title.text=lbl
        
  

}
}
