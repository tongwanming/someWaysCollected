//
//  RefreshViewController.swift
//  test
//
//  Created by tongwanming on 2021/4/6.
//

import UIKit

class RefreshViewController: BaseViewController {

    var listTb = UITableView(frame: .zero, style: .grouped)
    var listData = ["cell_1", "cell_2","cell_3","cell_4","cell_5","cell_6","cell_7","cell_8","cell_9","cell_10","cell_11","cell_12","cell_13","cell_14","cell_15","cell_16",]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "我是title"
        listTb.estimatedSectionFooterHeight = 0
        listTb.estimatedSectionHeaderHeight = 0
        listTb.backgroundColor = UIColor.white
//        listTb.separatorStyle = .none
        listTb.delegate = self
        listTb.dataSource = self
        listTb.showsVerticalScrollIndicator = false
        listTb.register(NormalTableViewCell.self, forCellReuseIdentifier: "NormalTableViewCell")
        self.view.addSubview(listTb)
        listTb.snp.makeConstraints { (m) in
            m.left.right.bottom.equalToSuperview()
            if #available(iOS 11.0, *) {
                m.top.equalTo(self.view.safeAreaInsets)
            } else {
                m.top.equalToSuperview()
            }
        }
        
        let backBtnItem = UIBarButtonItem.init(title: "back", style: .done, target: self, action: #selector(backActive))
        self.navigationItem.leftBarButtonItem = backBtnItem
        
        listTb.onRefresh().subscribe { [weak self](event) in
            print("开始刷新")
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self?.listTb.endRefresh()
            }
//            self?.listTb.endRefresh()
            
        }.disposed(by: self.disposeBag)
        
        listTb.onLoadMore().subscribe { (event) in
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self.listTb.endLoadMore(nomore: true)
            }
        }.disposed(by: self.disposeBag)
        // Do any additional setup after loading the view.
    }
    @objc func backActive() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension RefreshViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = listData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            
            let v = UIShowViewController()
            let nav = UINavigationController.init(rootViewController: v)
            v.title = listData[indexPath.row]
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        default:
            let v = RefreshViewController()
            let nav = UINavigationController.init(rootViewController: v)
            v.title = listData[indexPath.row]
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
}
