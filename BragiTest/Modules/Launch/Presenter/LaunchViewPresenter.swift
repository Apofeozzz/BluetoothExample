//
//  LaunchViewPresenter.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 05.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import CoreBluetooth
import RxSwift

// MARK: - LAUNCH VIEW PROTOCOL -

protocol LaunchViewProtocol: class {
    
    func animateSearchView()

    func moveToListViewController(vc: ListViewController)
    
}

// MARK: - LAUNCH VIEW PRESENTER PROTOCOL -

protocol LaunchViewPresenterProtocol {
    
    init(view: LaunchViewProtocol, bleManager: BLEManager)
    
    func searchForPeripherals()
    
}

// MARK: - LAUNCH VIEW PRESENTER -

class LaunchViewPresenter: LaunchViewPresenterProtocol {
    
    weak var view: LaunchViewProtocol?
    
    var bleManager: BLEManager
    
    let disposeBag = DisposeBag()
    
    required init(view: LaunchViewProtocol, bleManager: BLEManager) {
        
        self.view       = view
        
        self.bleManager = bleManager
        
        setupSubscriptions()
        
    }
    
    private func setupSubscriptions() {
        
        bleManager.bluetoothState.subscribe(onNext: {[weak self] (state) in
            
            guard let ss = self else { return }
            
            guard let state = state else { return }
            
            switch state {
                
            case .poweredOn:
                
                ss.searchForPeripherals()
                
            case .poweredOff:
                
                print("Powered OFF")
                
            default: print("Another state")
                
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    func searchForPeripherals() {
        
        bleManager.startScanning()
        
        view?.animateSearchView()
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.bleManager.stopScanning()

            ss.moveToListViewController()
            
        }
        
    }
    
    private func moveToListViewController() {
        
        view?.moveToListViewController(vc: Builder.listViewController())
        
    }
    
}
