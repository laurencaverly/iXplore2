//
//  LoginViewController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username: String?
    var password: String?
    
    let oldUsers = PersistenceManager.loadObject("user.archive")

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(sender: UIButton) {
        print("Log In button tapped")
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        let user = User(username: username, password: password)
        
        for object in oldUsers as
    }
    

}
