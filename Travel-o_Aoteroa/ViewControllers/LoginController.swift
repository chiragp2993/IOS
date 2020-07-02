//
//  LoginController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 2/05/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth


class LoginController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_pwd: UITextField!
    @IBOutlet weak var lbl_error: UILabel!
    @IBOutlet weak var btn_login: UIButton!
    var validation = Validation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup_elements()
    }
    
    
    func setup_elements()
    {
        Utilities.styleTextField(txt_email)
        Utilities.styleTextField(txt_pwd)
        Utilities.styleButton(btn_login)
        
    }
    
    
    
    //Hnadling keyboard
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == txt_email)
        {
            scrollView.setContentOffset(CGPoint(x: 0,y: 250), animated: true)
            
        }
        else
        {
            scrollView.setContentOffset(CGPoint(x: 0,y: 250), animated: true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txt_email.resignFirstResponder()
        txt_pwd.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
    
    
    
    
    @IBAction func loginTapped(_ sender: Any)
    {
        guard let email = txt_email.text, let password = txt_pwd.text
            else
        {
            return
        }
        
        
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false)
        {
            lbl_error.text = "Email Address is invalid"
            return
        }
        
        
        
        
        
        if (isValidateEmail == true)
        {
            
            //SignIn User in database
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if error != nil
                {
                    self.lbl_error.text = error?.localizedDescription
                }
                else
                {
                    
                    self.lbl_error.text = ""
                    //Transition to Home Screen
                    self.transitHome()
                    
                }
            }
        }
    }
    
    
    
    
    func transitHome()
    {
        let hvc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(hvc!, animated: true)
    }
    
    
    
    
    
}
