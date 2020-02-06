//
//  Builder.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 05.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    
    static func launchViewController() -> UINavigationController
    
    static func listViewController() -> ListViewController
    
    static func loudAndFreeController() -> LoudAndFreeViewController
    
}

class Builder: BuilderProtocol {
    
    static func launchViewController() -> UINavigationController {
        
        let launchVC                = LaunchViewController()
        
        let bleManager              = BLEManager.shared
        
        let presenter               = LaunchViewPresenter(view: launchVC, bleManager: bleManager)
        
        launchVC.presenter          = presenter
        
        let navigationController    = UINavigationController(rootViewController: launchVC)
        
        return navigationController
        
    }
    
    static func listViewController() -> ListViewController {
        
        let listVC          = ListViewController()
        
        let bleManager      = BLEManager.shared
        
        let presenter       = ListViewPresenter(view: listVC, bleManager: bleManager)
        
        listVC.presenter    = presenter
        
        return listVC
        
    }
    
    
    static func loudAndFreeController() -> LoudAndFreeViewController {
        
        let loudAndFreeVC       = LoudAndFreeViewController()
        
        let bleManager          = BLEManager.shared
        
        let presenter           = LoudAndFreeViewPresenter(view: loudAndFreeVC, bleManager: bleManager)
        
        loudAndFreeVC.presenter = presenter
        
        return loudAndFreeVC
        
    }
    
}
