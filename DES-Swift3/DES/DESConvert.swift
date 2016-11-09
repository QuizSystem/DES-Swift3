//
//  DESConvert.swift
//  DES-Swift3
//
//  Created by Thieu Mao on 11/9/16.
//  Copyright © 2016 thieumao. All rights reserved.
//

import UIKit

class DESConvert: NSObject {

    class func stringToHex() -> String {
        let string = "m"
        let binaryData: Data? = string.data(using: .utf8, allowLossyConversion: false)
        
        let stringOf01 = binaryData?.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix:16)//String(byte, radix: 2)
        }
        
        print("stringOf01:  ", stringOf01)
        
        return "Mao"
    }

    class func hexToString() {}
    
    class func hexToBin() {}
    
    class func dec16ToBin() {}
    
    class func binToHex() {}
    
    class func hoanVi() {}
    
    class func cat2() {}
    
    class func cat8() {}
    
    class func dichTrai() {}
    
    class func dichPhai() {}
    
    class func phepXOR() {}
    
    class func toArray2Chieu() {}
    
    class func binTo2Dec() {}
    
}
