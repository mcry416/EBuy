//
//  ConfigDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/4.
//

import UIKit

class ConfigDataSource: NSObject, UITableViewDataSource {
    
    let CONFIG_CELL_ID = "CONFIG_ID"
    
    var dataSource: Array<String> = ["清除缓存", "允许喜好分析", "我要借贷", "反馈", "关于"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CONFIG_CELL_ID, for: indexPath)
        cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CONFIG_CELL_ID)
        
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.imageView?.image = UIImage(named: "settings")
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }

}
