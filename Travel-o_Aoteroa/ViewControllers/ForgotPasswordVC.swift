//
//  ForgotPasswordVC.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 26/05/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
//import ProgressHUD


class ForgotPasswordVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup_elements()
    }
    
    
    func setup_elements()
    {
        Utilities.styleTextField(txtEmail)
        Utilities.styleButton(btnReset)
    }
    
    @IBAction func btnReset(_ sender: Any)
    {
        guard let email = txtEmail.text, email != ""
            else {
            lblError.text = "Please enter valid Email"
                return
        }
        resetPassword()
        lblError.text = "Please reset your password using the link sent on your Email Address"
    }
    
    func resetPassword()
    {
        Auth.auth().sendPasswordReset(withEmail: txtEmail.text ?? "nothing") { (err) in
        //var auth = firebase.auth()
            
        if err != nil
        {
            self.lblError.text = err?.localizedDescription
        }
       
    }
}
}
