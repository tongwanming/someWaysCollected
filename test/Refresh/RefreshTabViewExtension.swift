//
//  RefreshTabViewExtension.swift
//  PetrounHappy
//
//  Created by tongwanming on 2020/8/7.
//  Copyright © 2020 com.petroun. All rights reserved.
//

import Foundation
//import GTFoundation
import MJRefresh
import RxSwift

var refreshHeader:MJRefreshNormalHeaderNew?
var refreshFooter:MJRefreshAutoNormalFooterNew?
let siteNoMoreStr: String = "已显示全部站点"

extension UIScrollView {
  
    func onScrollRefresh(title1: String = " 下拉刷新", type1: MJRefreshState = .idle, title2: String = " 刷新中...", type2: MJRefreshState = .refreshing, title3: String = " 释放刷新", type3: MJRefreshState = .pulling,color:UIColor = UIColor.init(rgbValue: 0x999999), isFirst: Bool = false) -> Observable<Void> {
        let refreshOb = Observable<Void>.create{[weak self] ob in
            let header = MJRefreshNormalHeaderNew(refreshingBlock: {
                 ob.on(.next(()))
            })
            header.isFirst = isFirst
            header.setLastUpdatedTimeLabel(color:color)
            header.setStateLabelColor(color: color)
          
            header.setTitle(title1, for: type1)
            header.setTitle(title2, for: type2)
            header.setTitle(title3, for: type3)
            
            refreshHeader = header
            self?.mj_header = header
            return Disposables.create {
                
            }
        }
        return refreshOb
    }
    
    func canScrollRefreshHeade(can:Bool) {
        if can {
            guard let h = refreshHeader else {
                return
            }
            self.mj_header = h
        } else {
            self.mj_header = nil
        }
    }
    
    func onScrollLoadMore(title1: String = "没有更多咯", type1: MJRefreshState = .noMoreData, title2: String = "上拉加载更多", type2: MJRefreshState = .idle, title3: String = "数据加载中...", type3: MJRefreshState = .refreshing) -> Observable<Void> {
        let refreshOb = Observable<Void>.create{[weak self] ob in

           let footer = MJRefreshAutoNormalFooterNew(refreshingBlock: {
                 ob.on(.next(()))
            })
//            footer.setStateLabelColor(color: UIColor.init(hex: 0x979797))
            footer.setTitle(title1, for: type1)
            footer.setTitle(title2, for: type2)
            footer.setTitle(title3, for: type3)
            refreshFooter = footer
            self?.mj_footer = footer
            return Disposables.create {
            }
        }
        return refreshOb
    }
    
    func endScrollLoadMore(nomore: Bool, title: String = "没有更多咯", height: CGFloat = 40) {
        if nomore {
//            mj_footer?.endRefreshingWithNoMoreData()
            mj_footer = nil
        
        } else {
            mj_footer?.endRefreshing()
        }
    }
    
        func endScrollLoadMoreNormal(nomore: Bool) {
            if nomore {
                mj_footer?.endRefreshingWithNoMoreData()
            } else {
                mj_footer?.endRefreshing()
            }
        }
    
    func refreshScroll() {
        mj_header?.beginRefreshing()
    }
    
    func endRefreshScroll() {
        self.mj_footer?.endRefreshing()
        (mj_header as? MJRefreshNormalHeaderNew)?.setTitle(" 刷新完成", for: .idle)
         mj_header?.endRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            (self.mj_header as? MJRefreshNormalHeaderNew)?.setTitle(" 下拉刷新", for: .idle)
        }
    }
    
}
extension UITableView {
   
    func onRefresh(title1: String = " 下拉刷新", type1: MJRefreshState = .idle, title2: String = " 刷新中...", type2: MJRefreshState = .refreshing, title3: String = " 释放刷新", type3: MJRefreshState = .pulling,color:UIColor = UIColor.init(rgbValue: 0x999999), InsetTop:CGFloat = 0, mjH:CGFloat = 0, isFirst: Bool = false) -> Observable<Void> {
        let refreshOb = Observable<Void>.create{[weak self] ob in
            let header = MJRefreshNormalHeaderNew(refreshingBlock: {
                ob.on(.next(()))
            })
//            header.backgroundColor =  UIColor.init(rgbValue: 0x999999)
         
            header.ignoredScrollViewContentInsetTop = InsetTop
            if mjH > 0 {
                header.mj_h = mjH
            }
            
               
            header.setLastUpdatedTimeLabel(color:color)
            header.setStateLabelColor(color: color)
          
            header.setTitle(title1, for: type1)
            header.setTitle(title2, for: type2)
            header.setTitle(title3, for: type3)
            refreshHeader = header
            self?.mj_header = header
            return Disposables.create {
                
            }
        }
        return refreshOb
    }
   
    func canRefreshHeade(can:Bool) {
        if can {
            guard let h = refreshHeader else {
                return
            }
            self.mj_header = h
        } else {
            self.mj_header = nil
        }
    }
    
    func onLoadMore(title1: String = "没有更多咯", type1: MJRefreshState = .noMoreData, title2: String = "上拉加载更多", type2: MJRefreshState = .idle, title3: String = "加载中...", type3: MJRefreshState = .refreshing, color: UIColor = UIColor.init(rgbValue: 0x999999)) -> Observable<Void> {
        let refreshOb = Observable<Void>.create{[weak self] ob in

           let footer = MJRefreshAutoNormalFooterNew(refreshingBlock: {
                 ob.on(.next(()))
            })
            footer.setStateLabelColor(color: color)
            footer.setTitle(title1, for: type1)
            footer.setTitle(title2, for: type2)
            footer.setTitle(title3, for: type3)
            refreshFooter = footer
            self?.mj_footer = footer
            return Disposables.create {
            }
        }
        return refreshOb
    }
    
    func endLoadMore(nomore: Bool, title: String = "没有更多咯", height: CGFloat = 40) {
        if nomore {
//
            mj_footer?.isHidden = true
            mj_footer?.endRefreshingWithNoMoreData()
            let baseFooter = BaseFooterView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height))
            baseFooter.changeLabenTitle(title: title)
            self.tableFooterView = baseFooter

        } else {
            self.tableFooterView = nil
            mj_footer?.isHidden = false
            mj_footer?.endRefreshing()
        }
    }
    
        func endLoadMoreNormal(nomore: Bool) {
            if nomore {
                mj_footer?.endRefreshingWithNoMoreData()
            } else {
                mj_footer?.endRefreshing()
            }
        }
    
    func refresh() {
        mj_header?.beginRefreshing()
    }
    
    func endRefresh() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.mj_footer?.endRefreshing()
            (self.mj_header as? MJRefreshNormalHeaderNew)?.setTitle(" 刷新完成", for: .idle)
            self.mj_header?.endRefreshing()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                (self.mj_header as? MJRefreshNormalHeaderNew)?.setTitle(" 下拉刷新", for: .idle)
            }
        }
       
       
    }
    
}

extension UICollectionView {
    
    func onRefresh() -> Observable<Void> {
        let refreshOb = Observable<Void>.create{[weak self] ob in
            self?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
                ob.on(.next(()))
            })
            return Disposables.create {
                
            }
        }
        return refreshOb
    }
    
    func refresh() {
        mj_header?.beginRefreshing()
    }
    
    func endRefresh() {
        mj_header?.endRefreshing()
    }
    
}

