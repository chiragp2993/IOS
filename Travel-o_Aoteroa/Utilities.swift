//
//  Utilities.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 2/05/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import Foundation

class Utilities{
    
    static func styleTextField(_ textfield:UITextField) {
        
        textfield.layer.cornerRadius=12
        
        
    }
    static func styleButton(_ button:UIButton){
        button.layer.cornerRadius=12
        button.backgroundColor = UIColor(red: 88/255, green:
        86/255, blue: 214/255, alpha: 1)
        button.titleLabel?.font =  UIFont(name: "Futura", size: 16)
        //button.titleLabel?.textColor = UIColor(name: "FFFFFF")
        //button.titleLabel?.textColor = UIColor.white
        //button.setTitleColor(UIColor.whiteColor(), for: normal)
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
}

    
 
