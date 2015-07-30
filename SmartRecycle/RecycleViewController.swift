//
//  RecycleViewController.swift
//  SmartRecycle
//
//  Created by Gu Junchao on 9/7/15.
//  Copyright (c) 2015 Gu Junchao. All rights reserved.
//

import UIKit
import MTBBarcodeScanner
import MBProgressHUD

class RecycleViewController: UIViewController {
    
    var scanner: MTBBarcodeScanner?
    var successView: UIView?
    var singleTabRecognizerOnSuccessView: UITapGestureRecognizer?
    
    @IBOutlet weak var capturedImageView: UIImageView!
    @IBOutlet weak var preview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var successView = NSBundle.mainBundle().loadNibNamed("SuccessView", owner: nil, options: nil)[0] as? UIView
        successView?.frame = self.view.frame
        self.successView = successView
        var singleTabGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleSingleTabGestureOnSuccessView:"))
        singleTabGestureRecognizer.numberOfTapsRequired = 1
        successView?.addGestureRecognizer(singleTabGestureRecognizer)
        self.singleTabRecognizerOnSuccessView = singleTabGestureRecognizer
        self.scanner = MTBBarcodeScanner(previewView: self.preview)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        MTBBarcodeScanner.requestCameraPermissionWithSuccess { (isSuccessful) -> Void in
            if isSuccessful && !self.scanner!.isScanning() {
                self.scanner?.startScanningWithResultBlock({ (codes) -> Void in
                    var readable = codes.first as? AVMetadataMachineReadableCodeObject
                    println(readable!.stringValue)
                    
                    self.captureCurrentPreview()
                    
                    self.scanner?.stopScanning()
                    
                    self.preview.hidden = true
                    self.capturedImageView.hidden = false
                    self.qrscannerHandling()
                })
            } else {
                
            }
        }
    }
    
    func captureCurrentPreview() {
        let size = self.preview.layer.bounds.size
        UIGraphicsBeginImageContext(size)
        let imageContext = UIGraphicsGetCurrentContext()
        self.preview.layer.renderInContext(imageContext)
        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.capturedImageView.image = capturedImage
    }
    
    func qrscannerHandling() {
        let alertController = UIAlertController(title: "You are at NEA Recycle Bin 2337", message: "Place your recyclables into the bin", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.processInputWeight()
        }))
        self.presentViewController(alertController, animated: true) { () -> Void in
            
        }
    }
    
    func processInputWeight() {
        var hud = MBProgressHUD.showHUDAddedTo(self.navigationController!.view, animated: true)
        hud.labelText = "Caculating bonus"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.displaySuccessView()
        })
    }
    
    func displaySuccessView() {
        MBProgressHUD.hideAllHUDsForView(self.navigationController!.view, animated: true)
        UIApplication.sharedApplication().keyWindow?.addSubview(self.successView!)
    }
    
    func handleSingleTabGestureOnSuccessView(sender: UITapGestureRecognizer) {
        self.successView?.removeFromSuperview()
        self.successView?.removeGestureRecognizer(self.singleTabRecognizerOnSuccessView!)
        var homeVC = self.navigationController?.childViewControllers[0] as! HomeViewController
        homeVC.changeTotalPoints(true, amt: 100)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}
