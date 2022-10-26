//
//  FilterTableViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 24.10.2022.
//

import UIKit

// Класс отвечает за ячейку с кнопками фильтра
final class FilterTableViewCell: UITableViewCell {
    
    // MARK: - Visual components
    let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Top rated", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Upcoming", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Unknown", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()

    // MARK: - LifeCycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = UIColor(named: "blueView")
        configUI()
        createFirstButtonAnchors()
    }
    
    // MARK: - Private methods
    private func configUI() {
        selectionStyle = .none
        contentView.addSubview(firstButton)
        contentView.addSubview(secondButton)
        contentView.addSubview(thirdButton)
        firstButton.addTarget(self, action: #selector(sendTopRatedURL), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(sendUpcomingdURL), for: .touchUpInside)
        createFirstButtonAnchors()
        createSecondButtonAnchors()
        createThirdButtonAnchors()
    }
    
    private func createFirstButtonAnchors() {
        firstButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        firstButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createSecondButtonAnchors() {
        secondButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        secondButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createThirdButtonAnchors() {
        thirdButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        thirdButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        thirdButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        thirdButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 30).isActive = false
    }
    
    @objc private func sendTopRatedURL() {
        
    }
    
    @objc private func sendUpcomingdURL() {
        
    }
}
