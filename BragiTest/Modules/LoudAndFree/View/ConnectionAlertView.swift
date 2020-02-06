//
//  ConnectionAlertView.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class ConnectionAlertView: UIView {
    
    // MARK: - UIVIEW -
    
    var infoImageView: UIImageView!
    
    var alertLabel: UILabel!
    
    // MARK: - INIT -
    
    init() {
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        setupInfoImageView()
        
        setupAlertLabel()
        
        setupConstraints()
        
    }
    
    // MARK: - INFO IMAGE VIEW -
    
    private func setupInfoImageView() {
        
        let infoImage = UIImage(named: "info")
        
        infoImageView = UIImageView(image: infoImage)
        
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        infoImageView.contentMode = .scaleAspectFit
        
        addSubview(infoImageView)
        
    }
    
    // MARK: - SETUP ALERT LABEL -
    
    private func setupAlertLabel() {
        
        alertLabel = UILabel()
        
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        
        alertLabel.text         = "Device Connected"
        
        alertLabel.textColor    = .white
        
        alertLabel.font         = UIFont(name: "Menlo", size: 16)
        
        addSubview(alertLabel)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            infoImageView.centerYAnchor .constraint(equalTo: centerYAnchor),
            infoImageView.leadingAnchor .constraint(equalTo: leadingAnchor, constant: 15),
            infoImageView.heightAnchor  .constraint(equalToConstant: 27),
            infoImageView.widthAnchor   .constraint(equalToConstant: 27)
        
        ])
        
        NSLayoutConstraint.activate([
        
            alertLabel.centerYAnchor    .constraint(equalTo: centerYAnchor),
            alertLabel.leadingAnchor    .constraint(equalTo: infoImageView.trailingAnchor, constant: 25),
            alertLabel.trailingAnchor   .constraint(equalTo: trailingAnchor, constant: -10)
        
        ])
        
    }
    
}
