//
//  SCDButtonAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UIButton {
    
    @discardableResult
       public func title(_ title:String, for state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setTitle(title, for: state)
           return self
       }
       
       @discardableResult
       public func titleColor(_ titleColor:UIColor, for state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setTitleColor(titleColor, for: state)
           return self
       }
       
       @discardableResult
       public func image(_ image:UIImage?, for state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setImage(image, for: state)
           return self
       }
       
       @discardableResult
       public func imageNamed(_ imageNamed:String, for state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setImage(UIImage.init(named: imageNamed), for: state)
           return self
       }
       
       @discardableResult
       public func backgroundImageNamed(_ imageNamed:String, for  state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setBackgroundImage(UIImage.init(named: imageNamed), for: state)
           return self
       }
       
       @discardableResult
       public func backgroundImage(_ image:UIImage?, for  state:UIControl.State = .normal) -> SCDSwiftKit {
           self.view.setBackgroundImage(image, for: state)
           return self
       }
       
       @discardableResult
       public func backgroundColor(_ backgroundColor:UIColor, for  state:UIControl.State = .normal) -> SCDSwiftKit {
           let image = self.image(from: backgroundColor)
           self.view.setBackgroundImage(image, for: state)
           return self
       }
       
       @discardableResult
       public func event(_ event:UIControl.Event, handler:((UIButton)->Void)?) -> SCDSwiftKit {
           self.targetWith(key: "buttonTarget", handler: handler) { (target, button) in
               button.addTarget(target, action: #selector(target.invoke(sender:)), for: event)
           }
           return self
       }
       
       @discardableResult
       public func click(_ handler:((UIButton)->Void)?) -> SCDSwiftKit {
           return self.event(.touchUpInside, handler: handler)
       }
       
       @discardableResult
       public func isSelected(_ isSelected:Bool) -> SCDSwiftKit {
           self.view.isSelected = isSelected
           return self
       }
       
       @discardableResult
       public func isEnabled(_ isEnabled:Bool) -> SCDSwiftKit {
           self.view.isEnabled = isEnabled
           return self
       }
       
       @discardableResult
       public func font(_ font:CGFloat) -> SCDSwiftKit {
           //        let font = font / 4.0 * 3.0
           self.view.titleLabel?.font = UIFont.systemFont(ofSize: font)
           return self
       }
       
       @discardableResult
       public func boldFont(_ boldFont:CGFloat) -> SCDSwiftKit {
           //        let boldFont = boldFont / 4.0 * 3.0
           self.view.titleLabel?.font = UIFont.boldSystemFont(ofSize: boldFont)
           return self
       }
       
       @discardableResult
       public func tintColor(_ tintColor:UIColor) -> SCDSwiftKit {
           self.view.tintColor = tintColor
           return self
       }
       
       @discardableResult
       public func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> SCDSwiftKit {
           self.view.contentEdgeInsets = contentEdgeInsets
           return self
       }
       
       @discardableResult
       public func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> SCDSwiftKit {
           self.view.imageEdgeInsets = imageEdgeInsets
           return self
       }
       
       @discardableResult
       public func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> SCDSwiftKit {
           self.view.titleEdgeInsets = titleEdgeInsets
           return self
       }
       
       @discardableResult
       public func auto() -> SCDSwiftKit {
           let size:CGSize = self.view.sizeThatFits(UIScreen.main.bounds.size)
           self.view.frame.size = size
           return self
       }
       
       private func image(from color:UIColor) -> UIImage {
           let size:CGSize = CGSize.init(width: 1, height: 1)
           let rect = CGRect(origin: CGPoint.zero, size: size)
           UIGraphicsBeginImageContextWithOptions(size, false, 0)
           color.setFill()
           UIRectFill(rect)
           let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           return UIImage.init(cgImage: image.cgImage!)
       }
}
