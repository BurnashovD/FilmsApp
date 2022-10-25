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
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
//        imageView.backgroundColor = .red
//        imageView.image = UIImage(named: "pirates")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let filmNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
//        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filmRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .green
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filmOverviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .center
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
        cellView.addSubview(filmRateLabel)
        cellView.addSubview(filmOverviewLabel)
        contentView.addSubview(cellView)
        createFilmImageViewAnchors()
        createViewAnchors()
        createFilmNameLabelAnchors()
        createFilmRatesAnchors()
        createFilmOverviewLabelAnchors()
    }
    
    public func refresh(data: Result) {
        let imageURL = "http://image.tmdb.org/t/p/w500\(data.posterPath)"
        filmNameLabel.text = data.title
        filmRateLabel.text = String(data.voteAverage)
        filmOverviewLabel.text = data.overview
        URLSession.shared.dataTask(with: URL(string: imageURL)!) { (data, response, error) in
        
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.filmImageView.image = UIImage(data: data)
                    
                }
        }.resume()
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
//        filmNameLabel.centerXAnchor.constraint(equalTo: filmOverviewLabel.centerXAnchor).isActive = true
        filmNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        filmNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func createFilmRatesAnchors() {
        filmRateLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 105).isActive = true
        filmRateLabel.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: 160).isActive = true
        filmRateLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        filmRateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func createFilmOverviewLabelAnchors() {
        filmOverviewLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 0).isActive = true
        filmOverviewLabel.leadingAnchor.constraint(equalTo: filmImageView.trailingAnchor, constant: 8).isActive = true
        filmOverviewLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8).isActive = true
        filmOverviewLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -40).isActive = true
    }
}

