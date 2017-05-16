//
//  ViewController.swift
//  new
//
//  Created by Kyi Zar Theint on 5/15/17.
//  Copyright © 2017 Kyi Zar Theint. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    @IBOutlet weak var show: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        view.backgroundColor = UIColor.blue
    }

func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == CLAuthorizationStatus.authorizedWhenInUse || status == CLAuthorizationStatus.authorizedAlways {
        //if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
        if CLLocationManager.isRangingAvailable() {
            let uuid = NSUUID(uuidString: "12336747-4839-2747-3383-e37473892737")
            if let myuuid = uuid as UUID? {
                let region = CLBeaconRegion(proximityUUID: myuuid, identifier: "Mybeacon")
                //locationManager.startMonitoring(for: region)
                locationManager.startRangingBeacons(in: region)
           // }
            }
        }
    }
}
    @IBOutlet weak var identifierText: UILabel!

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var uuidtText: UILabel!
    @IBOutlet weak var minorText: UILabel!
    @IBOutlet weak var majorText: UILabel!
    func updateDistance(distance: CLProximity) {
        UIView.animate(withDuration: 1, animations: {
            switch distance {
            case .unknown:self.view.backgroundColor = UIColor.gray
            self.show.text = "Not Found"
            self.majorText.text = ""
            self.minorText.text = ""
            self.uuidtText.text = ""
            case .far:self.view.backgroundColor = UIColor.blue
            self.show.text = "far"
                
            case .near:self.view.backgroundColor = UIColor.orange
            self.show.text = "near"
                
            case .immediate:self.view.backgroundColor = UIColor.red
            self.show.text = "Right here"
            }
        })
    }
       func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
            if beacons.count > 0 {
                print(beacons)
                //show.text = "hi \(beacon.proximityUUID)"
                //show.text = "hi"
                let beacon = beacons.first!
                let f = NumberFormatter()
                majorText.text = f.string(from: beacon.major)
                minorText.text = f.string(from: beacon.minor)
                uuidtText.text = "\(beacon.proximityUUID)"
                identifierText.text = beacon.accessibilityLabel
                updateDistance(distance: beacon.proximity)
            }
            else {
                updateDistance(distance: .unknown)
        }
            }
   
    /*func setLabels() {
        uuidLabel.text = beaconRegion.proximityUUID.uuidString
        majorLabel.text = beaconRegion.major?.stringValue
        minorLabel.text = beaconRegion.minor?.stringValue
        identityLabel.text = beaconRegion.identifier*/

    
}




