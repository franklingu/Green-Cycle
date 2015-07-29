//
//  PromotionViewController.swift
//  SmartRecycle
//
//  Created by Gu Junchao on 24/7/15.
//  Copyright (c) 2015 Gu Junchao. All rights reserved.
//

import UIKit

class PromotionViewController: UITableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("showPromotion", sender: self)
        }
    }
}
