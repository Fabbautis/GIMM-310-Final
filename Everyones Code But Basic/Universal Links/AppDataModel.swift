//  This is to see what specific Universal Link you opened up is, as well as setting that link as the current Tab / view you're on!
//  AppDataModel.swift
//  New SMS testing
//
//  Created by Fabian Bautista on 4/25/23.
//

import SwiftUI

class AppDataModel: ObservableObject {
    @Published var currentTab: Tab = .scanDewey
    var selectedTab: Wrapper = Wrapper()
    
    func checkDeepLink(url:URL) -> Bool{
        guard let host = URLComponents(url:url, resolvingAgainstBaseURL: true)?.host else {
            return false
        }
        if host == Tab.sendMessage.rawValue{
            currentTab = .sendMessage
        }
        if host == Tab.scanDewey.rawValue{
            currentTab = .scanDewey
        }
        else if host == Tab.scanSticker.rawValue{
            currentTab = .scanSticker
        }
        else{
            return false;
        }
        return true
    }
}

enum Tab: String{
    case scanDewey = "Dewey"
    case sendMessage = "SMS"
    case scanSticker = "Sticker"
}
