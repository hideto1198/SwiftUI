//
//  KeyboardObserver.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/15.
//

import Foundation
import SwiftUI

class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0.0
    
    func startObserve() {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(keyboardWillChangeFrame),
                name: UIResponder.keyboardWillChangeFrameNotification,
                object: nil
            )
    }
    
    func stopObserve() {
        NotificationCenter
            .default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillChangeFrameNotification,
                object: nil
            )
    }
    
    @objc
    func keyboardWillChangeFrame(_ notification: Notification) {
        if let keyboardEndFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
           let keyboardBeginFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            let endMinY = keyboardEndFrame.cgRectValue.minY
            let beginMinY = keyboardBeginFrame.cgRectValue.minY
            self.keyboardHeight = beginMinY - endMinY
            if self.keyboardHeight < 0 {
                self.keyboardHeight = 0
            }
        }
    }
    
}
