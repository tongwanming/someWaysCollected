//
//  SCDLabelAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UILabel {
    
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
           //        let font = font / 4.0 * 3.0
           self.view.font = UIFont.systemFont(ofSize: font)
           return self
       }
       
       @discardableResult
       public func boldFont(_ boldFont:CGFloat) -> SCDSwiftKit {
           //        let boldFont = boldFont / 4.0 * 3.0
           self.view.font = UIFont.boldSystemFont(ofSize: boldFont)
           return self
       }
       
       @discardableResult
       public func numberOfLines(_ numberOfLines:Int) -> SCDSwiftKit {
           self.view.numberOfLines = numberOfLines
           return self
       }
       
       @discardableResult
       public func textAlignment(_ textAlignment:NSTextAlignment) -> SCDSwiftKit {
           self.view.textAlignment = textAlignment
           return self
       }
       
       @discardableResult
       public func lineBreakMode(_ lineBreakMode:NSLineBreakMode) -> SCDSwiftKit {
           self.view.lineBreakMode = lineBreakMode
           return self
       }
       
       @discardableResult
       public func highlightedTextColor(_ highlightedTextColor:UIColor) -> SCDSwiftKit {
           self.view.highlightedTextColor = highlightedTextColor
           return self
       }
       
       @discardableResult
       public func isHighlighted(_ isHighlighted:Bool) -> SCDSwiftKit {
           self.view.isHighlighted = isHighlighted
           return self
       }
       
       @discardableResult
       public func auto() -> SCDSwiftKit {
           let size:CGSize = self.view.sizeThatFits(UIScreen.main.bounds.size)
           self.view.frame.size = size
           return self
       }
}
