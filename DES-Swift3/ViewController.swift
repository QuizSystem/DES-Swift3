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
        let key_string = "thieumao"
        let key_hex = convertKeyToHex(string: key_string)
        let key_bin = DESConvert.hexToBin(hex: key_hex)
        print(key_bin)
    }
    
    func convertKeyToHex(string: String) -> String {
        var hex = DESConvert.stringToHex(string: string);
        if (hex.characters.count>=16) {
            let start = hex.index(hex.startIndex, offsetBy: 0)
            let end = hex.index(hex.startIndex, offsetBy: 16)
            let range = start..<end
            hex = hex.substring(with: range)
        } else {
            for _ in 0..<16-hex.characters.count {
                hex += "0"
            }
        }
        return hex
    }
    
}

