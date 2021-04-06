//
//  BaseFooterView.swift
//  gtOilMerchant
//
//  Created by tongwanming on 2020/5/25.
//  Copyright © 2020 tiangui. All rights reserved.
//

import UIKit
import SnapKit

class BaseFooterView: UIView {
    var bbl = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeLabenTitle(title: String) {
        bbl.scd.text(title)
    }
    
    func configUI() {
        let bottomv = UIView(frame: self.frame)
        self.addSubview(bottomv)
        
        bbl.scd.font(14).text("已显示全部站点").textColor(UIColor.init(rgbValue: 0x999999))
        bottomv.addSubview(bbl)
        bbl.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.equalTo(20)
        }
        
//        let leftbline = UIView()
//        leftbline.backgroundColor = UIColor.init(rgbValue: 0xdfdfdf)
//        let rightbline = UIView()
//        rightbline.backgroundColor = UIColor.init(rgbValue: 0xdfdfdf)
//        bottomv.addSubview(leftbline)
//        leftbline.snp.makeConstraints { (m) in
//            m.right.equalTo(bbl.snp.left).offset(-12)
//            m.height.equalTo(0.5)
//            m.width.equalTo(25)
//            m.centerY.equalToSuperview()
//        }
//        bottomv.addSubview(rightbline)
//        rightbline.snp.makeConstraints { (m) in
//            m.left.equalTo(bbl.snp.right).offset(12)
//            m.height.equalTo(0.5)
//            m.width.equalTo(25)
//            m.centerY.equalToSuperview()
//        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
