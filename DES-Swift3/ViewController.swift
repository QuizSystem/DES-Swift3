//
//  ViewController.swift
//  DES-Swift3
//
//  Created by Thieu Mao on 11/9/16.
//  Copyright © 2016 thieumao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Start Sinh Khoa
        convertKeyToHex()
    }
    
    func convertKeyToHex() {
        var hex = DESConvert.stringToHex();
        print("hex ", hex)
    }
    
}

