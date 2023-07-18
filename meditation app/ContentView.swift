//
//  ContentView.swift
//  meditation app
//
//  Created by Felix Eichler on 18.07.23.
//

import SwiftUI

let availableColors = [Color.pink, Color.yellow, Color.orange, Color.red, Color.cyan, Color.indigo]
let gradientColor1 = Color.pink;
let gradientColor2 = Color.indigo;

let backgroundGradient = LinearGradient(
    gradient: Gradient(colors: [gradientColor1, gradientColor2]),
    startPoint: .top, endPoint: .bottom)



struct ContentView: View {
    @State var count = 0;
    @State var startTime = Date();
    @State var showAlert = false;
    @State var alertText = "";
    
    func showAlertContent() -> Alert {
                Alert(
                    title: Text("Meditation summary"),
                    message: Text(alertText),
                    dismissButton: .default(Text("Okay")))
        }
    
    var body: some View {
        Button(action: {
            count += 1;
        }, label: {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                VStack {
                    Text(String(count)).foregroundColor(Color.white).font(.system(size: 100))
                    
                    
                }
                VStack {
                    Spacer()
                    Button(action: {
                        let dateDiff = abs(startTime.timeIntervalSinceNow);
                        let minutesPassed = Double(dateDiff) / Double(60);
                        let countPerMinute = Double(count) / minutesPassed;
                        
                        alertText = "\(count) in \(minutesPassed) minutes -> \(countPerMinute)/min";
                        showAlert = true
                        
                        
                        count = 0;
                        startTime = Date()
                    }, label: { Text("Reset").foregroundColor(Color.black) })
                }
                
            }
            .alert(isPresented: self.$showAlert,
                   content: { self.showAlertContent() })
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
