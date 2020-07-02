//
//  RegisterController.swift
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

class RegisterController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var txt_fname: UITextField!
    @IBOutlet weak var txt_lname: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_pwd: UITextField!
    @IBOutlet weak var txt_cnfpwd: UITextField!
    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var lbl_error: UILabel!
    var activeField : UITextField?
    
    
    


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup_elements()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.activeField = UITextField()
    }
    
    
    
    
    func setup_elements(){
        //lbl_error.alpha=0
        
        Utilities.styleButton(btn_signup)
        Utilities.styleTextField(txt_fname)
        Utilities.styleTextField(txt_lname)
        Utilities.styleTextField(txt_email)
        Utilities.styleTextField(txt_pwd)
        Utilities.styleTextField(txt_cnfpwd)
    }
    
    
    var validation = Validation()
    
    //Hnadling keyboard
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if(textField == txt_email)
        {
            scrollView.setContentOffset(CGPoint(x: 0,y: 200), animated: true)
            
        }
        else
        {
           
            scrollView.setContentOffset(CGPoint(x: 0,y: 200), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //txt_fname.resignFirstResponder()
        //txt_lname.resignFirstResponder()
        //txt_email.resignFirstResponder()
        //txt_pwd.resignFirstResponder()
        //txt_cnfpwd.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
    
    @objc func keyboardWillShow(notification:Notification)
       {
           guard let keyBoardinfo = notification.userInfo else {return}
           if let keyboardSize = (keyBoardinfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
           {
               let keyboardHeight = keyboardSize.height + 10
               let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
               self.scrollView.contentInset = contentInsets
               var viewRect = self.view.frame
               viewRect.size.height -= keyboardHeight
               guard let activeField = self.activeField else {return}
               if(!viewRect.contains(activeField.frame.origin))
               {
                   let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y - keyboardHeight)
                   self.scrollView.setContentOffset(scrollPoint, animated: true)
               }
               
           }
       }
       
       @objc func keyboardWillHide(notification:Notification)
       {
           let contentInsets = UIEdgeInsets.zero
           self.scrollView.contentInset = contentInsets
           
       }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        
        guard let fname = txt_fname.text, let lname = txt_lname.text, let email = txt_email.text, let password = txt_pwd.text, let cnfpassword = txt_cnfpwd.text
            else {
                return
        }
        let isValidateFname = self.validation.validateFname(fname: fname)
        if (isValidateFname == false) {
            lbl_error.text = "Incorrect First Name"
            return
        }
        let isValidateLname = self.validation.validateLname(lname: lname)
        if (isValidateLname == false) {
            lbl_error.text = "Incorrect Last Name"
            return
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false){
            lbl_error.text = "Incorrect Email Address"
            return
        }
        let isValidatePass = self.validation.validatePassword(password: password)
        if (isValidatePass == false) {
            lbl_error.text = "Minimum 8 characters at least 1 Alphabet and 1 Number"
            return
        }
        let isValidateCnfPass = self.validation.validateCnfPassword(cpassword: cnfpassword)
        if (isValidateCnfPass == false) {
            lbl_error.text = "Incorrect Password"
            return
        }
        
        
        
        if (isValidateFname == true || isValidateLname == true || isValidateEmail == true || isValidatePass == true){
            if (txt_pwd.text == txt_cnfpwd.text)
            {
                lbl_error.text = "All good"
                
                //Create User in database
                Auth.auth().createUser(withEmail: email, password: password){(result,err) in
                    
                    if err != nil
                    {
                        self.lbl_error.text = err?.localizedDescription
                    }
                    else
                    {
                        //user created successfully
                        let db = Firestore.firestore()
                        db.collection("Users").addDocument(data: [
                            "Fname" : fname,
                            "Lname" : lname,
                            "Email" : result!.user.uid]){(error) in
                                if(error != nil)
                                {
                                    self.lbl_error.text = "Error saving data"
                                }
                        }
                        self.lbl_error.text = ""
                        //Transition to Home Screen
                        self.transitHome()
                        
                    }
                }
                
                
            }
            else
            {
                lbl_error.text = "Passwords don't match!"
            }
            
        }
        
    }
    func transitHome()
    {
        let hvc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(hvc!, animated: true)
        //view.window?.rootViewController = hvc
        //view.window?.makeKeyAndVisible()
    }
    
}
