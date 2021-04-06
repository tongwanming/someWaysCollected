//
//  MJRefreshAutoNormalFooterNew.swift
//  gtOilMerchant
//
//  Created by tongwanming on 2020/6/2.
//  Copyright © 2020 tiangui. All rights reserved.
//

import UIKit
import MJRefresh

class MJRefreshAutoNormalFooterNew: MJRefreshAutoNormalFooter {

    func setStateLabelColor(color:UIColor) {
        self.stateLabel?.textColor = color
    }
    
    func setStatelabelAttributeName(str:NSAttributedString) {
        self.stateLabel?.attributedText = str
    }

}
