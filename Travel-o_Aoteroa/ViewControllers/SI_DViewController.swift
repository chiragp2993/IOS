//
//  SI_DetailedViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 23/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import FaveButton



class SI_DViewController: UIViewController {

    @IBOutlet weak var SID_img: UIImageView!
    @IBOutlet weak var SID_lbl: UILabel!
    @IBOutlet weak var SID_desc: UILabel!
    @IBOutlet weak var starButton: FaveButton?
    
    
    
    
    var SI_title = String()
    var SI_image = UIImage()
    var SI_description = String()
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SID_lbl.text=SI_title
        SID_img.image=UIImage(named: SI_title)
        SID_desc.text=SI_description
    
        
        
    }
    
}

   

