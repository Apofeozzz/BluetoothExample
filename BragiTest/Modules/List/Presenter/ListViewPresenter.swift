//
//  ListViewPresenter.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import CoreBluetooth

// MARK: - LIST VIEW PROTOCOL -

protocol ListViewProtocol: class {
    
    func moveToLoundAndFreeController(vc: LoudAndFreeViewController)
    
}

// MARK: - LIST VIEW PRESENTER PROTOCOL -

protocol ListViewPresenterProtocol {
    
    var peripherals: [CBPeripheral] { get }
    
    init(view: ListViewProtocol, bleManager: BLEManager)
    
    func connectButtonAction()
    
}

// MARK: - LIST VIEW PRESENTER -

class ListViewPresenter: NSObject, ListViewPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: ListViewProtocol?
    
    var bleManager: BLEManager
    
    var peripherals: [CBPeripheral]
    
    // MARK: - INIT -
    
    required init(view: ListViewProtocol, bleManager: BLEManager) {
        
        self.view           = view
        
        self.bleManager     = bleManager
        
        self.peripherals    = bleManager.foundedPeripheral
        
    }
    
    // MARK: - ACTION -
    
    func connectButtonAction() {
        
        bleManager.deviceConnection.onNext(.Connected)
        
        view?.moveToLoundAndFreeController(vc: Builder.loudAndFreeController())
        
    }
    
}
