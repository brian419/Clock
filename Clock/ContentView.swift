//
//  ContentView.swift
//  Clock
//
//  Created by Brian Son on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var action: Int? = 0
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ClockView(counter: 0).navigationBarBackButtonHidden(), tag: 1, selection: $action) {
                    EmptyView()
                }
                    .opacity(0)
                Spacer()
                Text("Welcome to Clock")
                    .font(.custom("Times", size: 35))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
                
                Button("Touch to Start") {
                    self.action = 1
                }
                .padding()
                .foregroundColor(.black)
                .font(.custom("Times", size: 20))
                
                Spacer()
                
            }
            .padding()
        .background(.white)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
