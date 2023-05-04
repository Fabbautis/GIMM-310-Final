//
//  IDofARNav.swift
//  Everyones Code But Basic
//
//  Created by Fabian Bautista on 5/4/23.
//

import SwiftUI

struct ARExper: Identifiable{
    var id: Int
    var name: String
}

//ID for a specific AR Experience
var availableExperiences: [ARExper] = [
    ARExper(id: 0, name: "please rescan"),
    ARExper(id: -1, name: "To the left"),
    ARExper(id: 1, name: "To the right"),
    ARExper(id: -2, name: "To the left x2"),
    ARExper(id: 2, name: "To the right x2"),
    ARExper(id: -3, name: "To the left x3"),
    ARExper(id: 3, name: "To the right x3"),
    ARExper(id: 4, name: "To the left x4"),
    ARExper(id: -4, name: "To the right x4"),
    ARExper(id: -5, name: "To the left backwards"),
    ARExper(id: 5, name: "To the right backwards"),
    ARExper(id: -6, name: "To the left backwards x2"),
    ARExper(id: 6, name: "To the right backwards x2"),
    ARExper(id: -7, name: "To the left backwards x3"),
    ARExper(id: 7, name: "To the right backwards x3"),
    ARExper(id: 8, name: "To the left backwards x4"),
    ARExper(id: -8, name: "To the right backwards x4"),
]

