//
//  FilterTableViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 24.10.2022.
//

import UIKit

final class FilterTableViewCell: UITableViewCell {
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Топ рейтинга", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Топ рейтинга", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonsColor")
        button.layer.cornerRadius = 7
        button.setTitle("Топ рейтинга", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        return button
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
        createFirstButtonAnchors()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = UIColor(named: "blueView")
        configUI()
        createFirstButtonAnchors()
        // Configure the view for the selected state
    }
    
    private func configUI() {
        selectionStyle = .none
        contentView.addSubview(firstButton)
        contentView.addSubview(secondButton)
        contentView.addSubview(thirdButton)
        createFirstButtonAnchors()
        createSecondButtonAnchors()
        createThirdButtonAnchors()
    }
    
    private func createFirstButtonAnchors() {
        firstButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        firstButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createSecondButtonAnchors() {
        secondButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        secondButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createThirdButtonAnchors() {
        thirdButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        thirdButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        thirdButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        thirdButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 30).isActive = false
    }

}
