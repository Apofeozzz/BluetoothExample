//
//  LaunchView.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 05.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchView: UIView {
    
    // MARK: - UIVIEW -
    
    var devicesListLabel:   UILabel!
    
    var searchImageView:    UIImageView!
    
    var searchDevicesLabel: UILabel!
    
    var connectImageView:   UIImageView!
    
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
        
        backgroundColor = .white
        
        setupDevicesListLabel()
        
        setupSearchImageView()
        
        setupSearchDevicesLabel()
        
        setupConnectImageView()
        
        setupConstraints()
        
    }
    
    // MARK: - DEVICE LIST LABEL -
    
    private func setupDevicesListLabel() {
        
        devicesListLabel = UILabel()
        
        devicesListLabel.translatesAutoresizingMaskIntoConstraints = false
        
        devicesListLabel.text = "Devices List"
        
        devicesListLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        
        addSubview(devicesListLabel)
        
    }
    
    // MARK: - SEARCH IMAGE VIEW -
    
    private func setupSearchImageView() {
        
        let searchImage = UIImage(named: "search")
        
        searchImageView = UIImageView(image: searchImage)
        
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        
        searchImageView.contentMode = .scaleAspectFit
        
        addSubview(searchImageView)
        
    }
    
    // MARK: - SEARCH DEVICE LABEL -
    
    private func setupSearchDevicesLabel() {
        
        searchDevicesLabel = UILabel()
        
        searchDevicesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        searchDevicesLabel.text = "Searching for the devices"
        
        searchDevicesLabel.font = UIFont(name: "Menlo", size: 14)
        
        addSubview(searchDevicesLabel)
        
    }
    
    // MARK: - CONNECT BUTTON -
    
    private func setupConnectImageView() {
        
        let connectImage = UIImage(named: "ConnectDisabled")
        
        connectImageView = UIImageView(image: connectImage)
        
        connectImageView.translatesAutoresizingMaskIntoConstraints = false
        
        connectImageView.contentMode = .scaleAspectFit
        
        addSubview(connectImageView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            devicesListLabel.topAnchor      .constraint(equalTo: topAnchor, constant: 100),
            devicesListLabel.centerXAnchor  .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            searchImageView.centerXAnchor   .constraint(equalTo: centerXAnchor),
            searchImageView.centerYAnchor   .constraint(equalTo: centerYAnchor),
            searchImageView.heightAnchor    .constraint(equalToConstant: 55),
            searchImageView.widthAnchor     .constraint(equalToConstant: 55)
        
        ])
        
        NSLayoutConstraint.activate([
        
            searchDevicesLabel.topAnchor    .constraint(equalTo: searchImageView.bottomAnchor, constant: 80),
            searchDevicesLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            connectImageView.bottomAnchor   .constraint(equalTo: bottomAnchor, constant: -50),
            connectImageView.centerXAnchor  .constraint(equalTo: centerXAnchor),
            connectImageView.widthAnchor    .constraint(equalToConstant: 144),
            connectImageView.heightAnchor   .constraint(equalToConstant: 46)
        
        ])
        
    }
    
}

