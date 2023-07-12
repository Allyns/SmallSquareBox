//
//  ToastViewModifier.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/12.
//

import SwiftUI

struct ToastView:ViewModifier{
    
    @Binding var present:Bool
    @Binding var message:String
    
    var aligment:Alignment = .center
    
    
    func body(content: Content) -> some View {
        ZStack{
            content.zIndex(0)
            VStack{
                
                Text(message)
                    .padding(Edge.Set.horizontal,20)
                    .padding(Edge.Set.vertical,10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: aligment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { v in
                if v {
                    //延迟两秒
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        present.toggle()
                    }
                }
            }
        }
    }

}

extension View{
    func toase(present:Binding<Bool>,message:Binding<String>,aligment:Alignment = .center) -> some View{
    modifier(ToastView(present: present, message: message,aligment: aligment))
  }
}
