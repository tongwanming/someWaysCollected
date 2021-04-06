//
//  MJRefreshNormalHeaderNew.swift
//  gtOilMerchant
//
//  Created by tongwanming on 2020/6/2.
//  Copyright © 2020 tiangui. All rights reserved.
//

import UIKit
import MJRefresh

class MJRefreshNormalHeaderNew: MJRefreshNormalHeader {
    var key = ""
    var isFirst = false
    var isSuccess = false
    func setStateLabelColor(color:UIColor) {
        self.stateLabel?.textColor = color
        self.loadingView?.color = color
    }
    
    func setLastUpdatedTimeLabel(color:UIColor) {
        self.lastUpdatedTimeLabel?.textColor = color
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        self.arrowView?.center = CGPoint.init(x: self.mj_w/2 - 35, y: self.mj_h/2)
//        if self.state == .refreshing {
//            self.arrowView?.image =  Asset.Assets.icRefreshLoad.image
//        } else {
//            self.arrowView?.image =  isSuccess ? (isFirst ? Asset.Assets.icRefreshAccess.image : Asset.Assets.icRefreshSuccess.image) :
//                                (isFirst ? Asset.Assets.icRefreshDown.image : Asset.Assets.icRefreshGary.image)
//        }

        self.loadingView?.center = CGPoint.init(x: self.mj_w/2 - 35, y: self.mj_h/2)
        self.loadingView?.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
//        self.loadingView?.color = .white
    }
    
    override var lastUpdatedTimeKey: String{
        
        willSet{
           key = newValue

        }
        didSet {
//            print("lastUpdatedTimeKey\(key)")
            let date = UserDefaults.standard.object(forKey: key)
            self.lastUpdatedTimeLabel?.font = UIFont.systemFont(ofSize: 12)
            self.lastUpdatedTimeLabel?.isHidden = true
            self.stateLabel?.font = UIFont.systemFont(ofSize: 12)
            if (date != nil) {
                self.lastUpdatedTimeLabel?.text = String(format: "上次刷新: %@", GTDateTimeManager.shared().date2String(date as! Date))
            } else {
                self.lastUpdatedTimeLabel?.text = "赠彩随心 公益随行"
            }
        }
    }
    override var state: MJRefreshState {
        didSet {
            let oldState = self.state
            switch state {
            case .idle:
                if oldState == state {
                    self.isSuccess = true
                    
                    UIView.animate(withDuration: 0.4, animations: {
                        self.loadingView?.alpha = 0.0
                       self.loadingView?.stopAnimating()
                       self.arrowView?.isHidden = false
                        
                    }) { (finish) in
                        self.arrowView?.layer.removeAnimation(forKey: "centerLayer")
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                            self.isSuccess = false
                            self.placeSubviews()
                            if self.state == .idle {
                                return
                            }
                            self.loadingView?.alpha = 1.0
                            self.loadingView?.stopAnimating()
                            self.arrowView?.isHidden = false
                        }
                        
                    }
                } else {
                     
                    self.loadingView?.stopAnimating()
                    self.arrowView?.isHidden = false
                    UIView.animate(withDuration: 0.25) {
                        self.arrowView?.transform = .identity
                    }
                }
            case .pulling:
                self.isSuccess = false
                self.loadingView?.stopAnimating()
                self.arrowView?.isHidden = false
                UIView.animate(withDuration: 0.25) {
                    self.arrowView?.transform = .init(rotationAngle: CGFloat(0.000001 - Double.pi))
                }
            case .refreshing:
//                self.isSuccess = false
//                self.loadingView?.alpha = 1.0
//                self.loadingView?.startAnimating()
//                self.arrowView?.isHidden = true
                
                self.isSuccess = false
                self.loadingView?.stopAnimating()
                self.arrowView?.isHidden = false
                
                let a = CABasicAnimation(keyPath: "transform.rotation.z")
                a.fromValue=NSNumber(value:0)//左幅度
                a.toValue=NSNumber(value:Double.pi*2)//右幅度
                a.duration=0.5
                a.repeatCount=HUGE//无限重复
                self.arrowView?.layer.add(a, forKey: "centerLayer")
            default:
                
                self.isSuccess = false
                print("")
            }
        }
    }
   
}
