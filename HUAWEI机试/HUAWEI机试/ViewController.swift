//
//  ViewController.swift
//  HUAWEI机试
//
//  Created by Thomas Lau on 2020/3/11.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        thirtyTwo()
    }

    // 计算字符串最后一个单词长度
    func one() {
        let line = readLine()!
        print(line.split(separator: " ").last!.count)
    }
    
    // 输出字符串中含有某字符的个数
    func two() {
        let str1 = readLine()!.lowercased()
        let str2 = readLine()!.lowercased()
        
        var count = 0
        for i in str1 {
            if i == Character(str2) {
                count += 1
            }
        }
        print(count)
    }
    
    // 去重和排序
    func three() {
        var flag = true
        while flag {
            let count = Int(readLine() ?? "") ?? 0
            if count > 0 {
                var set = Set<Int>()
                for _ in 0 ..< count {
                    set.insert(Int(readLine() ?? "") ?? 0)
                }
                for num in set.sorted() {
                    print(num)
                }
            } else {
                flag = false
            }
        }
    }
    
    // 输入字符串，8个为一行，缺了自动补零
    func four() {
        var str1 = readLine()!
        var str2 = readLine()!

        func f(str: String) {
            var strArr = [String]()
                    for s in str {
                        strArr.append(String(s))
                    }
                    let n = strArr.count / 8
                    let m = strArr.count % 8
                    if n >= 0 && m >= 0 {
                        var arr2 = [[String]]()
                        for i in 0..<n {
                            var tempArr = [String]()
                            for j in 0..<8 {
                                tempArr.append(strArr[j + (i * 8)])
                            }
                            arr2.append(tempArr)
                        }
                        if m > 0 {
                            var lastArr = [String]()
                            for i in 0..<m {
                                let index = n * 8 + i
                                lastArr.append(strArr[index])
                            }
                            let num = 8 - m
                            for _ in 0..<num {
                                lastArr.append("0")
                            }
                            arr2.append(lastArr)
                        }
                            
                        for i in 0..<arr2.count {
                            var result = ""
                            for j in arr2[i] {
                                result.append(j)
                            }
                            print(result)
                        }
                        
                    } else {
                        print("error")
                }
            
        }

        f(str: str1)
        f(str: str2)
    }
    
    // 16进制转10进制
    func five() {
        func pow(_ a: Int, _ x: Int) -> Int {
            if x == 0 {
                return 1
            }
            return pow(a, x - 1) * a
        }
                
        func hexToDecimal(hex: String) {
                let h = hex.dropFirst(2)
                var tempNum = 0
                for (index, value) in h.enumerated() {
                    var v = String(value)
                    switch v {
                    case "A":
                        v = String("10")
                    case "B":
                        v = String("11")
                    case "C":
                        v = String("12")
                    case "D":
                        v = String("13")
                    case "E":
                        v = String("14")
                    case "F":
                        v = String("15")
                    default:
                        break
                    }
                    
                    let num = Int(String(v))
                    let mi = pow(16, (h.count - index - 1))
                    tempNum += (num ?? 0) * Int(mi)
                }
                
                print(tempNum)
        }

        while let input = readLine() {
            hexToDecimal(hex: input)
        }
    }
    
    // 输出正整数的质因子
    func six() {
        let number = readLine()!
        var n = 2
        var str = ""
        var num = Int(number)
        
        if num == 2 {
            str = "\(String(describing: num)) "
        } else {
            while num ?? 0 >= n {
                if (num ?? 0) % n == 0 {
                    num = (num ?? 0) / n
                    str += "\(n) "
                } else {
                    n += 1
                }
            }
        }

        print(str)
    }
    
    // 输入正浮点数、输出该数值的近似整数值
    func seven() {
        let numStr = readLine()!
        let numArr = numStr.split(separator: ".")
        
        var a = Int(String(numArr[0])) ?? 0
        let b = Int(String(numArr[1])) ?? 0
        if b >= 5 {
            a += 1
        }
        
        print(a)
    }
    
    // 数据表记录包含表索引和数值（int范围的整数），请对表索引相同的记录进行合并，即将相同索引的数值进行求和运算，输出按照key值升序进行输出。
    func eight() {
        let str = readLine()!
        if let count = Int(str){
            var dict: [Int:Int] = [:]
            for _ in 0 ..< count{
                let arr = readLine()!.split(separator: " ")
                let key = Int(arr[0]) ?? 0
                let val = Int(arr[1]) ?? 0
                if dict[key] != nil {
                    dict[key] = (dict[key] ?? 0) + val
                } else {
                    dict[key] = val
                }
            }
             
            for key in dict.keys.sorted(){
                print("\(key) \(dict[key]!)")
            }
        }
    }
    
    // 输入一个int型整数，按照从右向左的阅读顺序，返回一个不含重复数字的新的整数。
    func nine() {
        let num = 9876673
        var str = ""
        
        for s in String(num).reversed() {
            if !str.contains(s) {
                str.append(s)
            }
        }
        
        print(Int(str) ?? 0)
    }

    // 编写一个函数，计算字符串中含有的不同字符的个数。字符在ACSII码范围内(0~127)，换行表示结束符，不算在字符里。
    func ten() {
        // import Foundation
        
        var str = readLine()!
        var resultStr = ""

        func stringToAscii(_ c: Character) -> Int {
            var numberFromC = 0
            for scalar in String(c).unicodeScalars
            {
                numberFromC = Int(scalar.value)
            }
            return numberFromC
        }
                
        if str.range(of: "\n") != nil {
            str.removeSubrange(str.range(of: "\n")!)
        }
        
        for c in str {
            if stringToAscii(c) >= UInt8(0)
                && stringToAscii(c) <= UInt8(127)
                && !resultStr.contains(c)
            {
                resultStr.append(c)
            }
        }
        
        print(resultStr.count)
    }
    
    // 输入一个整数，将这个整数以字符串的形式逆序输出
    func eleven() {
        let num = 1874619287323400
        let str = String(num)
        var resultStr = ""
        
        for i in str.reversed() {
            resultStr.append(i)
        }
        
        print(resultStr)
    }
    
    // 逆序输出字符串
    func twelve() {
        let str = readLine()!
        print(String(str.reversed()))
    }
    
    // 反转句子
    func thirteen() {
        let str = readLine()!
        var tempArr = [String]()
        
        for s in str.split(separator: " ") {
            tempArr.append(String(s))
        }
        
        var resultStr = ""
        for c in tempArr.reversed() {
            resultStr.append(c)
            resultStr.append(" ")
        }
        print(resultStr)
    }
    
    // 给定n个字符串，请对n个字符串按照字典序排列。
    func fourteen() {
        
        func stringToAscii(_ c: Character) -> Int {
            var numberFromC = 0
            for scalar in String(c).unicodeScalars
            {
                numberFromC = Int(scalar.value)
            }
            return numberFromC
        }
        
        let strArr = ["grLaArEX","B","Gc","MnuvCWc","kOmHJX","Qf","gNI","GRXvbgg"]
        
        print(strArr.sorted())

         let num = readLine()!
         var arr = [String]()
         for _ in 0..<(Int(num) ?? 0) {
             let i = readLine()!
             arr.append(i)
         }
        for j in arr.sorted() {
            print(j)
        }
        
    }
    
    // 十进制转二进制，找出1的个数
    func fiveteen() {
         let dd = readLine()!
         var b = ""
         var count = 0
        
         var d = Int(dd) ?? 0
         while d > 0 {
             b += "\(d % 2)"
             d = d / 2
         }
         for i in b {
             if i == "1" {
                 count += 1
             }
         }
         
         print(count)
    }
    
    // 购物单
    func sixteen() {
        
    }
    
    // 字符串排序
