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
    
    class func hoanVi(input: String, table: [Int]) -> String {
        var output: String = ""
        for i in 0..<table.count {
            let j:Int = table[i] - 1
            output += input[j]
        }
        return output
    }
    
    class func cat2(input: String) -> (String, String) {
        let start:Int = 0
        let mid:Int = input.characters.count / 2
        let end:Int = input.characters.count
        let out1 = DESConvert.subString(input: input, from: start, to: mid)
        let out2 = DESConvert.subString(input: input, from: mid, to: end)
        return (out1, out2)
    }
    
    class func cat8(input: String) -> [String] {
        let length:Int = input.characters.count / 8
        var output:[String] = Array(repeating: "", count: 8)
        for i in 0..<8 {
            output[i] = DESConvert.subString(input: input, from: i*length, to: i*length+length)
        }
        return output
    }
    
    class func dichTrai(input: String, bit: Int) -> String {
        let out1:String = DESConvert.subString(input: input, from: 0, to: bit)
        let out2:String = DESConvert.subString(input: input, from: bit, to: input.characters.count)
        return out2 + out1
    }
    
    class func dichPhai(input: String, bit: Int) -> String {
        let out1:String = DESConvert.subString(input: input, from: 0, to: input.characters.count - bit)
        let out2:String = DESConvert.subString(input: input, from: input.characters.count - bit, to: input.characters.count)
        return out2 + out1
    }
    
    class func phepXOR(binA: String, binB: String) -> String {
        let length = min(binA.characters.count, binB.characters.count)
        var output:String = ""
        for i in 0..<length {
            if (binA[i] == binB[i]) {
                output += "0"
            } else{
                output += "1"
            }
        }
        return output
    }
    
    class func toArray2Chieu(tableS:[Int]) -> [[Int]]  {
        let length:Int = tableS.count / 4
        var k:Int = 0
        var output = Array<Array<Int>>()
        for i in 0..<4 {
            for j in 0..<length {
                output[i][j] = tableS[k]
                k += 1
            }
        }
        return output
    }
    
    class func binTo2Dec(input: String) -> (String, String) {
        var length = input.characters.count
        var daucuoi = DESConvert.subString(input: input, from: 0, to: 1) + DESConvert.subString(input: input, from: length - 1, to: length)
        var giua = DESConvert.subString(input: input, from: 1, to: length - 1)
        // TODO: ...
        return ("", "")
    }
    
    class func subString(input: String, from: Int, to: Int) -> String {
        let start = input.index(input.startIndex, offsetBy: from)
        let end = input.index(input.startIndex, offsetBy: to)
        let range = start..<end
        return input.substring(with: range)
    }
    
    class func convertKeyToHex(string: String) -> String {
        var hex = DESConvert.stringToHex(string: string)
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
    
    class func catNho(input: String) -> [String] {
        let lenInput:Int = input.characters.count
        let soKyTuThem = 16 - lenInput % 16
        var padding:String = ""
        if (soKyTuThem > 0 && soKyTuThem < 16) {
            for _ in 0..<soKyTuThem {
                padding += "0"
            }
        }
        let input_padding = input + padding
        let soKhoi = input_padding.characters.count / 16
        var output:[String] = Array(repeating: "", count: soKhoi)
        for i in 0..<soKhoi {
            output[i] = DESConvert.subString(input: input_padding, from: i*16, to: i*16+16)
        }
        return output
    }
    
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
