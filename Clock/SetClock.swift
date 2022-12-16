//
//  ContentView.swift
//  Clock
//
//  Created by Brian Son on 12/15/22.
//
import SwiftUI

struct SetClockView: View {
    @State var action : Int? = 0
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: ClockView().navigationBarBackButtonHidden(), tag: 4, selection: $action) {
                    EmptyView()
                }
                .opacity(0)
                
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.action = 4
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        //placeholder
                    }
                }
            }
            
        }
    }
}


struct CSetlockView_Previews: PreviewProvider {
    static var previews: some View {
        SetClockView()
    }
}
