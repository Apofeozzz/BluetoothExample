//
//  LoudAndFreeController.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum AlertState {

    case Shown
    
    case Hidden

}

class LoudAndFreeViewController: UIViewController, LoudAndFreeViewProtocol {
    
    // MARK: - UIVIEW -
    
    var mainView: LoudAndFreeView!
    
    // MARK: - DATA SOURCE -
    
    var presenter: LoudAndFreeViewPresenterProtocol!
    
    var disposeBag = DisposeBag()
    
    var alertState = AlertState.Hidden
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupSubscriptions()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.showAlert()
            
        }
        
        Timer.scheduledTimer(withTimeInterval: 5.5, repeats: false) { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.presenter.changeDeviceConnectionCycle()
            
        }
        
    }
    
    // MARK: - SETUP SUBSCRIPTIONS -
    
    private func setupSubscriptions() {
        
        mainView.backButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.backButtonAction()
            
        }).disposed(by: disposeBag)
        
        mainView.leftHeadphoneButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
        
            guard let ss = self else { return }
            
            ss.leftHeadphoneButtonAction()
            
        }).disposed(by: disposeBag)
        
        mainView.rightHeadphoneButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
        
            guard let ss = self else { return }
            
            ss.rightHeadphoneButtonAction()
            
        }).disposed(by: disposeBag)
        
        mainView.sendButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
        
            guard let ss = self else { return }
            
            ss.sendButtonAction()
            
        }).disposed(by: disposeBag)
        
        presenter.headphoneState.subscribe(onNext: { [weak self] (state) in
            
            guard let ss = self else { return }
            
            DispatchQueue.main.async {
                
                ss.checkHeadphoneState(state: state)
                
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    // MARK: - ACTIONS -
    
    private func backButtonAction() {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    private func leftHeadphoneButtonAction() {
        
        presenter.leftButtonAction()
        
    }
    
    private func rightHeadphoneButtonAction() {
        
        presenter.rightButtonAction()
        
    }
    
    private func sendButtonAction() {
        
        presenter.sendButtonAction()
        
    }
    
    private func checkHeadphoneState(state: HeadphoneState) {
        
        mainView.sendButton.isEnabled        = true
        
        mainView.sendImageView.image         = UIImage(named: "send_enabled")
        
        switch state {
            
        case .Both:
            
            mainView.headphonesImageView.image   = UIImage(named: "headphones_both")
            
        case .Left:
            
            mainView.headphonesImageView.image   = UIImage(named: "headphones_left")
            
        case .Right:
            
            mainView.headphonesImageView.image   = UIImage(named: "headphones_right")
            
        case .None:
            
            mainView.sendButton.isEnabled        = false
            
            mainView.sendImageView.image         = UIImage(named: "send_disabled")
            
            mainView.headphonesImageView.image   = UIImage(named: "headphones")
            
        }
        
    }
    
    // MARK: - ALERTS -
    
    func showConnectedAlert() {
        
        mainView.connectionAlertView.alertLabel.text = "Device Connected"
        
        mainView.connectionAlertView.backgroundColor = .alertBlue
        
        showAlert()
        
    }
    
    func showDisconnectedAlert() {
        
        mainView.connectionAlertView.alertLabel.text = "Connection problem"
        
        mainView.connectionAlertView.backgroundColor = .alertRed
        
        showAlert()
        
    }
    
    func showCommandSentAlert() {
        
        mainView.connectionAlertView.alertLabel.text = "Command sent"
        
        mainView.connectionAlertView.backgroundColor = .alertGreen
        
        showAlert()
        
    }
    
    
    // MARK: - ANIMATION -
    
    private func showAlert() {
        
        if alertState == .Shown { return }
        
        alertState = .Shown
        
        mainView.alertTopConstraint.constant = 50
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            
            guard let ss = self else { return }
            
            ss.view.layoutIfNeeded()
            
        }) { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.hideAlert()
            
        }
        
    }
    
    private func hideAlert() {
        
        mainView.alertTopConstraint.constant = -55
        
        UIView.animate(withDuration: 0.5, delay: 3, options: [], animations: { [weak self] in

            guard let ss = self else { return }

            ss.view.layoutIfNeeded()

        })
        
        Timer.scheduledTimer(withTimeInterval: 3.5, repeats: false) { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.alertState = .Hidden
            
        }
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    // MARK: - MAIN VIEW -
    
    private func setupMainView() {
        
        mainView = LoudAndFreeView()
        
        view.addSubview(mainView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([

            mainView.topAnchor      .constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor  .constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor .constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor   .constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
}
