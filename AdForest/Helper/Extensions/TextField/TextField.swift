//
//  TextField.swift
//  AdForest
//
//  Created by Apple on 7/13/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
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
}

extension UITextField {
    func addLeftImage(image: UIImage, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = image
        leftView = imageView
    }
}
private var KeyMaxLength: Int = 0

    extension UITextField{
        @IBInspectable var placeHolderColor: UIColor? {
            get {
                return self.placeHolderColor
            }
            set {
                self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
            }
        }
        @IBInspectable
            var cornerRadius: CGFloat {
                get {
                    return layer.cornerRadius
                }
                set {
                    layer.cornerRadius = newValue
                    layer.masksToBounds = newValue > 0
                }
            }
            
            @IBInspectable
            var borderWidth: CGFloat {
                get {
                    return layer.borderWidth
                }
                set {
                    layer.borderWidth = newValue
                }
            }
            
            @IBInspectable
            var borderColor: UIColor? {
                get {
                    let color = UIColor.init(cgColor: layer.borderColor!)
                    return color
                }
                set {
                    layer.borderColor = newValue?.cgColor
                }
            }
            
            @IBInspectable
            var shadowRadius: CGFloat {
                get {
                    return layer.shadowRadius
                }
                set {
                    layer.shadowColor = UIColor.black.cgColor
                    layer.shadowOffset = CGSize(width: 0, height: 2)
                    layer.shadowOpacity = 0.4
                    layer.shadowRadius = shadowRadius
                }
            }
        @IBInspectable var maxLength: Int {
                get {
                    if let length = objc_getAssociatedObject(self, &KeyMaxLength) as? Int {
                        return length
                    } else {
                        return Int.max
                    }
                }
                set {
                    objc_setAssociatedObject(self, &KeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
                    addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
                }
            }
            
            @objc func checkMaxLength(textField: UITextField) {
                guard let prospectiveText = self.text,
                    prospectiveText.count > maxLength
                    else {
                        return
                }
                
                let selection = selectedTextRange
                let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
                text = prospectiveText.substring(to: maxCharIndex)
                selectedTextRange = selection
            }
        
        func addBottomBorder(){
                let bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
                bottomLine.backgroundColor = UIColor.white.cgColor
                borderStyle = .none
                layer.addSublayer(bottomLine)
            }
        func addBottomBorder1(){
                let bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
                bottomLine.backgroundColor = UIColor.black.cgColor
                borderStyle = .none
                layer.addSublayer(bottomLine)
            }
        
    }
