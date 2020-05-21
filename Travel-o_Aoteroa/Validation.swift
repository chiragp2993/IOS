//
//  Validation.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 3/05/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import Foundation

class Validation
{
    public func validateFname(fname: String) ->Bool {
       // Length be 18 characters max and 3 characters minimum, you can always modify.
       let nameRegex = "^\\w{3,18}$"
       let trimmedString = fname.trimmingCharacters(in: .whitespaces)
       let validateFname = NSPredicate(format: "SELF MATCHES %@", nameRegex)
       let isValidateFname = validateFname.evaluate(with: trimmedString)
       return isValidateFname
    }
    public func validateLname(lname: String) ->Bool {
       // Length be 18 characters max and 3 characters minimum, you can always modify.
       let nameRegex = "^\\w{3,18}$"
       let trimmedString = lname.trimmingCharacters(in: .whitespaces)
       let validateLname = NSPredicate(format: "SELF MATCHES %@", nameRegex)
       let isValidateLname = validateLname.evaluate(with: trimmedString)
       return isValidateLname
    }
    public func validateEmailId(emailID: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
       let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       let isValidateEmail = validateEmail.evaluate(with: trimmedString)
       return isValidateEmail
    }
    public func validatePassword(password: String) -> Bool {
       //Minimum 8 characters at least 1 Alphabet and 1 Number:
       let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
       let trimmedString = password.trimmingCharacters(in: .whitespaces)
       let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
       let isvalidatePass = validatePassord.evaluate(with: trimmedString)
       return isvalidatePass
    }
    public func validateCnfPassword(cpassword: String) -> Bool {
       //Minimum 8 characters at least 1 Alphabet and 1 Number:
       let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
       let trimmedString = cpassword.trimmingCharacters(in: .whitespaces)
       let validateCnfPassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
       let isvalidateCnfPass = validateCnfPassword.evaluate(with: trimmedString)
       return isvalidateCnfPass
    }
    
    
}
