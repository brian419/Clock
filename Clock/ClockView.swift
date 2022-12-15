//
//  ContentView.swift
//  Clock
//
//  Created by Brian Son on 12/9/22.
//
import SwiftUI
import Combine
struct ClockView: View {
    @State var action : Int? = 0
    @State var counter : Int = 0
    @State private var items = [Int]()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(), tag: 2, selection: $action) {
                    EmptyView()
                }
                .opacity(0)
                Spacer()
                Text("Press Add to add a new alarm!")
                List {
                    ForEach(items, id: \.self) { item in
                        Text("Row \(item)")
                    }
//                    .padding()
//                    .listRowBackground(Color.black)
//                    .foregroundColor(Color.white)
//                    .font(.custom( "Times", size: 15))
//                    .frame(maxWidth: .infinity)
                }

            }
            
            .background(.white)
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
                    Button("Add") {
                        self.items.append(self.items.count + 1)
                    }
                    //.foregroundColor(.white)
                }
            }
            
        }
    }
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(counter: 0)
    }
}
