//
//  AlertView.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import UIKit
class AlertView: UIView {
    // binding
    private var didCallForReload: (()->())!
    
    private let failedAlertContent = FailAlertContent()
    private let loadingAlertContent = LoadingAlertContent()
    
    private var isConfigured = false
    
    func configureView(in superview: UIView, didCallForReload: @escaping ()->()){
        superview.addSubview(self)
        self.didCallForReload = didCallForReload
        
        configureAlertView()
        
        configureFailedAlertContent()
        
        configureLoadingAlertContent()
        
        configureConstraints()
    }
    
    func showFailedAtlertView(){
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            
            self.isHidden = false
            
            self.failedAlertContent.isHidden = false
            self.loadingAlertContent.isHidden = true
        }
    }
    
    func showLoadingAtlertView(){
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            
            self.isHidden = false
            
            self.failedAlertContent.isHidden = true
            self.loadingAlertContent.isHidden = false
        }
    }
    
    func hide(){
        isHidden = true
    }
    
    private func configureAlertView(){
        let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        backgroundColor = shadowColor
        isHidden = true
    }
    
    private func configureFailedAlertContent(){
        failedAlertContent.configureAlertContent(didCallForReload: didCallForReload)
        addSubview(failedAlertContent)
        
        failedAlertContent.isHidden = true
    }
    
    private func configureLoadingAlertContent(){
        loadingAlertContent.configureAlertContent()
        addSubview(loadingAlertContent)
        
        loadingAlertContent.isHidden = true
    }
    
    private func configureConstraints(){
        configureSubViewsConstraints()
        
        configureSuperViewConstraints()
    }
    
    private func configureSubViewsConstraints(){
        NSLayoutConstraint.activate([
            failedAlertContent.leftAnchor.constraint(equalTo: leftAnchor, constant: 64),
            failedAlertContent.rightAnchor.constraint(equalTo: rightAnchor, constant: -64),
            failedAlertContent.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loadingAlertContent.leftAnchor.constraint(equalTo: leftAnchor, constant: 64),
            loadingAlertContent.rightAnchor.constraint(equalTo: rightAnchor, constant: -64),
            loadingAlertContent.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureSuperViewConstraints(){
        guard let superview = superview else {
            fatalError("Tried to configure Superview Constraints without superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            superview.leftAnchor.constraint(equalTo: leftAnchor),
            superview.rightAnchor.constraint(equalTo: rightAnchor),
            superview.topAnchor.constraint(equalTo: topAnchor),
            superview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

