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
        // MARK: Sinh Khoa
        let key_string = "thieumao"
        let key_hex = DESConvert.convertKeyToHex(string: key_string)
        //let key_hex = "1234567890ABCD00"
        let key_bin = DESConvert.hexToBin(hex: key_hex)
        let key_pc1 = DESConvert.hoanVi(input: key_bin, table: DESTable.PC1)
        let catkey = DESConvert.cat2(input: key_pc1)
        var C:[String] = Array(repeating: "", count: 17)
        var D:[String] = Array(repeating: "", count: 17)
        var CD:[String] = Array(repeating: "", count: 17)
        var K:[String] = Array(repeating: "", count: 17)
        var K_hex:[String] = Array(repeating: "", count: 17)
        C[0] = catkey.0
        D[0] = catkey.1
        for i in 1...16 {
            //print(i)
            var bit:Int = 2
            // Dich bit khi o vi tri 1,2,9,16
            if (i==1 || i==2 || i==9 || i==16) {
                bit = 1
            }
            C[i] = DESConvert.dichTrai(input: C[i-1], bit: bit)
            D[i] = DESConvert.dichTrai(input: D[i-1], bit: bit)
            CD[i] = C[i] + D[i]
            K[i] = DESConvert.hoanVi(input: CD[i], table: DESTable.PC2)
            K_hex[i] = DESConvert.binToHex(bin: K[i])
        }
        print("QUA TRINH SINH KHOA");
        print("Khoa: ", key_hex)
        for i in 1...16 {
            print("K[",i,"]= ", K_hex[i])
        }
        
        // MARK: Ma Hoa
        print("QUA TRINH MA HOA");
        let chuoi_can_ma_hoa = "Chuỗi cần mã hóa ở đây"
        let hex_chuoi_can_ma_hoa = DESConvert.stringToHex(string: chuoi_can_ma_hoa)
        print(hex_chuoi_can_ma_hoa)
        var cacKhoi = DESConvert.catNho(input: hex_chuoi_can_ma_hoa)
        let soKhoi = cacKhoi.count
        var banMa = ""
        for j in 0..<soKhoi {
            print("Khoi ", j+1, ":",  cacKhoi[j])
            let x = cacKhoi[j]
            let x_bin = DESConvert.hexToBin(hex: x)
            let x_ip = DESConvert.hoanVi(input: x_bin, table: DESTable.IP)
            let catx = DESConvert.cat2(input: x_ip)
            var L:[String] = Array(repeating: "", count: 17)
            var R:[String] = Array(repeating: "", count: 17)
            L[0] = catx.0
            R[0] = catx.1
            for i in 1...16 {
                L[i] = R[i-1]
                let F = self.hamF(R: R[i-1], K: K[i])
                R[i] = DESConvert.phepXOR(binA: L[i-1], binB: F)
            }
            let R16L16 = R[16] + L[16]
            let y = DESConvert.hoanVi(input: R16L16, table: DESTable.IP_1)
            let y_hex = DESConvert.binToHex(bin: y)
            print("Ban ro: ", x)
            print("Ban ma: ", y_hex)
            banMa = banMa + y_hex
        }
        print("Ban ma tong: ", banMa)
    }
    
    func hamF(R: String, K: String) -> String {
        let Rmorong = DESConvert.hoanVi(input: R, table: DESTable.E)
        let xorRK  = DESConvert.phepXOR(binA: Rmorong, binB: K)
        let catxorRK = DESConvert.cat8(input: xorRK)
        var strBox:String = ""
        for i in 1...8 {
            let Bi = catxorRK[i-1]
            let BSi = Sbox(bit: Bi, stt: i)
            strBox = strBox + BSi
        }
        let F = DESConvert.hoanVi(input: strBox, table: DESTable.P)
        return F
    }
    
    func Sbox(bit:String, stt:Int) -> String {
        let dec = DESConvert.binTo2Dec(input: bit)
        let hang = dec.0
        let cot = dec.1
        var output = 0
        switch stt {
        case 1:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S1)
            break
        case 2:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S2)
            break
        case 3:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S3)
            break
        case 4:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S4)
            break
        case 5:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S5)
            break
        case 6:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S6)
            break
        case 7:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S7)
            break
        case 8:
            output = DESConvert.toArray2Chieu(hang: hang, cot: cot, tableS: DESTable.S8)
            break
        default:
            break
        }
        let outputReturn = DESConvert.dec16ToBin(dec: output)
        return outputReturn
    }
    
}
