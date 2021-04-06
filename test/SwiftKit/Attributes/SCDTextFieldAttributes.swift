//
//  SCDTextFieldAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UITextField {
    
    @discardableResult
      public func text(_ text:String) -> SCDSwiftKit {
          self.view.text = text
          return self
      }
      
      @discardableResult
      public func attributedText(_ attributedText:NSAttributedString?) -> SCDSwiftKit {
          self.view.attributedText = attributedText
          return self
      }
      
      @discardableResult
      public func attributedPlaceholder(_ attributedPlaceholder:NSAttributedString?) -> SCDSwiftKit {
          self.view.attributedPlaceholder = attributedPlaceholder
          return self
      }
      
      @discardableResult
      public func placeholder(_ placeholder:String) -> SCDSwiftKit {
          let placeholderColorKey:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: "placeholderColorKey".hashValue)!
          let color:UIColor? = objc_getAssociatedObject(self.view, placeholderColorKey) as? UIColor
          if let color = color {
              self.view.attributedPlaceholder = NSAttributedString.init(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
          } else {
              self.view.placeholder = placeholder
          }
          return self
      }
      
      @discardableResult
      public func textColor(_ textColor:UIColor) -> SCDSwiftKit {
          self.view.textColor = textColor
          return self
      }
      
      @discardableResult
      public func placeholderColor(_ placeholderColor:UIColor) -> SCDSwiftKit {
          let placeholderColorKey:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: "placeholderColorKey".hashValue)!
          objc_setAssociatedObject(self.view, placeholderColorKey, placeholderColor, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
          return self
      }
      
      @discardableResult
      public func font(_ font:CGFloat) -> SCDSwiftKit {
          self.view.font = UIFont.systemFont(ofSize: font)
          return self
      }
      
      @discardableResult
      public func boldFont(_ boldFont:CGFloat) -> SCDSwiftKit {
          self.view.font = UIFont.boldSystemFont(ofSize: boldFont)
          return self
      }
      
      @discardableResult
      public func textAlignment(_ textAlignment:NSTextAlignment) -> SCDSwiftKit {
          self.view.textAlignment = textAlignment
          return self
      }
      
      @discardableResult
      public func isHighlighted(_ isHighlighted:Bool) -> SCDSwiftKit {
          self.view.isHighlighted = isHighlighted
          return self
      }
      
      @discardableResult
      public func isEnabled(_ isEnabled:Bool) -> SCDSwiftKit {
          self.view.isEnabled = isEnabled
          return self
      }
      
      @discardableResult
      public func isSecureTextEntry(_ isSecureTextEntry:Bool) -> SCDSwiftKit {
          self.view.isSecureTextEntry = isSecureTextEntry
          return self
      }
      
      @discardableResult
      public func delegate(_ delegate:UITextFieldDelegate?) -> SCDSwiftKit {
          self.view.delegate = delegate
          return self
      }
      
      @discardableResult
      public func keyboardType(_ keyboardType:UIKeyboardType) -> SCDSwiftKit {
          self.view.keyboardType = keyboardType
          return self
      }
      
      @discardableResult
      public func becomeFirstResponder() -> SCDSwiftKit {
          self.view.becomeFirstResponder()
          return self
      }
      
      @discardableResult
      public func leftView(_ leftView:UIView?) -> SCDSwiftKit {
          self.view.leftView = leftView
          return self
      }
      
      @discardableResult
      public func rightView(_ rightView:UIView?) -> SCDSwiftKit {
          self.view.rightView = rightView
          return self
      }
      
      @discardableResult
      public func leftViewMode(_ leftViewMode:UITextField.ViewMode) -> SCDSwiftKit {
          self.view.leftViewMode = leftViewMode
          return self
      }
      
      @discardableResult
      public func rightViewMode(_ rightViewMode:UITextField.ViewMode) -> SCDSwiftKit {
          self.view.rightViewMode = rightViewMode
          return self
      }
      
      @discardableResult
      public func clearButtonMode(_ clearButtonMode:UITextField.ViewMode) -> SCDSwiftKit {
          self.view.clearButtonMode = clearButtonMode
          return self
      }
      
      @discardableResult
      public func addTarget(_ target:Any?, action:Selector, for event:UIControl.Event) -> SCDSwiftKit {
          self.view.addTarget(target, action: action, for: event)
          return self
      }
}
