//
//  ViewController.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 05.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewProtocol {
    
    // MARK: - UIVIEW -
    
    var mainView: LaunchView!
    
    // MARK: - DATA SOURCE -
    
    var presenter: LaunchViewPresenterProtocol!
    
    // MARK: - LIFE CYCLE -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    // MARK: - SEARCH VIEW ANIMATION -
    
    func animateSearchView() {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: { [weak self] in
            
            guard let ss = self else { return }
            
            ss.mainView.searchImageView.layer.opacity = 0
            
        })
        
    }
    
    private func stopAnimation() {
        
        mainView.searchImageView.layer.removeAllAnimations()
        
        mainView.searchImageView.layer.opacity = 1
        
    }
    
    // MARK: - NAVIGATION -
    
    func moveToListViewController(vc: ListViewController) {
        
        navigationController?.pushViewController(vc, animated: false)
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        navigationController?.isNavigationBarHidden = true
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    // MARK: - MAIN VIEW -
    
    private func setupMainView() {
        
        mainView = LaunchView()
        
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