//    func seventeen() {
//        let str = "tYuqaAboiqI"
//
//        var Dic = [Int: String]()
//        for (index, value) in str.enumerated() {
//            Dic.updateValue(String(value.lowercased()), forKey: index)
//        }
//
//        print(Dic)
//
//        if let index = Dic.values.sorted().index(of: <#T##String#>)
//
//    }
    
    
    // 求解立方根(二分法)
    func eighteen() {
        
        // import Foundation

        let n = Double(readLine()!)!
        var str = String(format: "%.1f", pow(n, (1/3)))
        print(str)
        print(str.removeLast())
    }
    
    // 最小公倍数
    func nineteen() {
        let str = readLine()!
        var arr: [Int] = []
        
        for i in str.split(separator: " ") {
            arr.append(Int(String(i)) ?? 0)
        }
        
        let num = arr[0] * arr[1]
        var result = 0
        for i in max(arr[0], arr[1])...num {
            if i % arr[0] == 0
                && i % arr[1] == 0
            {
                result = i
                break
            }
        }
        
        print(result)
    }
    
    // 记负均正
    func twenty() {
        // import Foundation

        let numStr = readLine()!
        var numArr: [Int] = []
                var negative: [Int] = []
                var postive: [Int] = []
                var sum = 0

                for i in numStr.split(separator: " ") {
                    numArr.append(Int(String(i))!)
                }

                for i in numArr {
                    if i < 0 {
                        negative.append(i)
                    } else {
                        postive.append(i)
                    }
                }
                
                for i in postive {
                    sum += i
                }
                
                print(negative.count)

                if postive.count > 0 {
                    print(String(format: "%.1f", Double(sum / postive.count)))
                } else {
                    print(0.0)
                }
    }
    
    // 连续输入字符串(输出次数为N,字符串长度小于100)，请按长度为8拆分每个字符串后输出到新的字符串数组，
    func twentyOne() {
        
        
    }
    
    // 坐标移动
    func twentyTwo() {
        let str = "W49;W92;A84;W33;A32;A52;D97;S14;S33;D79;A14;W25;D97;D21;D31;A66;S67;S4;A59;S62;W40;S26;S65;A58;S17;A67;D48;W23;D68;S99;S97;W63;W27;D12;D83;W8;S3;W6;A88;D23;W30;S91;D58;W74;D45;W3;D19;S72;D8;S79;S76;S49;W16;A29;W93;W99;W92;D82;A10;A4;D25;A90;D83;W45;W20;S68;D59;S48;A18;S0;W24;S48;W75;A39;W29;S28;W76;W78;D94;A57;A5;D51;S61;A39;W77;S70;A2;D8;S58;D51;S86;W30;A27;S62;D56;A51;D0;S58;W34;S39;A64;A68;A96;D37;S91;S16;A17;D35;A85;W88;S57;S61;A28;D12;A87;S39;A85;W22;D65;D72;A5;A78;A59;D75;D57;S66;A55;D84;D72;W87;S46;W64;D49;S46;W34;D60;S39;A30;W86;D20;W93;D25;W44;W86;A16;D4;A86;S86;S27;W7;W89;W93;S17;S39;W66;W72;D81;W93;A88;D46;S57;W45;S84;S57;D27;A11;D54;S8;W15;A50;A69;A4;D19;D69;A3;A28;D47;W18;A39;D47;W14;D77;W59;S84;A32;D56;S16;D99;A33;A51;A24;D65;W37;D98;A13;W6;D94;D28;A12;S18;W40;S23;W76;D6;S40;D26;W97;W7;W90;W75;S12;A89;S46;S36;D96;A49;A73;S53;D84;A87;D75;D48;W84;S14;W65;W79;W51;S9;S77;D51;S76;W16;W77;A90;S96;D78;S7;W71;D17;W10;W4;D96;S58;A88;S89;D41;W47;W13;S75;S85;W63;W87;S19;S80;W92;W95;W73;D43;D35"
        let strArr = str.split(separator: ";")
        var resultArr: [String] = []
        var x = 0
        var y = 0
        
        for s in strArr {
            var n = 0
            var condition1 = false
            var condition2 = false
            
            if (s.first == "W" || s.first == "A" || s.first == "S" || s.first == "D") { condition1 = true }
            
            func panduan(n: Int) -> Int {
                var num = n
                for (i, c) in s.enumerated() {
                    if i == 1 || i == 2 {
                        if (c == "0" || c == "1" || c == "2" || c == "3" || c == "4" || c == "5"
                                || c == "6" || c == "7" || c == "8" || c == "9")
                        {
                            num += 1
                        } else {
                            num -= 1
                        }
                    } else {
                        if (c == "0" || c == "1" || c == "2" || c == "3" || c == "4" || c == "5"
                                || c == "6" || c == "7" || c == "8" || c == "9")
                        {
                            break
                        }
                    }
                }
                
                return num
            }

            let num = panduan(n: n)
            
            if num == 1 || num == 2 {
                condition2 = true
            }
            
            if condition1 && condition2 {
                resultArr.append(String(s))
            }
        }

        for s in resultArr {
            var tempS = ""
            for (i,c) in s.enumerated() {
                if i > 0 {
                    tempS.append(c)
                }
            }
            
            let volume = Int(tempS)!
            
            switch String(s.first!) {
            case "W":
                y += volume
            case "S":
                y -= volume
            case "A":
                x -= volume
            case "D":
                x += volume
            default:
                break
            }
        }
        
        print("\(x),\(y)")
        
    }
    
    // 识别有效的IP地址和掩码并进行分类统计
    func tewntyThree() {
        // 掩码IP (连续的1或0)
        // 非法IP 不连续的1或0，或全1全0
        
        let ipStrArr = ["10.70.44.68~255.254.255.0",
                        "1.0.0.1~255.0.0.0",
                        "192.168.0.2~255.255.255.0",
                        "19..0.~255.255.255.0"]
        var ipArr = [[String]]()
        var maskArr = [[String]]()

        var A = 0
        var B = 0
        var C = 0
        var D = 0
        var E = 0
        var errorIP = 0
        var errorMask = 0
        var personIP1 = 0
        var personIP2 = 0
        var personIP3 = 0

        for ipStr in ipStrArr {
            let ip = ipStr.split(separator: "~")[0]
            let mask = ipStr.split(separator: "~")[1]

            var aa = [String]()
            for i in ip.split(separator: ".") { aa.append(String(i)) }
            ipArr.append(aa)

            var bb = [String]()
            for i in mask.split(separator: ".") { bb.append(String(i)) }
            maskArr.append(bb)
        }

        for ip in ipArr {
            if ip.count < 4 {
                errorIP += 1
                continue
            }

            if (Int(ip[0])! >= 1 && Int(ip[0])! <= 126 && Int(ip[0])! != 10) {
                A += 1
            } else if (Int(ip[0])! >= 128 && Int(ip[0])! <= 191 && Int(ip[0])! != 172 && Int(ip[1])! < 16 && Int(ip[1])! >= 31) {
                B += 1
            } else if (Int(ip[0])! >= 192 && Int(ip[0])! <= 223 && Int(ip[0])! != 168) {
                C += 1
            } else if (Int(ip[0])! >= 224 && Int(ip[0])! <= 239) {
                D += 1
            } else if (Int(ip[0])! >= 240 && Int(ip[0])! <= 255) {
                E += 1
            } else if (Int(ip[0])! == 10) {
                personIP1 += 1
            } else if (Int(ip[0])! == 172 && Int(ip[1])! >= 16 && Int(ip[1])! <= 31) {
                personIP2 += 1
            } else if (Int(ip[0])! == 192 && Int(ip[1])! == 168) {
                personIP3 += 1
            } else if Int(ip[0])! != 0 {
                errorIP += 1
            }
        }


        for mask in maskArr {
            for sunM in mask {
                if sunM != "255" && sunM != "0" {
                    errorMask += 1
                    break
                }
            }
        }

        print(A,B,C,D,E, errorIP + errorMask, personIP1 + personIP2 + personIP3)
        
        /*
        #include <stdio.h>
        #include <arpa/inet.h>
        #include <sys/socket.h>
        #include <netinet/in.h>
        #include <strings.h>
        #include <stdlib.h>
        #include <string.h>
        #define true 1
        #define false 0
        int validMask(char *p) {
        int flag,i ;
        unsigned int b1 = 0, n[4];
        sscanf(p, "%u.%u.%u.%u", &n[3], &n[2], &n[1], &n[0]);
        if(n[0] == 255 &&n[1] == 255 &&n[2] == 255 &&n[3] == 255 ) {
            flag = false;
            return flag;
        }
        for(i = 0; i < 4; ++i)
            b1 += n[i] << (i * 8);
        b1 = ~b1 + 1;
        if((b1 & (b1 - 1)) == 0) {
            flag = true;
        } else
            flag = false;
        return flag;
        }
        int main() {
        char str[50];
        int a =0, b = 0, c = 0, d = 0, e = 0, err = 0, pri = 0;
        while(fgets(str,50,stdin)) {
            char *tok = str;
            char p[2][20] = {0};
            int i = 0;
            while ((tok = strtok(tok, "~")) != NULL) {
                strcpy(p[i], tok);
                tok = NULL;
                i ++ ;
                if(i == 2)
                    i = 0;
            }
            int flag = validMask(p[1]);
            if(flag) {
                struct in_addr s;
                unsigned int ip1,ip2;
                int valid = inet_pton(AF_INET,p[0],(void *)&s);
                sscanf(p[0],"%u.%u",&ip1,&ip2);
                if(valid) {
                    if(ip1>=1 && ip1 <=126)
                        a++;
                    else if(ip1>=128 && ip1 <=191)
                        b++;
                    else if(ip1>=192 && ip1 <=223)
                        c++;
                    else if(ip1>=224 && ip1 <=239)
                        d++;
                    else if(ip1>=240 && ip1 <=255)
                        e++;
                    if(ip1==10
                            || (ip1==172 && ip2 >=16 &&ip2 <=31)
                            || (ip1==192 && ip2 ==168))
                        pri ++;
                } else
                    err ++;
            } else
                err++;
        }
        printf("%d %d %d %d %d %d %d\n",a,b,c,d,e,err,pri);
        return 0;
        }*/
    }
    
    // 求立方根
    func twentyFour() {
        
        let x = 8
        
        func pows(a: Int) -> Double {
            return exp(log(Double(a))/3)
        }
        
        print(pows(a: x))
    }
    
    // 简单错误记录
    func twentyFive() {
//        var errorArr = [String]()
//        while (readLine()?.count ?? 0) > 0 {
//            errorArr.append(readLine() ?? "")
//        }
//
//        var resultArr = [Dictionary<String, Int>]()
//
//        for error in errorArr {
//            var errorName = ""
//            var v = ""
//
//            // 获取后16个字符
//            for (i,v) in error.reversed().enumerated() {
//                if i < 16 { errorName.append(v) }
//            }
//            for i in errorName.reversed() {
//                v.append(i)
//            }
//            // 计数
//            var dictionary = [v: 1]
//
//            for (i, dic) in resultArr.enumerated() {
//                if dic.keys == dictionary.keys {
//                    resultArr.remove(at: i)
//                    dictionary.updateValue(dic[v]! + 1, forKey: v)
//                }
//            }
//            resultArr.append(dictionary)
//        }
//
//        for item in resultArr[0] {
//            print("\(item.key) \(item.value)")
//        }
        /*
        #include <stdio.h>
        #include <stdlib.h>
        #include <malloc.h>
        #include <string.h>
        #include <math.h>
        typedef struct {
            int num;//行数
            char str[100];
            int cnt;//错误记数次数
        }error_log;
          
        int main(){
            int i,len,row,times,Flag,arr_cnt;
            char str[10000];
            char *p,*q;
            error_log *tmp,*ar[10000];
          
            times = 0;
            Flag = 0;
            arr_cnt = 0;
            tmp = (error_log *)malloc(sizeof(error_log));
            while(scanf("%s %d",tmp->str,&(tmp->num)) !=EOF){
                p = strrchr(tmp->str,'\\');
                p++;
                len = strlen(p);
                if(len > 16){
                    p = p+len-16;
                }
                for(i=0;i<arr_cnt;i++){//比较统计数组，看是否有重复记录，有相同的直接跳出，不需要记录
                    if(strcmp(ar[i]->str,p) == 0){
                        if(ar[i]->num == tmp->num){
                            ++ar[i]->cnt;
                            break;
                        }
                    }
                }
                if(arr_cnt == i){
                    ar[arr_cnt] = (error_log *)malloc(sizeof(error_log));
                    ar[arr_cnt]->num = tmp->num;
                    strcpy(ar[arr_cnt]->str, p);//复制字符串
                    ar[arr_cnt]->cnt = 1;//times;
                    arr_cnt ++;
                }
            }
                if(arr_cnt<8)
                    i = 0;
                else
                    i = arr_cnt-8;
                for(;i<arr_cnt;i++)
                    printf("%s %d %d\n",ar[i]->str,ar[i]->num,ar[i]->cnt);
          
            return 0;
        }*/
    }
    
    // 密码验证合格程序
    func twentySix() {
//        var strArray = [String]()
//
//        let s1 = readLine()!
//        let s2 = readLine()!
//        let s3 = readLine()!
//        let s4 = readLine()!
//
//        strArray.append(s1)
//        strArray.append(s2)
//        strArray.append(s3)
//        strArray.append(s4)
//
//         func check(str: String) -> String {
//                if str.count <= 8 { return "NG" }
//
//                var countArr = [0,0,0,0]
//                for s in str {
//                    if s >= "A" && s <= "Z" {
//                        countArr[0] += 1
//                    } else if s >= "a" && s <= "z" {
//                        countArr[1] += 1
//                    } else if s == "0" || s == "1" || s == "2" || s == "3" || s == "4"
//                        || s == "5" || s == "6" || s == "7" || s == "8" || s == "9" {
//                        countArr[2] += 1
//                    } else {
//                        countArr[3] += 1
//                    }
//                }
//
//                var t = 0
//                for i in countArr {
//                    if i != 0 {
//                        t += 1
//                    }
//                }
//                guard t >= 3 else { return "NG" }
//
//                var s1 = ""
//                var arr = [String]()
//                for s in str {
//                    if s1.count >= 3 {
//                        s1.removeFirst()
//                    }
//                    s1.append(s)
//                    if s1.count == 3 {
//                        arr.append(s1)
//                    }
//                }
//
//                var c = 0
//                for i in 0..<arr.count {
//                    for j in i+1..<arr.count {
//                        if arr[i] == arr[j] {
//                            c += 1
//                        }
//                    }
//                }
//
//                if c > 0 {
//                    return "NG"
//                } else {
//                    return "OK"
//                }
//            }
//
//        for i in strArray {
//            print(check(str: i))
//        }
        /*
         #include <stdio.h>
         #include <stdlib.h>
         #include <string.h>
         int main()
         {
             char ch[100];
             while(gets(ch))
             {
                 int flag = 0;
                 int len = strlen(ch);
                 int a = 0, b = 0, c = 0, d =0;
                 int sum;
                 int k;
                 if(len <= 8)
                 {
                     printf("NG\n");
                     flag = 1;
                     continue;
                 }
                 for(int i = 0; i < len; i++)
                 {
                     if(ch[i] >= 'a' && ch[i] <= 'z')
                         a = 1;
                     if(ch[i] >= 'A' && ch[i] <= 'Z')
                         b = 1;
                     if(ch[i] >= '0' && ch[i] <= '9')
                         c = 1;
                     else
                         d = 1;
                 }
                 sum = a + b + c + d;
                 if(sum < 3)
                 {
                     printf("NG\n");
                     flag = 1;
                     continue;
                 }
                 for(int i = 0; i < len - 3; i++)
                 {
                   for(int j = i + 3; j < len; j++)
                   {
                       if(ch[i] == ch[j] && ch[i + 1] == ch[j + 1] && ch[i + 2] == ch[j + 2])
                       {
                           printf("NG\n");
                           flag = 1;
                           continue;
                       }
                   }
                 }
                 if(flag == 0)
                     printf("OK\n");
             }
             return 0;
         }
         */
    }
    
    // 简单密码
    func twentySeven() {
        let str = readLine()!

        func decode(s: String) -> String {
            if s == "1" {
                return "1"
            } else if s == "a" || s == "b" || s == "c" || s == "2" {
                return "2"
            } else if s == "d" || s == "e" || s == "f" || s == "3" {
                return "3"
            } else if s == "g" || s == "h" || s == "i" || s == "4" {
                return "4"
            } else if s == "j" || s == "k" || s == "l" || s == "5" {
                return "5"
            } else if s == "m" || s == "n" || s == "o" || s == "6" {
                return "6"
            } else if s == "p" || s == "q" || s == "r" || s == "s" || s == "7" {
                return "7"
            } else if s == "t" || s == "u" || s == "v" || s == "8" {
                return "8"
            } else if s == "w" || s == "x" || s == "y" || s == "z" || s == "9" {
                return "9"
            } else if s == "0" {
                return "0"
            } else if s >= "A" && s <= "Z" {
                var sInt: UInt32 = 0
                for code in s.unicodeScalars {
                    sInt = code.value
                }
                if s == "Z" {
                    sInt += 7
                } else {
                    sInt += 33
                }
                let c = Character.init(Unicode.Scalar.init(sInt)!)
                return String(c)
            } else {
                return ""
            }
        }
        
        var resultS = ""
        for s in str {
            resultS.append(decode(s: String(s)))
        }
        
        print(resultS)
    }
    
    // 汽水瓶
    func twentyEight() {
        
        func qishuiping(_ n: Int) {
                var result = 0
                
                func iter(n: Int) {
                    
                    if n >= 3 {
                        let a = n / 3
                        let b = n % 3
                        let c = a + b
                        result += a
                        iter(n: c)
                    } else if n == 2 {
                        result += 1
                        return
                    }
                }
                
                iter(n: n)
                print(result)
        }

        while true {
            if let n = Int(readLine() ?? "0") {
                if n == 0 {
                    break
                }
                qishuiping(n)
            }
        }
    }
    
    // 删除字符串中出现次数最少的字符后的字符串
    func twentynine() {
        
//        while true {
//            if let n = Int(readLine() ?? "0") {
//                if n == 0 {
//                    break
//                }
//            }
//
//        typealias Dic = [String: Int]
//        let str = readLine()!
//        var str2 = ""
//        var strArr = [String]()
//        var strDicArr = [Dic]()
//
//        // 找出所有元素
//        for s in str {
//            if !str2.contains(s) {
//                str2.append(s)
//            }
//            strArr.append(String(s))
//        }
//
//        // 原始字典数组
//        for s in str2 {
//            var dic = Dic()
//            dic.updateValue(0, forKey: String(s))
//            strDicArr.append(dic)
//        }
//        // 累计元素个数
//        for (i, dic) in strDicArr.enumerated() {
//            var dictionary = dic
//            for item in dictionary {
//                let it = item
//                var n = 0
//                for s in strArr {
//                    if it.key == String(s) {
//                        n += 1
//                        dictionary.updateValue(it.value + n, forKey: String(s))
//                        strDicArr[i] = dictionary
//                    }
//                }
//            }
//        }
//
//        var min = 0
//        var resultArr = [String]()
//        for dic in strDicArr {
//            for (i,item) in dic.enumerated() {
//                if i == 0 {
//                    min = item.value
//                }
//                if item.value <= min {
//                        min = item.value
//                        resultArr.append(item.key)
//                    }
//                }
//            }
//
//        var result = ""
//        for s in str {
//            if !resultArr.contains(String(s)) {
//                result.append(s)
//            }
//        }
//
//        print(result)
//        }
//
        
        /*
        import Foundation
        func deleteTheMostLessChar(str:String){
            var dic =  ["a":0,"b":0,"c":0,"d":0,"e":0,"f":0,"g":0,"h":0,"i":0,"j":0,"k":0,"l":0,"m":0,
                   "n":0,
                   "o":0,
                   "p":0,
                   "q":0,
                   "r":0,
                   "s":0,
                   "t":0,
                   "u":0,
                   "v":0,
                   "w":0,
                   "x":0,
                   "y":0,
                   "z":0
                  ]
            str.forEach{(c) in
                        var num = dic[String(c)]!
                        num = num + 1
                        dic[String(c)] = num
                       }
            var miniNum = 20
            dic.forEach{(key,value) in
                if value > 0 {
                    if value < miniNum{
                        miniNum = value
                    }
                }
            }
            var res1 = ""
            str.forEach{(c) in
                        let num = dic[String(c)]!
                        if num != miniNum {
                           res1.append(c)
                        }
                       }
            print(res1)
        }
         
        while let str = readLine(){
          deleteTheMostLessChar(str:str)
        }*/
        
        let str = "10000000 10000000"
        var arr = [Int]()
        
        for s in str.split(separator: " ") {
            arr.append(Int(s) ?? 0)
        }
        
        var result = Int(1)
        for i in arr {
            result *= i
        }
        
        print(result)
    }
    
    func thirty() {
        
        /*
        import Foundation
        while let line = readLine() {

        }*/
        
        /*
         import Foundation
         let n = Int(readLine()!)!
         for _ in 0 ..< n {
             if let line = readLine() {
                 let parts = line.split(separator: " ")
                 for part in parts {
                    
                 }
             }
         }*/
        
        let str = "15 15"
        var strArr = [Int]()
        for v in str.split(separator: " ") {
            strArr.append(Int(v) ?? 0)
        }

        var result = 1
        for i in strArr {
            result *= i
        }

        print(result)
    }
    
    
    
    func thirtyOne() {
        
//        let str = readLine() ?? ""
//        var strArr = [String]()
//        for v in str.split(separator: " ") {
//            strArr.append(String(v))
//        }
        // 大数相乘
        func bigNumMutiply(str1: String, str2: String) -> String {

            var sumArr: [Int] = []

            // 各位数字相乘
            for (i,v1) in str1.reversed().enumerated() {
                let num1 = Int(String(v1)) ?? 0
                
                for (j,v2) in str2.reversed().enumerated() {
                    let num2 = Int(String(v2)) ?? 0
                    let index = i + j
                    
                    if sumArr.count > index {
                        sumArr.insert(sumArr[index] + num1 * num2, at: index)
                        sumArr.remove(at: index+1)
                    } else {
                        sumArr.append(num1 * num2)
                    }
                }
            }

            // 处理进位
            var result = ""
            for i in 0..<sumArr.count {
                
                if i < sumArr.count - 1 {
                    if sumArr[i] >= 10 {
                        result.append(String(sumArr[i] % 10))
                        sumArr[i+1] += sumArr[i] / 10
                    } else {
                        result.append(String(sumArr[i]))
                    }
                } else {
                    if sumArr[i] >= 10 {
                        result.append(String(sumArr[i] % 10))
                        result.append(String(sumArr[i] / 10))
                    } else {
                        result.append(String(sumArr[i]))
                    }
                }

            }

            // 删除前面为零的数字
//            var modified = ""
//            do {
//                let RE = try NSRegularExpression(pattern: "0*?$", options: .caseInsensitive)
//                modified = RE.stringByReplacingMatches(in: result, options: .reportProgress, range: NSRange(location: 0, length: result.count), withTemplate: "")
//            } catch  {
//                print("error")
//            }
//
//            return String(modified.reversed())
            return String(result.reversed())
        }
        
        //print(bigNumMutiply(str1: strArr[0], str2: strArr[1]))
        print(bigNumMutiply(str1: "340282366920938463463374607431768211456", str2: "340282366920938463463374607431768211456"))
    }
    
    // 输入一个整数，求出1到这个整数的十进制表示中某个数字出现的次数,现假设为x
    func thirtyTwo() {
        
        func numofOne(n: NSNumber, x: Int) {
            var count = 0
            
            if x < 0 || x > 9 { print(-1)}

            var strArr = [String]()
            
            for i in 1...n {
                strArr.append(String(i))
            }
            
            for s in strArr {
                for c in s {
                    if String(c) == String(x) {
                        count += 1
                    }
                }
            }
            
            print(count)
        }
        
        let groupIds = 104563456435634563456354564563456345600 as Int64 as NSNumber]
        numofOne(n: groupIds, x: 1)
    }
    
    // 寻找字符串中最长的回文
    func thirtyThree() {

        // import Foundation

        let str = "djfalkdjaldjfaoaajioefaeijafeoajfoa" //readLine() ?? ""

          func longestPalindrome(_ s: String) -> String {
            if s == "" { return "" }
            
            var start = 0, end = 0
            let length = s.count
            let chars: [Character] = [Character](s)
            
            for i in 0..<length {
                let length1 = testPalindrome(chars, i, i)
                let length2 = testPalindrome(chars, i, i+1)
                let length = max(length1, length2)
                if (length > end - start) {
                    start = i - (length - 1) / 2
                    end = i + length/2
                }
            }
             
            return String(chars[start...end])
        }

        func testPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> Int {
            
            let count = s.count
            
            var L = left
            var R = right
            
            while (L>=0 && R < count && s[L] == s[R]) {
                L -= 1
                R += 1
            }
            return R-L-1
        }
    
        print(longestPalindrome(str))
    }
    
    // 三天打鱼，两天晒网   1990/1/1 开始    四年一闰；百年不闰，四百年再闰
    // 1.判断输入年月的正确性
    // 2.计算输入的年份与1990年间有几个闰年 num1
    // 3.是否闰年
    // 4.计算一年中某天到该年1月1号的天数num2
    // 5. (num1 + num2) % 5      1,2,3:打鱼     4,5：晒网
    func thirtyFour() {
        
        //        let str = readLine() ?? ""
        //        var strArr = [String]()
        //        for v in str.split(separator: " ") {
        //            strArr.append(String(v))
        //        }
        
        let y = "1991"
        let m = "1"
        let d = "4"
        
        // 1
        guard y.count == 4 && (m.count == 1 || m.count == 2) && (d.count == 1 || d.count == 2) else { return }
        if Int(y) ?? 0 < 1990 { return }
        
        // 3
        func isLeapYear(y: Int) -> Bool {
            if (y % 4 == 0 && y % 100 != 0) || (y / 400 == 0) {
                return true
            } else {
                return false
            }
        }
        
        // 2
        let j = Int(y) ?? 0
        var num1 = 0
        for i in 1990...j {
            if isLeapYear(y: i) {
                num1 += 1
            }
        }
        
        // 4
        func numOfDays(m: Int, y: Int) -> Int {
            
            var sum = 0
            
            for i in 1...m {
                switch i {
                case 1:
                    break
                case 2:
                    sum += 31
                case 3:
                    if isLeapYear(y: y) {
                        sum += 29
                    } else {
                        sum += 28
                    }
                case 4:
                    sum += 31
                case 5:
                    sum += 30
                case 6:
                    sum += 31
                case 7:
                    sum += 30
                case 8:
                    sum += 31
                case 9:
                    sum += 31
                case 10:
                    sum += 30
                case 11:
                    sum += 31
                case 12:
                    sum += 30
                default:
                    break
                }
            }

            return sum
        }
        let num2 = numOfDays(m: Int(m) ?? 0, y: Int(d) ?? 0) + (Int(d) ?? 0)
        print(num1, num2)
        // 5
        let final = num1 + num2

        if final % 5 == 1 || final % 5 == 2 || final % 5 == 3 {
            print("打鱼")
        } else {
            print("晒网")
        }
        
    }
}

 
