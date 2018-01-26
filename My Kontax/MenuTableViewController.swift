//
//  MenuTableViewController.swift
//  My Kontax
//
//  Created by mac on 2018/01/24.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MenuTableViewController: UITableViewController {

    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var UserLoggedInName: UILabel!
    
    let db = Firestore.firestore()
    
    var firstName:String?
    var lastName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let displayName = UserDefaults.standard.value(forKey: "displayName") {
            UserLoggedInName.text = "\(displayName)"
        }
    }
        
//        self.UserLoggedInName.text = ""
//        self.contactNumberLabel.text = ""
//
//        if let currentUser = Auth.auth().currentUser {
//            print("Logged uid \(currentUser.uid)")
//            let query = db.collection("users").whereField("uid", isEqualTo: currentUser.uid)
//            query.limit(to: 1).getDocuments(completion: { (querySnapShot, error) in
//                if let querySnapShot = querySnapShot {
//                    let document = querySnapShot.documents
//                    if document.count > 0 {
//                        let userData = document[0].data()
//
//
//
//                        self.firstName = "\(userData["firstName"]!)"
//                        self.lastName = "\(userData["lastName"]!)"
//
//
//
//
//
//                        self.UserLoggedInName.text = "\(self.firstName!) \(self.lastName!)"
//                        self.contactNumberLabel.text = "\(userData["contactNumber"]!)"
//                    }
//                }
//            })
    
        
//        db.collection("users").getDocuments(completion: { (querySnapShot, error) in
//            if let error = error {
//                print("Error \(error.localizedDescription)")
//                return
//            }
//
//            if let querySnapShot = querySnapShot {
//                for document in querySnapShot.documents {
//                    let usersData = document.data()
//                    print(usersData)
//                    print(usersData["contactNumber"])
//                }
//            }
//        })
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    
//    override func viewWillAppear(_ animated: Bool) {
//        print("ViewWollAppear")
//         handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                // The user's ID, unique to the Firebase project.
//                // Do NOT use this value to authenticate with your backend server,
//                // if you have one. Use getTokenWithCompletion:completion: instead.
//                let uid = user.uid
//                let email = user.email
//                let photoURL = user.photoURL
//                print(email)
//
//
//
//
//                if let displayName = user.displayName {
//                    print(displayName)
//                    self.UserLoggedInName.text = displayName
//                }
//
//
//
////                let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]
////                cell?.textLabel?.text = userInfo?.providerID
////                // Provider-specific UID
////                cell?.detailTextLabel?.text = userInfo?.uid
//
//
//
//
//            }
//        }
//    }
    
    
    @IBAction func LogoutBtn(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }catch {
            
        }
    }
    
    
}
