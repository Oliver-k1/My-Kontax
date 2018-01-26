//
//  DetailTableViewController.swift
//  My Kontax
//
//  Created by mac on 2018/01/19.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    

    
    
    

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var MobileNo: UILabel!
    @IBOutlet weak var Work: UILabel!
    @IBOutlet weak var HomeNo: UILabel!
    
    var contact:Contact?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contact = contact {
            fullNameLabel.text = "\(contact.firstName) \(contact.lastName)"
            MobileNo.text = "\(contact.mobile)"
            Work.text = "\(contact.work!)"
            HomeNo.text = "\(contact.home!)"
           
        }
    }



    // MARK: - Table view data source

    @IBAction func displayDialog(_ sender: Any) {
        let alertController = UIAlertController(title: "Private Call", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
            print(self.Work.text!)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    @IBAction func CallMobileBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Private Call", message: "\(self.Work.text!)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            //print(self.MobileNo.text!)

            
//            if let url2 = URL(string: "tel://\u{0023}") {
//                print(url2)
//            }
            
            if let url = URL(string: "tel://\(self.Work.text!)") {
                print(url)
                
                UIApplication.shared.openURL(url)
            }else {
                print("not a valid number")
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func CallWorkBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Private Call", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            print(self.Work.text!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func CallHomeBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Private Call", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            print(self.HomeNo.text!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        let contact = contacts[indexPath.row]
//        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
//        
//        return cell
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "kontaxdetail", sender: tableView)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "kontaxdetail" {
//            let dvc = segue.destination as! DetailTableViewController
//
//            if let indexPath =  tableView.indexPathForSelectedRow {
//                print(indexPath.row)
//                let contact = contacts[indexPath.row]
//                dvc.contact = contact
//            }
//        }
//    }
    


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
