//
//  ViewModelDelegate.swift
//  AvitoList
//
//  Created by Saparbek . on 11.09.2021.
//

import Foundation
protocol EmployeeViewModelDelegate: AnyObject{
    func didUpdateEmployees(error: NetworkingError?)
    func willUpdateEmployees()
}

extension ViewController: EmployeeViewModelDelegate {
    func didUpdateEmployees(error: NetworkingError?){
        if let error = error {
            self.alertView.showFailedAtlertView()
            return
        }
        
        self.alertView.hide()
        self.tableView.reloadData()
    }
    
    func willUpdateEmployees(){
        self.alertView.showLoadingAtlertView()
    }
}
