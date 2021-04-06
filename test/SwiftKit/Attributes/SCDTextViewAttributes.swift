//
//  SCDTextViewAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UITextView {
    
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
       public func textColor(_ textColor:UIColor) -> SCDSwiftKit {
           self.view.textColor = textColor
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
       public func isEditable(_ isEditable:Bool) -> SCDSwiftKit {
           self.view.isEditable = isEditable
           return self
       }
       
       @discardableResult
       public func textAlignment(_ textAlignment:NSTextAlignment) -> SCDSwiftKit {
           self.view.textAlignment = textAlignment
           return self
       }
       
       @discardableResult
       public func isSecureTextEntry(_ isSecureTextEntry:Bool) -> SCDSwiftKit {
           self.view.isSecureTextEntry = isSecureTextEntry
           return self
       }
       
       @discardableResult
       public func delegate(_ delegate:UITextViewDelegate?) -> SCDSwiftKit {
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
}
