//
//  ViewController.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var alertView: AlertView!
    var employeeViewModel: EmployeeViewModel!
    let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        employeeViewModel = EmployeeViewModel(sourceUrl: url, delegate: self)
        alertView = AlertView()
        alertView.configureView(in: view, didCallForReload: didCallForReload)
        
        configureTableView()
        employeeViewModel.load()
    }
    
    func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.preservesSuperviewLayoutMargins = true
        tableView.directionalLayoutMargins = .zero
        tableView.separatorStyle = .none
    }
    
    lazy var didCallForReload: ()->() = { [weak self] in
        guard let self = self else {
            return
        }
        self.employeeViewModel.load()
    }
}

