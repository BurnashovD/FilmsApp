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
        button.backgroundColor = UIColor(named: Constants.buttonsColorName)
        button.layer.cornerRadius = 7
        button.setTitle(Constants.topRatedText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.buttonsColorName)
        button.layer.cornerRadius = 7
        button.setTitle(Constants.upcomingText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.buttonsColorName)
        button.layer.cornerRadius = 7
        button.setTitle(Constants.popularText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    // MARK: - Public properties
    var sendTopRatedURLClosure: (() -> Void)?
    var sendUpcomingURLClosure: (() -> Void)?
    var sendPopularURLClosure: (() -> Void)?

    // MARK: - LifeCycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = UIColor(named: Constants.blueViewColorName)
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
        thirdButton.addTarget(self, action: #selector(sendPopularURL), for: .touchUpInside)
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
        self.sendTopRatedURLClosure?()
    }
    
    @objc private func sendUpcomingdURL() {
        self.sendUpcomingURLClosure?()
    }
    
    @objc private func sendPopularURL() {
        self.sendPopularURLClosure?()
    }
}


extension FilterTableViewCell {
    enum Constants {
        static let buttonsColorName = "buttonsColor"
        static let blueViewColorName = "blueView"
        static let topRatedText = "Top rated"
        static let upcomingText = "Upcoming"
        static let popularText = "Popular"
    }
}
