//
//  SCDSwiftKit.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import Foundation
import UIKit

public final class SCDSwiftKit<T> {
    public let view:T
    public init(_ view:T) {
        self.view = view
    }
}

public protocol SCDSwiftKitCompatible {
    associatedtype SCDSwiftKitType   //关联类型
    var scd:SCDSwiftKitType { get }
}

public extension SCDSwiftKitCompatible {
    var scd:SCDSwiftKit<Self> {
        get { return SCDSwiftKit.init(self) }
    }
}

extension UIView: SCDSwiftKitCompatible {}
