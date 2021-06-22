//
//  MessageDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import Foundation
import UIKit

class MessageDataSource: NSObject, UITableViewDataSource {
    
    var MESSAGE_CELL_ID = "MESSAGE_ID"
    
    var dataSource: Array<MessageModel>!
    
    init(dataSource: Array<MessageModel>) {
        self.dataSource = dataSource
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: MESSAGE_CELL_ID, for: indexPath)
        cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: MESSAGE_CELL_ID)
        
        cell.textLabel?.text = dataSource[indexPath.row].chatterText
        cell.imageView?.image = UIImage(named: dataSource[indexPath.row].imageViewName)
        cell.detailTextLabel?.text = dataSource[indexPath.row].chatContentText

        return cell
    }

}
