//
//  Onboarding.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class Onboarding: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        print("Log In button tapped")
        
        let lvc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(lvc, animated: true)
        
    }

    @IBAction func registerButtonTapped(sender: UIButton) {
        
        print("Register button tapped")
        
        let rvc = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    

}
