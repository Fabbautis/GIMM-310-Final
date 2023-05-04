//
//  TextScanView.swift
//  Everyones Code But Basic
//
//  Created by Fabian Bautista on 5/4/23.
//

import SwiftUI

struct TextScanView: View {
    @State var started = false;
    
    var body: some View {
        ZStack {
            if started {
                Text("Scan the text now")
            }
            else
            {
                VStack{
                    Text("Scan the text!")
                    Button(action:{ViewController().viewDidLoad();})
                    {
                        Text("Start scanning")
                    }
                }
                
            }
        }
    }
}
