//
//  mainView.swift
//  epic_things

import SwiftUI



struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}

struct DoorLock: View {
    var body: some View {
        VStack() {
            HStack{
                Text("등록가능한 도어락")
                Image(systemName:"gobackward")
                    .foregroundColor(Color("deepRed"))
            }
            List{
                Text("도어락: 1")
                Text("도어락: 2")
                Text("도어락: 3")
            }
            Button("등록"){}
            .foregroundColor(Color("deepRed"))
        
        }
    }
}


struct mainView: View {
    
//    @State var menu: [String] = ["맴버", "도어록", "키", "초대", "게스트 키", "설정","와이파이 브릿지", "히스토리",""]
//    @State var menuIcon = ["person.2","entry.lever.keypad","key","person.crop.circle.badge.plus","clock","gearshape","wifi","list.clipboard"]

    @State var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    private struct MenuList: Identifiable {
        let menu: String
        let menuIcon: String
        var id: String { menu }
    }
    private let menuList: [MenuList] = [
        MenuList(menu: "맴버", menuIcon: "person.2"),
        MenuList(menu: "도어록", menuIcon: "entry.lever.keypad"),
        MenuList(menu: "키", menuIcon: "key"),
        MenuList(menu: "초대", menuIcon: "person.crop.circle.badge.plus"),
        MenuList(menu: "게스트 키", menuIcon: "clock"),
        MenuList(menu: "설정", menuIcon: "gearshape"),
        MenuList(menu: "와이파이 브릿지", menuIcon: "wifi"),
        MenuList(menu: "히스토리", menuIcon: "list.clipboard"),
        MenuList(menu: "", menuIcon: "")
    ]

    
    
    @State var selectedlocation = "우리집"
    var location = ["우리집", "회사", "큰집"]
    
    
    var body: some View {
        NavigationStack {
        VStack() {
            HStack{
                Image("icon_user")
                    .foregroundColor(.accentColor)
                    .offset(x: -100, y:0)
                    
                Text("EPIC things (BLE)")
            }
            //.padding(.top,50)
            HStack{
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("lightGray"), lineWidth: 2))
                    .padding(20)
                
                VStack{
//                    Menu("우리집") {
//                        Button("우리집"){}
//                        Button("회사"){}
//                        Button("큰집"){}
//                    }
//                    .frame(width:200, height: 40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color("deepRed"), lineWidth: 3)
//                    )
//                    .foregroundColor(Color("deepRed"))
                    
                    Picker("우리집", selection: $selectedlocation) {
                           ForEach(location, id: \.self) {
                             Text($0)
                           }
                         }
                    .frame(width:200, height: 40)
                    //.foregroundColor(Color("deepRed"))
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
                    .offset(x: 0, y:-275)
                Circle()
                    .fill(Color.white)
                    .frame(width: 160, height: 160)
                    .offset(x: 0, y:-275)
                    .shadow(radius: 10)
                Circle()
                    .fill(Color("deepRed"))
                    .frame(width: 140, height: 140)
                    .offset(x: 0, y:-275)
                
                Circle()
                    .fill(Color("lightGray"))
                    .frame(width: 130, height: 130)
                    .offset(x: 0, y:-275)
                
                Image("icon_unlock")
                   //.frame(width: 50, height: 50)
                    .offset(x: 0, y:-275)
                
                
            LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(menuList) { menuList in
                        ZStack(){
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 120, height: 120)
                                .foregroundColor(.white)
                            
                            Image(systemName: menuList.menuIcon)
                              .foregroundColor(Color("deepRed"))
                              .font(.system(size: 30))
                               
                            NavigationLink(menuList.menu) { DoorLock() }
                                .offset(x:0, y:30)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                
                        }
                    }
                }
                
             }
            .offset(x: 0, y:20)
            .frame(height: 475)
            .background(Color("lightGray"))
            
        }
        .navigationBarTitle("")
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
            
    }
        
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}

