//
//  DESConvert.swift
//  DES-Swift3
//
//  Created by Thieu Mao on 11/9/16.
//  Copyright © 2016 thieumao. All rights reserved.
//

import UIKit

class DESConvert: NSObject {

    class func stringToHex(string: String) -> String {
        let characters = string.characters.map { String($0) }
        var hex:String = ""
        for i in 0..<characters.count {
            let bin = DESConvert.charToBin(char: characters[i])
            hex += DESConvert.binToHex(bin: bin)
        }
        return hex
    }
    
    class func charToBin(char: String) -> String {
        let binaryData: Data? = char.data(using: .utf8, allowLossyConversion: true)
        var stringOf01 = binaryData?.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix: 2)
        }
        let length:Int? = stringOf01?.characters.count
        var lengthRest:Int = 0
        if (length != nil) {
            let length8 = length!%8
            if (length8 < 8 && length8 > 0) {
                lengthRest = 8-length8;
            }
        }
        for _ in 0..<lengthRest {
            stringOf01 = "0" + stringOf01!
        }
        return stringOf01!;
    }

    class func hexToString() {}
    
    class func hexToBin(hex: String) -> String {
        var bin:String = ""
        for i in 0..<hex.characters.count {
            switch hex[i] {
            case "0":
                bin += "0000"
            case "1":
                bin += "0001"
            case "2":
                bin += "0010"
            case "3":
                bin += "0011"
            case "4":
                bin += "0100"
            case "5":
                bin += "0101"
            case "6":
                bin += "0110"
            case "7":
                bin += "0111"
            case "8":
                bin += "1000"
            case "9":
                bin += "1001"
            case "A":
                bin += "1010"
            case "B":
                bin += "1011"
            case "C":
                bin += "1100"
            case "D":
                bin += "1101"
            case "E":
                bin += "1110"
            case "F":
                bin += "1111"
            default:
                break
            }
        }
        return bin
    }
    
    class func dec16ToBin() {}
    
    class func binToHex(bin: String) -> String {
        var hex:String = ""
        let i4:Int = bin.characters.count / 4
        for i in 0..<i4 {
            let bin4 = bin[i*4] + bin[i*4+1] + bin[i*4+2] + bin[i*4+3]
            switch bin4 {
            case "0000":
                hex += "0"
            case "0001":
                hex += "1"
            case "0010":
                hex += "2"
            case "0011":
                hex += "3"
            case "0100":
                hex += "4"
            case "0101":
                hex += "5"
            case "0110":
                hex += "6"
            case "0111":
                hex += "7"
            case "1000":
                hex += "8"
            case "1001":
                hex += "9"
            case "1010":
                hex += "A"
            case "1011":
                hex += "B"
            case "1100":
                hex += "C"
            case "1101":
                hex += "D"
            case "1110":
                hex += "E"
            case "1111":
                hex += "F"
            default:
                break
            }
        }
        return hex
    }
    
    class func hoanVi() {}
    
    class func cat2() {}
    
    class func cat8() {}
    
    class func dichTrai() {}
    
    class func dichPhai() {}
    
    class func phepXOR() {}
    
    class func toArray2Chieu() {}
    
    class func binTo2Dec() {}
    
}

extension String {
    subscript(i: Int) -> String {
        guard i >= 0 && i < characters.count else { return "" }
        return String(self[index(startIndex, offsetBy: i)])
    }
    subscript(range: Range<Int>) -> String {
        let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) ?? endIndex
        return substring(with: lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) ?? endIndex))
    }
    subscript(range: ClosedRange<Int>) -> String {
        let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) ?? endIndex
        return substring(with: lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) ?? endIndex))
    }
}
