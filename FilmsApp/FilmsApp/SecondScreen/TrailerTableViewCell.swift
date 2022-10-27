//
//  TrailerTableViewCell.swift
//  FilmsApp
//
//  Created by Daniil on 26.10.2022.
//

import UIKit

// Класс отвечает за ячейку с трейлером к фильму
final class TrailerTableViewCell: UITableViewCell {
    
    // MARK: - Visual components
    
    private var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "anime")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     var secondFilmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pirates")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     private lazy var filmImagesScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: 780 , height: 200)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(filmImageView)
         scroll.addSubview(secondFilmImageView)
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    

    // MARK: - LifeCycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        selectionStyle = .none
        contentView.addSubview(filmImagesScrollView)
        contentView.backgroundColor = UIColor(named: Constants.blueViewColorname)
        createScrollViewAnchors()
        createFilmImageViewAnchors()
        createSecondImageviewAnchors()
    }
    
    private func createScrollViewAnchors() {
        filmImagesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        filmImagesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        filmImagesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        filmImagesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        filmImagesScrollView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    private func createFilmImageViewAnchors() {
        filmImageView.leadingAnchor.constraint(equalTo: filmImagesScrollView.leadingAnchor, constant: 10).isActive = true
        filmImageView.topAnchor.constraint(equalTo: filmImagesScrollView.topAnchor, constant: 5).isActive = true
        filmImageView.centerXAnchor.constraint(equalTo: filmImagesScrollView.centerXAnchor).isActive = true
        filmImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    private func createSecondImageviewAnchors() {
        secondFilmImageView.topAnchor.constraint(equalTo: filmImagesScrollView.topAnchor, constant: 5).isActive = true
        secondFilmImageView.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: 60).isActive = true
        secondFilmImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        secondFilmImageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
}

/// Constants
extension TrailerTableViewCell {
    enum Constants {
        static let blueViewColorname = "blueView"
    }
}
