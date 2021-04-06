//
//  SCDScrollViewAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UIScrollView {
    
    @discardableResult
    public func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator:Bool) -> SCDSwiftKit {
        self.view.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    @discardableResult
    public func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator:Bool) -> SCDSwiftKit {
        self.view.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    @discardableResult
    public func isPagingEnabled(_ isPagingEnabled:Bool) -> SCDSwiftKit {
        self.view.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    public func isScrollEnabled(_ isScrollEnabled:Bool) -> SCDSwiftKit {
        self.view.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    public func delegate(_ delegate:UIScrollViewDelegate?) -> SCDSwiftKit {
        self.view.delegate = delegate
        return self
    }
}
