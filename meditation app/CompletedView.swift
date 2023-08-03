//
//  AfterCompletionView.swift
//  meditation app
//
//  Created by Felix Eichler on 03.08.23.
//

import SwiftUI

struct CompletedView: View {
    @Environment(\.dismiss) var dismiss
    
    
    var minutes: Double;
    var count: Int;
    var countPerMinute: Double;
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You have completed your nth meditation.")
                Text("We're proud on your progress")
                Text("This time, in \(minutes) minutes,\r\n you have tapped \(count) times.")
                Text("This means a rate of \(countPerMinute) per minute.")
                Button {
                        
                    dismiss()
                    // todo: dissmiss twice
                    // swift be like: impossible! 😩
                    // check on https://github.com/frzi/SwiftUIRouter 

                } label: {
                    Text("Start Again")
                }
            }.navigationTitle("Meditation complete")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AfterCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView(minutes: 1.5, count: 17, countPerMinute: 11.33333)
    }
}
