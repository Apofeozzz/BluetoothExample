//
//  BragiTestTests.swift
//  BragiTestTests
//
//  Created by Denis Grishchenko on 05.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import XCTest
@testable import BragiTest

class BragiTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConnectionChangability() {
        
        let bleManager = BLEManager()
        
        bleManager.randomizeConnectionState(state: .Connected)
        
        do {
            
            let state = try bleManager.deviceConnection.value()
            
            XCTAssertEqual(state, DeviceConnection.Disconnected)
            
        } catch { fatalError() }
        
    }
    
    func testHeadphoneButtonsAction() {
        
        let vc                      = LoudAndFreeViewController()
        
        let bleManager              = BLEManager.shared
        
        let loudAndFreePresenter    = LoudAndFreeViewPresenter(view: vc,
                                                               bleManager: bleManager)
        
        do {
            
            let state = try loudAndFreePresenter.headphoneState.value()
            
            XCTAssertEqual(state, HeadphoneState.None)
            
        } catch { print(error) }
        
        loudAndFreePresenter.leftButtonAction()

        do {
            
            let state = try loudAndFreePresenter.headphoneState.value()
            
            XCTAssertEqual(state, HeadphoneState.Left)
            
        } catch { print(error) }
        
        loudAndFreePresenter.rightButtonAction()
        
        do {
            
            let state = try loudAndFreePresenter.headphoneState.value()
            
            XCTAssertEqual(state, HeadphoneState.Both)
            
        } catch { print(error) }
        
        loudAndFreePresenter.leftButtonAction()

        do {
            
            let state = try loudAndFreePresenter.headphoneState.value()
            
            XCTAssertEqual(state, HeadphoneState.Right)
            
        } catch { print(error) }
        
        loudAndFreePresenter.rightButtonAction()
        
        do {
            
            let state = try loudAndFreePresenter.headphoneState.value()
            
            XCTAssertEqual(state, HeadphoneState.None)
            
        } catch { print(error) }
        
    }

}
