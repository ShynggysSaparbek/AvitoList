//
//  EmployeeCell.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
class EmployeeCell: UITableViewCell {
    private var employee: Employee!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        backgroundColor = .clear
    }
    
    func configureView(employee: Employee){
        self.employee = employee
        
        configureNameLabel()
        
        configurePhoneNumberLabel()
        
        configureSkillsLabel()
    }
    
    private func configureNameLabel(){
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.text = "Name: \(employee.name)"
    }
    
    private func configurePhoneNumberLabel(){
        phoneLabel.font = UIFont.systemFont(ofSize: 16)
        phoneLabel.text =  "Phone: \(employee.phone_number)"
    }
    
    private func configureSkillsLabel(){
        skillsLabel.font = UIFont.systemFont(ofSize: 16)
        
        skillsLabel.text = "Skills: \(employee.skills.joined(separator: ", "))"
    }
}
