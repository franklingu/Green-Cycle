//
//  HomeViewController.swift
//  SmartRecycle
//
//  Created by Gu Junchao on 9/7/15.
//  Copyright (c) 2015 Gu Junchao. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var mapFrameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeTotalPoints(isAdding: Bool, amt: Int) {
        var points: Int = 0
        if isAdding {
            points = self.pointsLabel.text!.toInt()! + amt
        } else {
            points = self.pointsLabel.text!.toInt()! - amt
        }
        self.pointsLabel.text = String(points)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var camera = GMSCameraPosition.cameraWithLatitude(1.298830, longitude: 103.859344, zoom: 15)
        var mapView = GMSMapView.mapWithFrame(self.mapFrameView.frame, camera: camera)
        mapView.myLocationEnabled = true
        self.view.addSubview(mapView)
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(1.298830, 103.859344)
        marker.title = "NEA Recycle Bin 2337"
        marker.map = mapView
        
        var marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2DMake(1.30766475517679, 103.759361614322)
        marker1.title = "NEA Recycle Bin 2332"
        marker1.map = mapView
        
        var marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(1.29882122485547, 103.797090875524)
        marker2.title = "NEA Recycle Bin 2335"
        marker2.map = mapView
        
        var marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(1.30684375314399, 103.859172738429)
        marker3.title = "NEA Recycle Bin 2345"
        marker3.map = mapView
        
        var marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2DMake(1.30358264167643, 103.858967081573)
        marker4.title = "NEA Recycle Bin 2349"
        marker4.map = mapView
        
        var marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2DMake(1.30520713792762, 103.860734098324)
        marker5.title = "NEA Recycle Bin 2348"
        marker5.map = mapView
        
        var marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2DMake(1.30601550669212, 103.858221188234)
        marker6.title = "NEA Recycle Bin 2353"
        marker6.map = mapView
        
        var marker7 = GMSMarker()
        marker7.position = CLLocationCoordinate2DMake(1.29458264167643, 103.858967081573)
        marker7.title = "NEA Recycle Bin 2333"
        marker7.map = mapView
        
        var marker8 = GMSMarker()
        marker8.position = CLLocationCoordinate2DMake(1.2987878643908, 103.854966686615)
        marker8.title = "NEA Recycle Bin 2329"
        marker8.map = mapView
        
        var marker9 = GMSMarker()
        marker9.position = CLLocationCoordinate2DMake(1.2987878643908, 103.863966686615)
        marker9.title = "NEA Recycle Bin 2338"
        marker9.map = mapView
    }
}
