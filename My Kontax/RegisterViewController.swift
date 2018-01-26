//
//  RegisterTableViewController.swift
//  My Kontax
//
//  Created by mac on 2018/01/24.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth





class RegisterViewController: UIViewController {
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ContactNumberTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var firstName:String?
    var lastName:String?
    var contactNumber:String?
    var email:String?
    

    let db = Firestore.firestore()
    
    
    func showRegistration(){
        let alert = UIAlertController(title: "Error", message: "We are unable to create an account", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func RegisterUser(_ sender: Any) {
        var ref:DocumentReference? = nil
        
        if let firstName = FirstNameTextField.text {
            self.firstName = firstName
        }
        
        if let lastName = LastNameTextField.text {
            self.lastName = lastName
        }
        
        if let contactNumber = ContactNumberTextField.text {
            self.contactNumber = contactNumber
        }
        
        if let email = EmailTextField.text {
            self.email = email
        }
        
        var usersData = [
            "firstName": firstName,
            "lastName": lastName,
            "contactNumber": contactNumber,
            "email": email
        ]
        
        registerButton.isEnabled = false
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Auth.auth().createUser(withEmail: EmailTextField.text!, password: PasswordTextField.text!) { (user, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.registerButton.isEnabled = true
            if let user = user {
                usersData["uid"] = user.uid
                ref = self.db.collection("users").addDocument(data: usersData, completion: { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                })
                let profileChangeRequest = user.createProfileChangeRequest()
                profileChangeRequest.displayName = "\(self.firstName!) \(self.lastName!)"
                profileChangeRequest.commitChanges(completion: { (error) in
                    if let _ = error {
                        self.showRegistration()
                    }else {
                        self.performSegue(withIdentifier: "home", sender: sender)
                    }
                })
            }else {
                self.showRegistration()
            }
        }
    
        
        if let currentUser = Auth.auth().currentUser {
            print("Current User \(currentUser)")
        }
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = FirstNameTextField.text
        changeRequest?.commitChanges { (error) in
            // ...
            
        
        }
        print(FirstNameTextField.text!)
        
    }
    
    //ref = Database.database().reference()
    
}
