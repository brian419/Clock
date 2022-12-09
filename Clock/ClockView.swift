//
//  ContentView.swift
//  Clock
//
//  Created by Brian Son on 12/9/22.
//

import SwiftUI

struct ClockView: View {
    @State var action : Int? = 0
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(), tag: 2, selection: $action) {
                    EmptyView()
                }
                    .opacity(0)
                Text("Placeholder")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.custom( "Times", size: 30))
                    
            }
            .padding()
            .background(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        self.action = 2
                    }
                    //.foregroundColor(.white)
                }
            }
            .toolbar {
                ToolbarItem() {
                    Button("Done") {
                        
                    }
                    //.foregroundColor(.white)
                }
        }
        }
    }
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
