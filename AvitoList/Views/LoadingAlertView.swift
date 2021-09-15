//
//  LoadingAlert.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
class LoadingAlertContent: UIView {
    private var isConfigured = false
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()
    
    func configureAlertContent(){
        guard !isConfigured else {
            return
        }
        isConfigured = true
        
        configureAlertContentView()
        configureTitle()
        configureDescription()
        configureIndicator()
        
        configureConstraints()
    }
    
    private func configureAlertContentView(){
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    private func configureTitle(){
        addSubview(titleLabel)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.text = "Employee list is being loaded"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    private func configureDescription(){
        addSubview(descriptionLabel)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.text = "It can take some time. Thanks for waiting"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    private func configureIndicator(){
        addSubview(activityIndicator)
            
        let transform = CGAffineTransform(scaleX: 2, y: 2)
        
        activityIndicator.transform = transform
        
        activityIndicator.startAnimating()
    }
    
    private func configureConstraints(){
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            activityIndicator.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 64),
            activityIndicator.heightAnchor.constraint(equalToConstant: 64),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
}
