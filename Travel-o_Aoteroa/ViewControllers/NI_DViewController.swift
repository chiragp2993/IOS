//
//  NI_DetailedViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 20/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import FaveButton


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class NI_DViewController: UIViewController,FaveButtonDelegate {

    @IBOutlet weak var NID_img: UIImageView!
    @IBOutlet weak var NID_lbl: UILabel!
    @IBOutlet weak var NID_desc: UILabel!
    @IBOutlet weak var starButton: FaveButton?
   
    
    
        
    var NI_title = String()
    
    var NI_image = UIImage()
    var NI_description=String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NID_lbl.text=NI_title
        NID_img.image=UIImage(named: NI_title)
        NID_desc.text=NI_description
        
    }
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === starButton) {
            return colors
        }
        return nil
    }
        

}
