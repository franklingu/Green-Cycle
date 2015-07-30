//
//  RedempationViewController.swift
//  SmartRecycle
//
//  Created by Gu Junchao on 30/7/15.
//  Copyright (c) 2015 Gu Junchao. All rights reserved.
//

import UIKit

class RedempationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirmButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Redeem voucher for Body Shop", message: "The voucher is stored on your MasterCard", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true) { () -> Void in
            
        }
    }
    
}
