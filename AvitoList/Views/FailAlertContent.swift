//
//  LoadingAlertView.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
class FailAlertContent: UIView {
    private var isConfigured = false
    
    // binding
    private var didCallForReload: (()->())!
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let button = UIButton()
    
    func configureAlertContent(didCallForReload: @escaping ()->()){
        guard !isConfigured else {
            return
        }
        isConfigured = true
        self.didCallForReload = didCallForReload
        
        configureAlertContentView()
        configureTitle()
        configureDescription()
        configureButton()
        
        configureSubviewConstraints()
    }
    
    private func configureAlertContentView(){
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    private func configureTitle(){
        addSubview(titleLabel)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.text = "Loading has failed"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
    }
    
    private func configureDescription(){
        addSubview(descriptionLabel)
         
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.text = "Please check your internet connection or try again later"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    private func configureButton(){
        addSubview(button)
        
        let action = UIAction { [weak self] _ in
            self?.didCallForReload()
        }
        
        button.addAction(action, for: .touchUpInside)
        button.setTitle(" try again ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        
        button.layer.cornerRadius = 4
    }
    
    private func configureSubviewConstraints(){
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            button.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 16),
            button.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -16)
        ])
    }
}
