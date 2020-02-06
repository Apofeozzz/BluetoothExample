//
//  LoudAndFreeView.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoudAndFreeView: UIView {
    
    // MARK: - UIVIEW -
    
    var connectionAlertView:    ConnectionAlertView!
    
    var backButton:             UIButton!
    
    var headphonesImageView:    UIImageView!
    
    var leftHeadphoneButton:    UIButton!
    
    var rightHeadphoneButton:   UIButton!
    
    var loudAndFreeLabel:       UILabel!
    
    var sendImageView:          UIImageView!
    
    var sendButton:             UIButton!
    
    // MARK: - CONSTRAINTS -
    
    var alertTopConstraint:     NSLayoutConstraint!
    
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
        
        setupBackButton()
        
        setupAlertConnectionView()
        
        setupHeadphonesImageView()
        
        setupLeftHeadphoneButton()
        
        setupRightHeadphoneButton()
        
        setupLoudAndFreeLabel()
        
        setupSendImageview()
        
        setupSendButton()
        
        setupConstraints()
        
    }
    
    // MARK: - ALERT IMAGE VIEW -
    
    func setupAlertConnectionView() {
        
        connectionAlertView = ConnectionAlertView()
        
        connectionAlertView.backgroundColor = .alertBlue
        
        addSubview(connectionAlertView)
        
    }
    
    // MARK: - BACK BUTTON -
    
    private func setupBackButton() {
        
        backButton = UIButton(type: .system)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        let backButtonImage = UIImage(named: "back_button")
        
        backButton.setImage(backButtonImage, for: .normal)
        
        backButton.tintColor = .black
        
        addSubview(backButton)
        
    }
    
    // MARK: - HEADPHONES IMAGE VIEW -
    
    private func setupHeadphonesImageView() {
        
        let headphones      = UIImage(named: "headphones")
        
        headphonesImageView = UIImageView(image: headphones)
        
        headphonesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        headphonesImageView.contentMode = .scaleAspectFit
        
        addSubview(headphonesImageView)
        
    }
    
    // MARK: - HEADPHONES BUTTONS -
    
    private func setupButton() -> UIButton {
        
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }
    
    private func setupLeftHeadphoneButton() {
        
        leftHeadphoneButton = setupButton()
        
        addSubview(leftHeadphoneButton)
        
    }
    
    private func setupRightHeadphoneButton() {
        
        rightHeadphoneButton = setupButton()
        
        addSubview(rightHeadphoneButton)
        
    }
    
    // MARK: - LOUD AND FREE LABEL -
    
    private func setupLoudAndFreeLabel() {
        
        loudAndFreeLabel = UILabel()
        
        loudAndFreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loudAndFreeLabel.font = UIFont(name: "Menlo", size: 20)
        
        loudAndFreeLabel.text = "Loud & Free"
        
        addSubview(loudAndFreeLabel)
        
    }
    
    // MARK: - SEND BUTTON -
    
    private func setupSendImageview() {
        
        let sendImage = UIImage(named: "send_disabled")
        
        sendImageView = UIImageView(image: sendImage)
        
        sendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        sendImageView.contentMode = .scaleAspectFit
        
        addSubview(sendImageView)
        
    }
    
    private func setupSendButton() {
        
        sendButton = setupButton()
        
        addSubview(sendButton)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        alertTopConstraint = connectionAlertView.topAnchor.constraint(equalTo: topAnchor,constant: -55)
        
        NSLayoutConstraint.activate([
        
            alertTopConstraint,
            connectionAlertView.leadingAnchor    .constraint(equalTo: leadingAnchor,     constant: 20),
            connectionAlertView.trailingAnchor   .constraint(equalTo: trailingAnchor,    constant: -20),
            connectionAlertView.heightAnchor     .constraint(equalToConstant: 54)
        
        ])
        
        NSLayoutConstraint.activate([
        
            backButton.topAnchor    .constraint(equalTo: topAnchor,     constant: 50),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor  .constraint(equalToConstant: 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            headphonesImageView.centerXAnchor   .constraint(equalTo: centerXAnchor),
            headphonesImageView.centerYAnchor   .constraint(equalTo: centerYAnchor, constant: -60),
            headphonesImageView.widthAnchor     .constraint(equalToConstant: 137),
            headphonesImageView.heightAnchor    .constraint(equalToConstant: 120)
        
        ])
        
        NSLayoutConstraint.activate([
        
            leftHeadphoneButton.topAnchor       .constraint(equalTo: headphonesImageView.topAnchor),
            leftHeadphoneButton.bottomAnchor    .constraint(equalTo: headphonesImageView.bottomAnchor),
            leftHeadphoneButton.leadingAnchor   .constraint(equalTo: headphonesImageView.leadingAnchor),
            leftHeadphoneButton.widthAnchor     .constraint(equalToConstant: 68.5)
        
        ])
        
        NSLayoutConstraint.activate([
        
            rightHeadphoneButton.topAnchor       .constraint(equalTo: headphonesImageView.topAnchor),
            rightHeadphoneButton.bottomAnchor    .constraint(equalTo: headphonesImageView.bottomAnchor),
            rightHeadphoneButton.trailingAnchor  .constraint(equalTo: headphonesImageView.trailingAnchor),
            rightHeadphoneButton.widthAnchor     .constraint(equalToConstant: 68.5)
        
        ])
        
        NSLayoutConstraint.activate([
        
            loudAndFreeLabel.centerXAnchor  .constraint(equalTo: centerXAnchor),
            loudAndFreeLabel.topAnchor      .constraint(equalTo: headphonesImageView.bottomAnchor, constant: 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            sendImageView.bottomAnchor  .constraint(equalTo: bottomAnchor, constant: -100),
            sendImageView.centerXAnchor .constraint(equalTo: centerXAnchor),
            sendImageView.widthAnchor   .constraint(equalToConstant: 144),
            sendImageView.heightAnchor  .constraint(equalToConstant: 46)
        
        ])
        
        NSLayoutConstraint.activate([
        
            sendButton.topAnchor        .constraint(equalTo: sendImageView.topAnchor),
            sendButton.leadingAnchor    .constraint(equalTo: sendImageView.leadingAnchor),
            sendButton.trailingAnchor   .constraint(equalTo: sendImageView.trailingAnchor),
            sendButton.bottomAnchor     .constraint(equalTo: sendImageView.bottomAnchor)
        
        ])
        
    }
    
}
