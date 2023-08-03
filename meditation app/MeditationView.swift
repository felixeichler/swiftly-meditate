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



struct MeditationView: View {
    var duration: Int; // intended duration in minutes
    
    @State private var isShowingCompletedView = false
    
    @State var count = 0;
    @State var startTime = Date();
    
    // results
    @State var minutesPassed: Double = 0;
    @State var countPerMinute: Double = 0;
    
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
            }
        })
        VStack {
            Button(action: {
                // calculate
                let dateDiff = abs(startTime.timeIntervalSinceNow);
                minutesPassed = Double(dateDiff) / Double(60);
                countPerMinute = Double(count) / minutesPassed;
                
                // show summary
                isShowingCompletedView = true
                
                // reset
                // todo: timing: trigger when this view opens
                count = 0;
                startTime = Date()
            }, label: { Text("Done").foregroundColor(Color.black) })
            NavigationLink(destination: CompletedView(minutes: minutesPassed, count: count, countPerMinute: countPerMinute), isActive: $isShowingCompletedView) { EmptyView() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView(duration: 1)
    }
}
