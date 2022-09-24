//
//  ContentView.swift
//  epic_things


import SwiftUI

struct loginView: View {
    
    @State private var email: String=""
    @State private var pw: String=""
    @State private var idsave = true
    
       
    struct CheckboxToggleStyle: ToggleStyle {
      @Environment(\.isEnabled) var isEnabled
      let style: Style // custom param

      func makeBody(configuration: Configuration) -> some View {
        Button(action: {
          configuration.isOn.toggle() // toggle the state binding
        }, label: {
          HStack {
            Image(systemName: configuration.isOn ? "checkmark.\(style.sfSymbolName).fill" : style.sfSymbolName)
              .imageScale(.large)
            configuration.label
          }
        })
        .buttonStyle(PlainButtonStyle()) // remove any implicit styling from the button
        .disabled(!isEnabled)
      }

      enum Style {
        case square, circle

        var sfSymbolName: String {
          switch self {
          case .square:
            return "square"
          case .circle:
            return "circle"
          }
        }
      }
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.bottom, 100)
            TextField("이메일", text: $email)
                .frame(width:300, height:20)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(Color("lightGray"))
                .padding(.bottom, 20)
            SecureField("비밀번호", text: $pw)
                .frame(width:300, height:20)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(Color("lightGray"))
                .padding(.bottom,20)
            HStack{
                
                Toggle("", isOn: $idsave)
                    .toggleStyle(CheckboxToggleStyle(style: .circle))
                    .foregroundColor(Color("deepRed"))
                Text("아이디 저장")
                    .foregroundColor(Color("lightGray"))
                    .padding(.trailing,50)
                Button(action:{
                    //게스트로그인 페이지로 이동
                }){
                    Text("게스트 로그인")
                        .frame(width:120, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("deepRed"), lineWidth: 3)
                        )
                        .foregroundColor(Color("deepRed"))
                    }
                    
            }
            Button(action:{
                //로그인
            }){
                Text("로그인")
                    .padding(10)
                    .frame(width:300, height:40)
                    .background(Color("deepRed"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                
            }
            HStack{
                Button(action:{
                    
                }){
                    Text("가입하기")
                        .padding()
                        .foregroundColor(Color("deepRed"))
                }
                Divider()
                    .frame(height: 20)
                Button(action:{
                    
                }){
                    Text("비밀번호 찾기")
                        .padding()
                        .foregroundColor(Color("lightGray"))
                }
            }
            
                
        }.padding(.bottom, 300)
    }
}
struct introView: View {
    var body: some View{
        Text("intro")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
