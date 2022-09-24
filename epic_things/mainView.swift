//
//  mainView.swift
//  epic_things

import SwiftUI

struct mainView: View {
    @State var selectedColor = "color"
    var homes = ["우리집", "본가", "기타"]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    
    var body: some View {
        
        VStack() {
            HStack{
                Image("icon_user")
                    .foregroundColor(.accentColor)
                    .offset(x: -100, y:0)
                    
                Text("EPIC things (BLE)")
            }
            .padding(.top,50)
            HStack{
                Rectangle()
                    .foregroundColor(Color("lightGray"))
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
                    .padding(20)
                
                VStack{
//                    Menu("우리집") {
//                        Button("우리집"){}
//                        Button("추가"){}
//                    }
//                    .frame(width:200, height: 40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color("deepRed"), lineWidth: 3)
//                    )
//                    .foregroundColor(Color("deepRed"))
                    Picker("집", selection: $selectedColor) {
                           ForEach(homes, id: \.self) {
                             Text($0)
                           }
                         }
                    .frame(width:200, height: 40)
                    .foregroundColor(Color("deepRed"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("deepRed"), lineWidth: 3)
                    )
                Text("문열림")
                    .foregroundColor(Color("deepRed"))
                    
                }
                .padding(20)
                
            }
            Spacer()
            ZStack() {
                Circle()
                    .fill(Color("lightGray"))
                    .frame(width: 200, height: 200)
                    .offset(x: 0, y:-300)
                Circle()
                    .fill(Color.white)
                    .frame(width: 150, height: 150)
                    .offset(x: 0, y:-300)
                Circle()
                    .fill(Color("deepRed"))
                    .frame(width: 140, height: 140)
                    .offset(x: 0, y:-300)
                
                Circle()
                    .fill(Color("lightGray"))
                    .frame(width: 130, height: 130)
                    .offset(x: 0, y:-300)
                
                Image("icon_unlock")
                   //.frame(width: 50, height: 50)
                    .offset(x: 0, y:-300)
                
                LazyVGrid(columns: columns) {
                    ForEach((0...8), id: \.self) { _ in
                        ZStack(){
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 110, height: 110)
                                .foregroundColor(.white)
                            Image("icon_user")
                                
                        }
                    }
                }
                
             }
            .offset(x: 0, y:20)
            .frame(height: 500)
            .background(Color("lightGray"))
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
            
    }
        
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}

