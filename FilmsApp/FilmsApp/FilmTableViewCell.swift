// FilmTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class FilmTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(named: "Color")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "pirates")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let filmNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Пираты карибского моря"
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = UIColor(named: "blueView")
        configUI()
        // Configure the view for the selected state
    }
    
    private func configUI() {
        cellView.addSubview(filmImageView)
        cellView.addSubview(filmNameLabel)
        contentView.addSubview(cellView)
        createFilmImageViewAnchors()
        createViewAnchors()
        createFilmNameLabelAnchors()
    }
    
    private func createViewAnchors() {
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    }
    
    private func createFilmImageViewAnchors() {
        filmImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
        filmImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        filmImageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10).isActive = true
        filmImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    private func createFilmNameLabelAnchors() {
        filmNameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        filmNameLabel.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: 15).isActive = true
        filmNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        filmNameLabel.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
}
