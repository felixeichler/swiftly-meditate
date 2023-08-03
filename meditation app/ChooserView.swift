//
//  ChooserView.swift
//  meditation app
//
//  Created by Felix Eichler on 03.08.23.
//

import SwiftUI

struct ChooserView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("1min")
                Spacer()
                    .frame(height: 50)
                NavigationLink(destination: MeditationView(duration: 5)) {
                    Text("5min")
                }
                Spacer()
                    .frame(height: 50)
                Text("10min")
                
//                NavigationLink(destination: Text("Second View")) {
//                    Text("Hello, World!")
//                }
//                .navigationTitle("Stop early")
            }
        }
    }
}

struct ChooserView_Previews: PreviewProvider {
    static var previews: some View {
        ChooserView()
    }
}
