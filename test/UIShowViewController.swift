//
//  UIShowViewController.swift
//  test
//
//  Created by tongwanming on 2021/4/6.
//

import UIKit

class UIShowViewController: BaseViewController {

    let L = UILabel()
    let Btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        // Do any additional setup after loading the view.
    }
    
    func createUI() {
        L.scd.font(16).text("textName").textColor(UIColor.init(rgbValue: 0x123456)).textAlignment(.left).backgroundColor(UIColor.red)
        self.view.addSubview(L)
        L.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(100)
            m.centerX.equalToSuperview()
            m.width.equalTo(200)
            m.height.equalTo(60)
        }
        
        self.view.addSubview(Btn)
        Btn.scd.font(25).title("BtnName").tag(1001).tap(btnClick(tap:)).backgroundColor(UIColor.orange)
        Btn.snp.makeConstraints { (m) in
            m.top.equalTo(L.snp.bottom).offset(50)
            m.width.equalTo(150)
            m.centerX.equalToSuperview()
            m.height.equalTo(60)
        }
    }
    
    func btnClick(tap: UIGestureRecognizer) {
        print("按钮点击事件")
        self.dismiss(animated: true, completion:nil)
    }

}
