//
//  ListView.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    // MARK: - UIVIEW -
    
    var devicesListLabel:       UILabel!
    
    var peripheralsTableView:   UITableView!
    
    var connectImageView:       UIImageView!
    
    var connectButton:          UIButton!
    
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
        
        setupDevicesListLabel()
        
        setupPeripheralsTableView()
        
        setupConnectImageView()
        
        setupConnectButton()
        
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
    
    // MARK: - PERIPHERALS TABLE VIEW -
    
    private func setupPeripheralsTableView() {
        
        peripheralsTableView = UITableView()
        
        peripheralsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        peripheralsTableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.reuseID)
        
        peripheralsTableView.separatorStyle = .none
        
        addSubview(peripheralsTableView)
        
    }
    
    // MARK: - CONNECT BUTTON -
    
    private func setupConnectImageView() {
        
        let connectImage = UIImage(named: "ConnectDisabled")
        
        connectImageView = UIImageView(image: connectImage)
        
        connectImageView.translatesAutoresizingMaskIntoConstraints = false
        
        connectImageView.contentMode = .scaleAspectFit
        
        addSubview(connectImageView)
        
    }
    
    private func setupConnectButton() {
        
        connectButton = UIButton(type: .system)
        
        connectButton.translatesAutoresizingMaskIntoConstraints = false
        
        connectButton.isEnabled = false
        
        addSubview(connectButton)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            devicesListLabel.topAnchor      .constraint(equalTo: topAnchor, constant: 100),
            devicesListLabel.centerXAnchor  .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            peripheralsTableView.topAnchor      .constraint(equalTo: devicesListLabel.bottomAnchor, constant: 80),
            peripheralsTableView.leadingAnchor  .constraint(equalTo: leadingAnchor,                 constant: 50),
            peripheralsTableView.trailingAnchor .constraint(equalTo: trailingAnchor,                constant: -50),
            peripheralsTableView.bottomAnchor   .constraint(equalTo: connectImageView.topAnchor,    constant: -80)
        
        ])
        
        NSLayoutConstraint.activate([
        
            connectImageView.bottomAnchor   .constraint(equalTo: bottomAnchor, constant: -50),
            connectImageView.centerXAnchor  .constraint(equalTo: centerXAnchor),
            connectImageView.widthAnchor    .constraint(equalToConstant: 144),
            connectImageView.heightAnchor   .constraint(equalToConstant: 46)
        
        ])
        
        NSLayoutConstraint.activate([
        
            connectButton.topAnchor     .constraint(equalTo: connectImageView.topAnchor),
            connectButton.leadingAnchor .constraint(equalTo: connectImageView.leadingAnchor),
            connectButton.trailingAnchor.constraint(equalTo: connectImageView.trailingAnchor),
            connectButton.bottomAnchor  .constraint(equalTo: connectImageView.bottomAnchor)
        
        ])
        
    }
    
    
}
 
