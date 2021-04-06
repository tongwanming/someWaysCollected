//
//  SCDTableViewAttributes.swift
//  SCDTabDemo
//
//  Created by gt001 on 2019/12/13.
//  Copyright © 2019 gt001. All rights reserved.
//

import UIKit

extension SCDSwiftKit where T : UITableView {
    
    @discardableResult
       public func delegate(_ delegate:UITableViewDelegate?) -> SCDSwiftKit {
           self.view.delegate = delegate
           return self
       }
       
       @discardableResult
       public func dataSource(_ dataSource:UITableViewDataSource?) -> SCDSwiftKit {
           self.view.dataSource = dataSource
           return self
       }
       
       @discardableResult
       public func register(_ cellClass:AnyClass?, forCellReuseIdentifier:String) -> SCDSwiftKit {
           self.view.register(cellClass, forCellReuseIdentifier: forCellReuseIdentifier)
           return self
       }
       
       @discardableResult
       public func register(_ nib:UINib?, forCellReuseIdentifier:String) -> SCDSwiftKit {
           self.view.register(nib, forCellReuseIdentifier: forCellReuseIdentifier)
           return self
       }
       
       @discardableResult
       public func register(_ aClass:AnyClass?, forHeaderFooterViewReuseIdentifier:String) -> SCDSwiftKit {
           self.view.register(aClass, forHeaderFooterViewReuseIdentifier: forHeaderFooterViewReuseIdentifier)
           return self
       }
       
       @discardableResult
       public func separatorStyle(_ separatorStyle:UITableViewCell.SeparatorStyle) -> SCDSwiftKit {
           self.view.separatorStyle = separatorStyle
           return self
       }
       
       @discardableResult
       public func separatorColor(_ separatorColor:UIColor) -> SCDSwiftKit {
           self.view.separatorColor = separatorColor
           return self
       }
       
       @discardableResult
       public func separatorInset(_ separatorInset:UIEdgeInsets) -> SCDSwiftKit {
           self.view.separatorInset = separatorInset
           return self
       }
       
       @discardableResult
       public func tableHeaderView(_ tableHeaderView:UIView) -> SCDSwiftKit {
           self.view.tableHeaderView = tableHeaderView
           return self
       }
       
       @discardableResult
       public func tableFooterView(_ tableFooterView:UIView) -> SCDSwiftKit {
           self.view.tableFooterView = tableFooterView
           return self
       }
       
       @discardableResult
       public func rowHeight(_ rowHeight:CGFloat) -> SCDSwiftKit {
           self.view.rowHeight = rowHeight
           return self
       }
       
       @discardableResult
       public func estimatedRowHeight(_ estimatedRowHeight:CGFloat) -> SCDSwiftKit {
           self.view.estimatedRowHeight = estimatedRowHeight
           return self
       }
       
       @discardableResult
       public func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight:CGFloat) -> SCDSwiftKit {
           self.view.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
           return self
       }
       
       @discardableResult
       public func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight:CGFloat) -> SCDSwiftKit {
           self.view.estimatedSectionFooterHeight = estimatedSectionFooterHeight
           return self
       }
    
}
