//
//  ListViewCell.swift
//  BragiTest
//
//  Created by Denis Grishchenko on 06.02.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    // MARK: - REUSE ID -
    
    static let reuseID = "ListViewCell"
    
    // MARK: - UIVIEW -
    
    var headphonesImageView:    UIImageView!
    
    var nameLabel:              UILabel!
    
    var separatorView:          UIView!
    
    // MARK: - INIT -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        setupHeadphonesImageView()
        
        setupNameLabel()
        
        setupSeparatorView()
        
        setupConstraints()
        
    }
    
    // MARK: - HEADPHONES IMAGE VIEW -
    
    private func setupHeadphonesImageView() {
        
        let headphonesImage = UIImage(named: "headphones")
        
        headphonesImageView = UIImageView(image: headphonesImage)
        
        headphonesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        headphonesImageView.contentMode = .scaleAspectFit
        
        addSubview(headphonesImageView)
        
    }
    
    // MARK: - NAME LABEL -
    
    private func setupNameLabel() {
        
        nameLabel = UILabel()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont(name: "Menlo", size: 16)
        
        addSubview(nameLabel)
        
    }
    
    // MARK: - SEPARATOR VIEW -
    
    private func setupSeparatorView() {
        
        separatorView = UIView()
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView.backgroundColor = .black
        
        addSubview(separatorView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            headphonesImageView.topAnchor       .constraint(equalTo: topAnchor,     constant: 5),
            headphonesImageView.leadingAnchor   .constraint(equalTo: leadingAnchor, constant: 18),
            headphonesImageView.heightAnchor    .constraint(equalToConstant: 30),
            headphonesImageView.widthAnchor     .constraint(equalToConstant: 34)
        
        ])
        
        NSLayoutConstraint.activate([
        
            nameLabel.centerYAnchor .constraint(equalTo: headphonesImageView.centerYAnchor),
            nameLabel.leadingAnchor .constraint(equalTo: headphonesImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        
        ])
        
        NSLayoutConstraint.activate([
        
            separatorView.topAnchor     .constraint(equalTo: headphonesImageView.bottomAnchor, constant: 2),
            separatorView.leadingAnchor .constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor  .constraint(equalToConstant: 1)
        
        ])
        
    }
    
}
