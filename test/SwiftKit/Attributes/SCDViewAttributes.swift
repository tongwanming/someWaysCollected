//
//  SCDViewAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

class ViewEventWrapper<T:NSObject> : NSObject, NSCopying{
    private var handler:((T)->Void)?
    
    private override init(){}
    public init(handler:((T)->Void)?) {
        super.init()
        self.handler = handler
    }
    
    @objc func invoke(sender:Any) {
        self.handler?(sender as! T)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return ViewEventWrapper.init(handler: self.handler!)
    }
}

extension SCDSwiftKit where T : UIView {
    
    @discardableResult
      public func addSubview(_ view:UIView) -> SCDSwiftKit {
          self.view.addSubview(view)
          return self
      }
      
      @discardableResult
      public func addSubviews(_ views:UIView ...) -> SCDSwiftKit {
          views.forEach { (view) in
              self.view.addSubview(view)
          }
          return self
      }
      
      @discardableResult
      public func backgroundColor(_ backgroundColor:UIColor) -> SCDSwiftKit {
          self.view.backgroundColor = backgroundColor
          return self
      }
      
      @discardableResult
      public func translatesAutoresizingMaskIntoConstraints(_ translatesAutoresizingMaskIntoConstraints:Bool) -> SCDSwiftKit {
          self.view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
          return self
      }
      
      @discardableResult
      public func tag(_ tag:Int) -> SCDSwiftKit {
          self.view.tag = tag
          return self
      }
      
      @discardableResult
      public func contentMode(_ contentMode:UIView.ContentMode) -> SCDSwiftKit {
          self.view.contentMode = contentMode
          return self
      }
      
      @discardableResult
      public func clipsToBounds(_ clipsToBounds:Bool) -> SCDSwiftKit {
          self.view.clipsToBounds = clipsToBounds
          return self
      }
      
      @discardableResult
      public func alpha(_ alpha:CGFloat) -> SCDSwiftKit {
          self.view.alpha = alpha
          return self
      }
      
      @discardableResult
      public func isUserInteractionEnabled(_ isUserInteractionEnabled:Bool) -> SCDSwiftKit {
          self.view.isUserInteractionEnabled = isUserInteractionEnabled
          return self
      }
      
      @discardableResult
      public func isHidden(_ isHidden:Bool) -> SCDSwiftKit {
          self.view.isHidden = isHidden
          return self
      }
      
      @discardableResult
      public func sizeToFit() -> SCDSwiftKit {
          self.view.sizeToFit()
          return self
      }
      
      @discardableResult
      public func cornerRadius(_ cornerRadius:CGFloat) -> SCDSwiftKit {
          self.view.layer.masksToBounds = true
          self.view.layer.cornerRadius = cornerRadius
          return self
      }
      
      @discardableResult
      public func borderColor(_ borderColor:UIColor) -> SCDSwiftKit {
          self.view.layer.borderColor = borderColor.cgColor
          return self
      }
      
      @discardableResult
      public func borderWidth(_ borderWidth:CGFloat) -> SCDSwiftKit {
          self.view.layer.borderWidth = borderWidth
          return self
      }
      
      @discardableResult
      public func masksToBounds(_ masksToBounds:Bool) -> SCDSwiftKit {
          self.view.layer.masksToBounds = masksToBounds
          return self
      }
      
      @discardableResult
      public func left(_ left:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.x = left
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func left(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.x = view.frame.origin.x
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func right(_ right:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          //        frame.size.width = (self.view.superview?.frame.width ?? 0) - frame.minX - right
          frame.origin.x = (self.view.superview?.frame.width ?? 0) - frame.width - right
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func top(_ top:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.y = top
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func top(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.y = view.frame.origin.y
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func bottom(_ bottom:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.y = bottom - frame.height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func bottom(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.origin.y = view.frame.maxY - frame.height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func width(_ width:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.width = width
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func width(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.width = view.frame.width
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func height(_ height:CGFloat) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.height = height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func height(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.height = view.frame.height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func size(_ size:CGSize) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.width = size.width
          frame.size.height = size.height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func size(_ view:UIView) -> SCDSwiftKit {
          var frame:CGRect = self.view.frame
          frame.size.width = view.frame.width
          frame.size.height = view.frame.height
          self.view.frame = frame
          return self
      }
      
      @discardableResult
      public func centerX(_ centerX:CGFloat) -> SCDSwiftKit {
          self.view.center = CGPoint.init(x: centerX, y: self.view.center.y)
          return self
      }
      
      @discardableResult
      public func centerX(_ view:UIView) -> SCDSwiftKit {
          self.view.center = CGPoint.init(x: view.center.x, y: self.view.center.y)
          return self
      }
      
      @discardableResult
      public func centerY(_ centerY:CGFloat) -> SCDSwiftKit {
          self.view.center = CGPoint.init(x: self.view.center.x, y: centerY)
          return self
      }
      
      @discardableResult
      public func centerY(_ view:UIView) -> SCDSwiftKit {
          self.view.center = CGPoint.init(x: self.view.center.x, y: view.center.y)
          return self
      }
      
      @discardableResult
      public func center(_ view:UIView) -> SCDSwiftKit {
          self.view.center = view.center
          return self
      }
      
      @discardableResult
      public func tap(_ handler:@escaping (UIGestureRecognizer)->Void) -> SCDSwiftKit {
          self.targetWith(key: "viewTarget", handler: handler) { (target, view) in
              view.isUserInteractionEnabled = true
              let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: target, action: #selector(target.invoke(sender:)))
              view.addGestureRecognizer(tap)
          }
          return self
      }
      
      internal func targetWith<U>(key:String, handler:((U)->Void)?, callback:((ViewEventWrapper<U>, T)->Void)) {
          let target:ViewEventWrapper = ViewEventWrapper.init(handler: handler)
          let targetKey:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: key.hashValue)!
          objc_setAssociatedObject(self.view, targetKey, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
          callback(target, self.view)
      }
}
