//
//  SMSView.swift
//  Everyones Code But Basic
//
//  Created by Fabian Bautista on 5/4/23.
//

import SwiftUI

struct SMSView: View {
    @State var myMessage: String = "";
    @EnvironmentObject var myAppData:AppDataModel
    let myVC = MessagesViewController()
    var body: some View {
        VStack {
            TextField("Input text here!", text: $myMessage)
            HStack{
                Button(action:{
                    let specialCode: String = myMessage
                    myVC.displayMessageInterface(code: specialCode)
                }){
                    Text("Send message")
                }
            }
        }
        .padding()
    }
}

struct SMSView_Previews: PreviewProvider {
    static var previews: some View {
        SMSView()
    }
}
