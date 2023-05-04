//
//  ContentView.swift
//  Multi-ARview Selector
//
//  Created by Brady Wright on 4/27/23.
//

import SwiftUI
import RealityKit


var pickScene: Int = -2
var pickDirection: Int = 1

struct ContentView : View {
    @EnvironmentObject var appData: AppDataModel
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
            .environmentObject(appData)
    }
}

struct ARViewContainer:
                            
    UIViewRepresentable {
    @EnvironmentObject var appData: AppDataModel
    func makeUIView(context: Context) -> ARView {
        
        pickScene = appData.currentExperience!
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        if abs(pickScene) > 4{
            pickDirection = 1
        } else {
            pickDirection = -1
        }
        
        switch(pickScene) {
        case 1, 5: let sceneAnchor = try! Experience.loadRightOne()
            arView.scene.anchors.append(sceneAnchor)
        case 2, 6: let sceneAnchor = try! Experience.loadRightTwo()
            arView.scene.anchors.append(sceneAnchor)
        case 3, 7: let sceneAnchor = try! Experience.loadRightThree()
            arView.scene.anchors.append(sceneAnchor)
        case 4, 8: let sceneAnchor = try! Experience.loadRightFour()
            arView.scene.anchors.append(sceneAnchor)
        
        case -1,-5: let sceneAnchor = try! Experience.loadLeftOne()
            arView.scene.anchors.append(sceneAnchor)
        case -2,-6: let sceneAnchor = try! Experience.loadLeftTwo()
            arView.scene.anchors.append(sceneAnchor)
        case -3,-7: let sceneAnchor = try! Experience.loadLeftThree()
            arView.scene.anchors.append(sceneAnchor)
        case -4,-8: let sceneAnchor = try! Experience.loadLeftFour()
            arView.scene.anchors.append(sceneAnchor)
            
        default:
            let sceneAnchor = try! Experience.loadLeftFour()
                arView.scene.anchors.append(sceneAnchor) //extreme value to see if this works
        }
        
        if(pickDirection == 1) {
            let arrowAnchor = try! Experience.loadLookBackwards()
            arView.scene.anchors.append(arrowAnchor)
        } else if (pickDirection == -1) {
            let arrowAnchor = try! Experience.loadLookForward()
            arView.scene.anchors.append(arrowAnchor)
        }
        
        
        // Add the box anchor to the scene
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
