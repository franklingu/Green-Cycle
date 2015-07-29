//
//  ViewController.swift
//  SmartRecycle
//
//  Created by Gu Junchao on 9/7/15.
//  Copyright (c) 2015 Gu Junchao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let MAIN_TAB_BAR_CONTROLLER_IDENTIFIER = "mainTabBarController"

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameLabel.delegate = self
        self.passwordLabel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonPressed(sender: UIButton) {
        self.entryToMainTabBarController()
    }
    
    func entryToMainTabBarController() {
        var appDelegate: UIApplicationDelegate = UIApplication.sharedApplication().delegate!
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var entryViewController: UIViewController
        entryViewController = mainStoryboard.instantiateViewControllerWithIdentifier(self.MAIN_TAB_BAR_CONTROLLER_IDENTIFIER) as! UIViewController
        appDelegate.window?!.rootViewController = entryViewController
        appDelegate.window?!.makeKeyAndVisible()
    }

}

extension LoginViewController {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var nextResponder: UITextField? = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField
        if nextResponder != nil {
            nextResponder!.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

