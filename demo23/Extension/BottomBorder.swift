//
//  borrderExtension.swift
//  demo23
//
//  Created by An Nguyen on 12/3/19.
//  Copyright © 2019 An Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
//    func setBottomBorder() {
//      self.layer.backgroundColor = UIColor.white.cgColor
//
////      self.layer.masksToBounds = false
//      self.layer.shadowColor = UIColor.gray.cgColor
//      self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//      self.layer.shadowOpacity = 1.0
//      self.layer.shadowRadius = 0.0
//    }
}
extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
    func underline(_ color : UIColor){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
         self.leftView = paddingView
         self.leftViewMode = .always
     }
     func setRightPaddingPoints(_ amount:CGFloat) {
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
         self.rightView = paddingView
         self.rightViewMode = .always
     }
}
extension UITextView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.frame(forAlignmentRect:  CGRect(x: self.frame.origin.x, y: self.frame.origin.y+self.frame.height-width, width: self.frame.width, height: width))
        border.backgroundColor = color
        self.superview!.insertSubview(border, aboveSubview: self)
    }
}


//extension UITextView : UITextFieldDelegate {
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
//        let newLines = text.components(separatedBy: CharacterSet.newlines)
//        let linesAfterChange = existingLines.count + newLines.count - 1
//        return linesAfterChange <= textView.textContainer.maximumNumberOfLines
//    }
//}

