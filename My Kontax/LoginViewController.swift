//
//  LoginTableViewController.swift
//  My Kontax
//
//  Created by mac on 2018/01/24.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Spring

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var userdetailsView: DesignableView!
    @IBOutlet weak var loginButton: UIButton!
    
    var username = ""
    var password = ""
    
    override func viewDidLoad() {
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let character = textField.text {
            if character != "" && PasswordTextField.text != ""{
                self.loginButton.isEnabled = true
            }else {
                self.loginButton.isEnabled = false
            }
        }
        return true
    }

    
    @IBAction func login(_ sender: Any) {
        loginButton.isEnabled = false
        if let username = EmailTextField.text {
            self.username = username
        }
        
        if let password = PasswordTextField.text {
            self.password = password
        }
        
        if username == "" ||  password == "" {
            shakeView()
            return
        }
        
        showLoginProgress()
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!) { (user, error) in
            self.loginButton.isEnabled = true
            self.hideLoginProgress()
            if let user = user {
                UserDefaults.standard.setValue(user.uid, forKey: "uid")
                UserDefaults.standard.setValue(user.displayName, forKey: "displayName")
                self.performSegue(withIdentifier: "login", sender: sender)
            }else {
                self.shakeView()
            }
        }
    }
    
    func showLoginProgress() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.startAnimating()
        containerView.isHidden = false
    }
    
    func hideLoginProgress() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.activityIndicator.stopAnimating()
        self.containerView.isHidden = true
    }
    
    func shakeView(){
        userdetailsView.animation = "shake"
        userdetailsView.duration = 1
        userdetailsView.animate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
    
}
