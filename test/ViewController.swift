//
//  ViewController.swift
//  test
//
//  Created by tongwanming on 2021/4/6.
//

import UIKit

class ViewController: UIViewController {
    var listTb = UITableView(frame: .zero, style: .grouped)
    var listData = ["链式ui", "刷新"]
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
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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

