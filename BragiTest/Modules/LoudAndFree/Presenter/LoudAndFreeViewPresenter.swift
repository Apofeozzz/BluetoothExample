//
//  LoudAndFreePresenter.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import RxSwift


// MARK: - HEADPHONE STATE -

enum HeadphoneState {
    
    case Left
    
    case Right
    
    case Both
    
    case None
    
}

// MARK: - VIEW PROTOCOL -

protocol LoudAndFreeViewProtocol: class {
    
    func showConnectedAlert()
    
    func showDisconnectedAlert()
    
    func showCommandSentAlert()
    
}

// MARK: - PRESENTER PROTOCOL -

protocol LoudAndFreeViewPresenterProtocol {
    
    var headphoneState: BehaviorSubject<HeadphoneState>{ get set }
    
    init(view: LoudAndFreeViewProtocol, bleManager: BLEManager)
    
    func leftButtonAction()
    
    func rightButtonAction()
    
    func sendButtonAction()
    
}

// MARK: - LOUD AND FREE PRESENTER -

class LoudAndFreeViewPresenter: NSObject, LoudAndFreeViewPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: LoudAndFreeViewProtocol?
    
    var bleManager: BLEManager
    
    var disposeBag = DisposeBag()
    
    var headphoneState = BehaviorSubject(value: HeadphoneState.None)
    
    // MARK: - INIT -
    
    required init(view: LoudAndFreeViewProtocol, bleManager: BLEManager) {
        
        self.view       = view
        
        self.bleManager = bleManager
        
        super.init()
        
        setupSubscription()
        
    }
    
    // MARK: - SUBSCRIPTIONS -
    
    private func setupSubscription() {
        
        bleManager.deviceConnection.skip(1).subscribe(onNext: { [weak self] (state) in
            
            guard let ss = self else { return }
            
            switch state {
                
                case .Connected:    ss.view?.showConnectedAlert()
                
                case .Disconnected: ss.view?.showDisconnectedAlert()
                
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    // MARK: - ACTIONS -
    
    func leftButtonAction() {
        
        do {
        
            let state = try headphoneState.value()
            
            switch state {
                
            case .Both:     headphoneState.onNext(.Right)
                
            case .Left:     headphoneState.onNext(.None)
                
            case .Right:    headphoneState.onNext(.Both)
                
            case .None:     headphoneState.onNext(.Left)
                
            }
            
        } catch { print("Error", error) }
        
    }
    
    func rightButtonAction() {
        
        do {
        
            let state = try headphoneState.value()
        
            switch state {
                
            case .Both:     headphoneState.onNext(.Left)
                
            case .Left:     headphoneState.onNext(.Both)
                
            case .Right:    headphoneState.onNext(.None)
                
            case .None:     headphoneState.onNext(.Right)
                
            }
            
        } catch { print("Error", error) }
        
    }
    
    func sendButtonAction() {
         
        do {
            
            let state = try bleManager.deviceConnection.value()
            
            switch state {
                
                case .Connected:
                    view?.showCommandSentAlert()
                
                case .Disconnected:
                    view?.showDisconnectedAlert()
                
            }
            
        } catch { print("Error", error) }
        
    }
    
}

