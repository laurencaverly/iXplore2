//
//  RegistrationViewController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        print("Register button tapped")
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        let user = User(username: username, password: password)
        
        
        if let existingArray = PersistenceManager.loadNSArray("user.archive") {
            
            existingArray.arrayByAddingObject(user)
            PersistenceManager.saveNSArray(existingArray, fileName: "user.archive")
            
            self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            
            var newArray = [User]()
            newArray.append(user)
            PersistenceManager.saveNSArray(newArray, fileName: "user.archive")
            
            let msc = MainScreenController(nibName: "MainScreenController", bundle: nil)
            self.navigationController?.pushViewController(msc, animated: true)
            
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.navigateToMainScreenController()
            
        }
        
        
    }

    

}
