//
//  TransmitViewController.swift
//  new
//
//  Created by Kyi Zar Theint on 5/15/17.
//  Copyright © 2017 Kyi Zar Theint. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class TransmitViewController: UIViewController, CBPeripheralManagerDelegate {
   // var check: Bool = true
    var beaconRegion: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var peripheralManager: CBPeripheralManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        uuidText.text = "12336747-4839-2747-3383-e37473892737"
        majorText.text = "111"
        minorText.text = "222"
        identityText.text = "myIdentifier"
        initBeaconRegion()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if (peripheral.state == .poweredOn)
        {
            peripheralManager.startAdvertising(beaconPeripheralData as? [String : Any])
            print("Powered On")
        }
        else {
            peripheralManager.stopAdvertising()
            print("Not Powered On, or some other error")
        }
    }
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    func initBeaconRegion() {
       /* if uuidText.text == nil || majorText.text == nil || minorText.text == nil {
            errorLabel.text = "Please enter all of the field"
        }*/
        beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: uuidText.text!)!, major: UInt16((majorText.text!))!, minor: UInt16((minorText.text!))!, identifier: identityText.text!)
        /*beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "12336747-4839-2747-3383-e37473892737")!, major: 123, minor: 456,identifier: identityText.text!)*/
    }
    @IBAction func stopButton(_ sender: UIButton) {
        sender.backgroundColor = UIColor.green
        transmitButtonn.backgroundColor = UIColor.gray
        peripheralManager.stopAdvertising()
        //peripheralManager = nil
       // beaconPeripheralData = nil
       // beaconRegion = nil
    }
   /* @IBAction func stopButton(_ sender: Any) {
        peripheralManager.stopAdvertising()
        peripheralManager = nil
        beaconPeripheralData = nil
        beaconRegion = nil
    }*/
    @IBOutlet weak var stopButtonn: UIButton!
    @IBOutlet weak var transmitButtonn: UIButton!
    
    @IBAction func transmitButton(_ sender: UIButton) {
        sender.backgroundColor = UIColor.green
        stopButtonn.backgroundColor = UIColor.gray
        beaconPeripheralData = beaconRegion.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager.init(delegate: self, queue: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        peripheralManager.stopAdvertising()
        //peripheralManager = nil
        //beaconPeripheralData = nil
    }
    @IBOutlet weak var uuidText: UITextField!
    @IBOutlet weak var identityText: UITextField!
    @IBOutlet weak var minorText: UITextField!
    @IBOutlet weak var majorText: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
}
}
