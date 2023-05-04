//
//  Wrapper.swift
//  Everyones Code But Basic
//
//  Created by Fabian Bautista on 5/4/23.
//

import SwiftUI

struct Wrapper: View {
    @EnvironmentObject var appData: AppDataModel
    var body: some View {
        var _ = print(appData.currentTab)
        TabView(selection: $appData.currentTab){
            ViewController().viewDidLoad().tabItem { Text("Scan Text") }.tag(Tab.scanDewey)
            SMSView().tabItem { Text("send a message") }.tag(Tab.sendMessage)
            ContentView().tabItem {
                Text("AR Experience")
            }.tag(Tab.scanSticker)
        }
        .accentColor(.gray)
    }
}

struct Wrapper_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
        
    }
}
