//
//  ContentView.swift
//  PassCheck
//
//  Created by Tamara Radloff on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var pass: String = ""
    @State private var passStrength: Int = 0
    // 0 means no comment
    // 1 means weak
    // 2 means meh
    // 3 means strong
    // 4 means fuuuuuuck
    func strengthCheck(_ pass: String) -> Int {
        let passLength = pass.count
        var hasSymbol = false
        var hasUpper = false
        var hasNum = false
        
        for char in pass {
            if "QWERTYUIOPASDFGHJKLZXCVBNM".contains(char) {
                hasUpper = true
            }
            if "!@#$%^&*()_+=-.<>/?;:'[]{}`".contains(char) {
                hasSymbol = true
            }
            if "1234567890".contains(char) {
                hasNum = true
            }
        }
        if passLength >= 6 {
            if hasUpper && hasSymbol && hasNum {
                if passLength >= 12 {
                    return 5
                }
                else {
                    return 4
                }
            }
            else if hasUpper || hasSymbol || hasNum {
                return 3
            }
            else {
                return 2
            }
        }
        else if passLength > 0 {
            return 1
        }
        else {
            return 0
        }
    }
    
    
    var body: some View {
        VStack{
            Text("Let's Judge yer Pass!")
                .padding()
            TextField("Enter pass", text: $pass)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
            if strengthCheck(pass) == 0{
                Text("Enter a Password")
            }
            else if strengthCheck(pass) == 1{
                Text("Shits too short mah dude")
                    .foregroundColor(Color.red)
            }
            else if strengthCheck(pass) == 2{
                Text("Get Out with this weak shit")
                    .foregroundColor(Color.red)
            }
            else if strengthCheck(pass) == 3{
                Text("... meh")
                    .foregroundColor(Color.orange)
            }
            else if strengthCheck(pass) == 4{
                Text("Aight, we onto something")
                    .foregroundColor(Color.green)
            }
            else if strengthCheck(pass) == 5{
                Text("DAAAAAAAAAAAAAAAAAAAAAAMN")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
