//
//  ListViewController.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController, ListViewProtocol {
    
    // MARK: - UIVIEW -
    
    var mainView: ListView!
    
    // MARK: - DATA SOURCE -
    
    var presenter: ListViewPresenterProtocol!
    
    let disposeBag = DisposeBag()
    
    var selectedIndexPath: IndexPath?
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        
        setupView()
        
        setupSubscriptions()
        
    }
    
    // MARK: - SETUP SUBSCRIPTIONS -
    
    private func setupSubscriptions() {
        
        mainView.connectButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
            
            guard let ss = self else { return }
            
            ss.connectButtonAction()
            
        }).disposed(by: disposeBag)
        
    }
    
    // MARK: - ACTION -
    
    private func connectButtonAction() {
        
        presenter.connectButtonAction()
        
    }
    
    // MARK: - NAVIGATION -
    
    func moveToLoundAndFreeController(vc: LoudAndFreeViewController) {
        
        disableSelectedRow()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func disableSelectedRow() {
        
        mainView.peripheralsTableView.deselectRow(at: selectedIndexPath!, animated: true)
        
        mainView.connectButton.isEnabled = false
        
        mainView.connectImageView.image  = UIImage(named: "ConnectDisabled")
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    // MARK: - MAIN VIEW -
    
    private func setupMainView() {
        
        mainView = ListView()
        
        mainView.peripheralsTableView.dataSource    = self
        
        mainView.peripheralsTableView.delegate      = self
        
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

// MARK: - UITABLEVIEWDELEGATE -

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.peripherals.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseID, for: indexPath) as! ListViewCell
        
        let peripheral = presenter.peripherals[indexPath.row]
        
        if let name = peripheral.name { cell.nameLabel.text = name }
        
        else { cell.nameLabel.text = "Unknown" }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndexPath                   = indexPath
        
        mainView.connectImageView.image     = UIImage(named: "ConnectEnabled")
        
        mainView.connectButton.isEnabled    = true
        
    }
    
}
