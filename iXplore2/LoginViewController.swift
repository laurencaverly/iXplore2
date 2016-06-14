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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        username = usernameTextField.text
        password = passwordTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(sender: UIButton) {
        print("Log In button tapped")
        
            if username != nil && password != nil {
        
            let msc = MainScreenController(nibName: "MainScreenController", bundle: nil)
            self.navigationController?.pushViewController(msc, animated: true)
        
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
            appDelegate.navigateToMainScreenController()
        }
    }
    

}
