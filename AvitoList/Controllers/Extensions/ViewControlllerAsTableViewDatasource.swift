//
//  ViewControlllerAsTableViewDatasource.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return employeeViewModel.employees.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeCell
        
        let employee = employeeViewModel.employees[indexPath.section]
        cell.configureView(employee: employee)
        return cell
    }
}
