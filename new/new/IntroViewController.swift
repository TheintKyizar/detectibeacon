//
//  IntroViewController.swift
//  new
//
//  Created by Kyi Zar Theint on 5/15/17.
//  Copyright © 2017 Kyi Zar Theint. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        trackButton.backgroundColor = UIColor.gray
        transmitButton.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var transmitButton: UIButton!
    @IBOutlet weak var trackButton: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
