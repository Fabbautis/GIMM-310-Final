//  This is to see what specific Universal Link you opened up is, as well as setting that link as the current Tab / view you're on!
//  AppDataModel.swift
//  New SMS testing
//
//  Created by Fabian Bautista on 4/25/23.
//

import SwiftUI

class AppDataModel: ObservableObject {
    @Published var currentTab: Tab = .scanDewey
    @Published var currentExperience: Int? = 1
    
    func checkDeepLink(url:URL) -> Bool{
        guard let host = URLComponents(url:url, resolvingAgainstBaseURL: true)?.host else {
            return false
        }
        if host == Tab.sendMessage.rawValue{
            currentTab = .sendMessage
        }
        else if host == Tab.scanDewey.rawValue{
            currentTab = .scanDewey
        }
        else if host == Tab.scanSticker.rawValue{
            currentTab = .scanSticker
        }
        else{
            return checkInternalLinks(host: host)
            
        }
        return true
    }
    
    //this is for if a user has a subdirectory inside the link (testingLinks://Message/12)
    func checkInternalLinks(host: String) -> Bool{
        if let index = availableExperiences.firstIndex(where: { experience in
            return experience.id == Int(host);
        }){
            currentTab = .scanSticker
            currentExperience = availableExperiences[index].id
            return true
        }
        return false
    }
}

enum Tab: String{
    case scanDewey = "Dewey"
    case sendMessage = "SMS"
    case scanSticker = "Sticker"
}
