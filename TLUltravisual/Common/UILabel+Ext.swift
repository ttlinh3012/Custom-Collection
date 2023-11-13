//
//  UILabel+Ext.swift
//  mvcsample
//
//  Created by dongnguyen on 04/04/2023.
//

import Foundation
import UIKit

extension UILabel {
    /**
     * @desc anime text like if someone write it
     * @param {String} text,
     * @param {TimeInterval} characterDelay,
     */
    func animate(newText: String, interval: TimeInterval = 0.07, lineSpacing: CGFloat = 1.2, letterSpacing: CGFloat = 1.1) {
        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 1
//        paragraphStyle.lineHeightMultiple = 1
//        paragraphStyle.alignment = .justified
        var pause: TimeInterval = 0
        self.text = ""
        var charIndex = 0.0
        for (idx, letter) in newText.enumerated() {
            Timer.scheduledTimer(withTimeInterval: interval * charIndex + pause, repeats: false) { _ in
                if self.text!.count > 0 {
                    self.text?.removeLast()
                }
                
                self.text?.append(letter)

                let cha = Character(String(stringLiteral: "_"))
                self.text?.append(cha)
                
                if idx >= newText.count - 1 {
                    self.text?.removeLast()
                }

                let attributedString = NSMutableAttributedString(string: self.text ?? "")
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
                attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: attributedString.length - 1))
                self.attributedText = attributedString
            }
            charIndex += 1
            if letter == "," || letter == "." {
                pause += 0.5
            }
        }
    }
}
