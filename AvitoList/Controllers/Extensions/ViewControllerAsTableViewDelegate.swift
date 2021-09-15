//
//  ViewControllerAsTableViewDelegate.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
