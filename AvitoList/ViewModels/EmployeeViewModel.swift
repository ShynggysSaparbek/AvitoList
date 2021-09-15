//
//  EmployeeViewModel.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import Foundation
class EmployeeViewModel {
    var employees: [Employee]
    private weak var delegate: EmployeeViewModelDelegate?
    private var cache: CompanyCashe
    private var avitoNetworkingService: AvitoNetworkingService
    private var url: URL
    
    init(sourceUrl: URL, delegate: EmployeeViewModelDelegate){
        url = sourceUrl
        self.delegate = delegate
        self.employees = []
        self.cache = CompanyCashe()
        self.avitoNetworkingService = AvitoNetworkingService(url: url)
    }
    
    func load(){
        guard let delegate = delegate else {
            return
        }
        delegate.willUpdateEmployees()
        
        if let company = cache[url.absoluteString] {
            employees = company.employees
            delegate.didUpdateEmployees(error: nil)
            return
        }
        
        avitoNetworkingService.fetch { [weak self] result in
            guard let self = self else {
                return
            }
            
            guard let delegate = self.delegate else {
                return
            }
            
            switch result {
            case .failure(let error):
                delegate.didUpdateEmployees(error: error)
            case .success(let avitoResponse):
                let key = self.url.absoluteString
                self.cache[key] = avitoResponse.company
                self.employees = avitoResponse.company.employees
                
                delegate.didUpdateEmployees(error: nil)
            }
        }
    }
}
