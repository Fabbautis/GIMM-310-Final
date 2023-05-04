//
//  MessagesViewController.swift
//  New SMS testing
//
//  Created by Fabian Bautista on 4/21/23.
//

import MessageUI
import UIKit
import SwiftUI

protocol MessagesViewDelegate{
    func messageCompletion(result: MessageComposeResult)
}

class MessagesViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    var delegate: MessagesViewDelegate?
    var recipients: [String]?
    var body: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayMessageInterface(code: String){
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        //configure the fields of the interface
        body = "Hello, I am in " + code + " and I need help finding..."
        composeVC.recipients = self.recipients ?? ["2089195908"]
        composeVC.body = body ?? ""
        
        //Present the view controller modally
        if MFMessageComposeViewController.canSendText(){
            let topVC = topMostController()
            topVC.present(composeVC, animated: true, completion: nil)
        } else {
            self.delegate?.messageCompletion(result: MessageComposeResult.failed)
        }
    }
   
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
        self.delegate?.messageCompletion(result: result)
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            print("top controller is open")
            topController = topController.presentedViewController!
        }
        return topController
    }
}

struct MessageUIView:UIViewControllerRepresentable{
    
    //To be able to dismiss itself after successfully finishing with the MessageUI
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var recipients: [String]
    @Binding var body: String
    var completion: ((_ result: MessageComposeResult) -> Void)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> MessagesViewController {
        let controller = MessagesViewController()
        controller.delegate = context.coordinator
        controller.recipients = recipients
        controller.body = body
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MessagesViewController, context: Context) {
        uiViewController.recipients = recipients
        uiViewController.displayMessageInterface(code: "1000")
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, MessagesViewDelegate {
        var parent: MessageUIView
        
        init(_ controller: MessageUIView){
            self.parent = controller
        }
        
        func messageCompletion(result: MessageComposeResult){
            self.parent.presentationMode.wrappedValue.dismiss()
            self.parent.completion(result)
        }
    }
}
