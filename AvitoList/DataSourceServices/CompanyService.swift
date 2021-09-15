//
//  EmployeeCashingService.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import Foundation
class CompanyCashe{
    private var cache: NSCache<NSString, Company>
    private var lastSavedDate: Date
    init(){
        cache = NSCache<NSString, Company>()
        lastSavedDate = .distantPast
    }
    
    subscript(key: String) -> Company? {
        get {
            guard !hasOneHourPassed() else {
                cache.removeObject(forKey: NSString(string: key))
                return nil
            }
            
            guard let company = cache.object(forKey: NSString(string: key)) else {
                return nil
            }
        
            return company
        }
        
        set(newValue) {
            
            guard let newCompany = newValue else {
                return
            }
            
            lastSavedDate = Date()
            
            cache.setObject(newCompany, forKey: NSString(string: key))
        }
    }
    
    private func hasOneHourPassed() -> Bool{
        let currentDate = Date()
        guard let hours = Calendar.current.dateComponents([.hour], from: lastSavedDate, to: currentDate).hour else {
            return true
        }
        
        return hours > 0
    }
}
