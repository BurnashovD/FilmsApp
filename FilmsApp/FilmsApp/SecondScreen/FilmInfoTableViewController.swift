// FilmInfoTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс отвечает за информацию о выбранном фильме
final class FilmInfoTableViewController: UITableViewController {
    // MARK: - Private properties

    private let cellTypes: [CellTypes] = [.images, .overview, .actors]

    // MARK: - Public properties

    var selectedFilmOverviewText = String()
    var posterimage = UIImage()
    var filmId = String()
    var backdropImageId = String()
    private var trailerURL = String()
    private var trailersResults = [TrailerResult]()
    var actorsResults = [Cast]()
    var movies: FilmTableViewCell? {
        didSet {
            guard let text = movies?.filmOverviewLabel.text, let image = movies?.filmImageView.image,
                  let filmId = movies?.filmId, let backdropImageId = movies?.backdropImageId else { return }
            title = movies?.filmNameLabel.text
            selectedFilmOverviewText = text
            posterimage = image
            self.filmId = filmId
            self.backdropImageId = backdropImageId
        }
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        getActorsInfo()
        getTrailerURL()
    }

    // MARK: - Private methods

    private func configUI() {
        navigationController?.navigationBar.largeTitleTextAttributes =
            [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)
            ]
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = UIColor(named: Constants.blueViewColorName)
        configCell()
    }

    private func configCell() {
        tableView.register(TrailerTableViewCell.self, forCellReuseIdentifier: Constants.trailerCellIdentifier)
        tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: Constants.overviewCellIdentifier)
        tableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: Constants.actorsCellIdentifier)
    }

    private func getTrailerURL() {
        let session = URLSession.shared
        let actualURL =
            "\(Constants.trailerStartActualURLString)\(filmId)\(Constants.trailerEndActualURLString)"
        guard let url = URL(string: actualURL) else { return }
        session.dataTask(with: URLRequest(url: url)) { data, _, error in

            do {
                guard let newData = data else { return }
                let result = try JSONDecoder().decode(TrailerData.self, from: newData)
                DispatchQueue.main.async { [weak self] in
                    self?.trailersResults = result.results
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    private func getActorsInfo() {
        let session = URLSession.shared
        let actualURL =
            "\(Constants.trailerStartActualURLString)\(filmId)\(Constants.actorsEndActualURLString)"
        guard let url = URL(string: actualURL) else { return }
        session.dataTask(with: URLRequest(url: url)) { data, _, error in

            do {
                guard let newData = data else { return }
<<<<<<< HEAD
                let result = try JSONDecoder().decode(Welcome.self, from: newData)

=======
                let result = try JSONDecoder().decode(ActorResults.self, from: newData)
>>>>>>> 87a7c29 (Исправил 42/43 замечаний)
                self.actorsResults = result.cast

            } catch {
                print(error)
            }
        }.resume()
    }
}

/// Constants and CellTypes
extension FilmInfoTableViewController {
    enum Constants {
        static let blueViewColorName = "blueView"
        static let trailerCellIdentifier = "trailer"
        static let overviewCellIdentifier = "overview"
        static let actorsCellIdentifier = "actors"
        static let trailerStartActualURLString = "https://api.themoviedb.org/3/movie/"
        static let trailerEndActualURLString = "/videos?api_key=56c45ba32cd76399770966658bf65ca0&language=ru-RU"
        static let actorsEndActualURLString = "/videos?api_key=56c45ba32cd76399770966658bf65ca0&language=ru-RU"
    }

    enum CellTypes {
        case images
        case overview
        case actors
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FilmInfoTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellTypes[indexPath.section]
        switch type {
        case .images:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.trailerCellIdentifier,
                for: indexPath
            ) as? TrailerTableViewCell else { return UITableViewCell() }
            cell.refresh(tvc: self)

            cell.sendOpenWebPageAction = { [weak self] in
                guard let filmId = self?.filmId, let trailerURL = self?.trailerURL,
                      let result = self?.trailersResults[indexPath.section] else { return }
                let trailerWebPageVC = TrailerWebPageViewController()
                trailerWebPageVC.movieId = filmId
                trailerWebPageVC.trailerURLString = trailerURL
                trailerWebPageVC.refresh = result
                self?.present(trailerWebPageVC, animated: true)
            }
            return cell

        case .overview:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.overviewCellIdentifier,
                for: indexPath
            ) as? OverviewTableViewCell else { return UITableViewCell() }
            cell.refresh(tvc: self)

            return cell

        case .actors:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.actorsCellIdentifier,
                for: indexPath
            ) as? ActorsTableViewCell else { return UITableViewCell() }
            cell.refresh(tvc: self)

            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = cellTypes[indexPath.section]
        switch type {
        case .actors:
            return 130
        default:
            return UITableView.automaticDimension
        }
    }
}
