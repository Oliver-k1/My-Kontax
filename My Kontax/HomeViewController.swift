//
//  HomeViewController.swift
//  My Kontax
//
//  Created by mac on 2018/01/19.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        if let uid = UserDefaults.standard.value(forKey: "uid"){
            print(uid)
        }else {
            print("Value not found")
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let contact = Contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "kontaxdetail", sender: tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "kontaxdetail" {
            let dvc = segue.destination as! DetailTableViewController
            
            if let indexPath =  tableView.indexPathForSelectedRow {
                print(indexPath.row)
                let contact = Contacts[indexPath.row]
                dvc.contact = contact
            }
        }
    }
}
