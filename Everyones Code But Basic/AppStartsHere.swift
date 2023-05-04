//
//  New_SMS_testingApp.swift
//  New SMS testing
//
//  Created by Fabian Bautista on 4/21/23.
//

import SwiftUI
@main
struct AppStartsHere: App {
    @StateObject var myAppData:AppDataModel = AppDataModel()
    var body: some Scene {
        WindowGroup {
            Wrapper()
                .environmentObject(myAppData)
                .onOpenURL { url in
                    if myAppData.checkDeepLink(url: url){
                        print("This is one of the options you can choose from the app")
                    } else{
                        print("This is not one of the options from the app")
                    }
                }
        }
    }
}
