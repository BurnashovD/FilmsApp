// FilmsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс отвечает за показ таблицы с фильмами
final class FilmsTableViewController: UITableViewController {
    
    // MARK: - Private properties
    var movies = [Result]()
    var cellTypes: [CellTypes] = [.filters, .films]
    var actualURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=56c45ba32cd76399770966658bf65ca0&language=ru-RU&page=1"
        
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCells()
        reformMovies()
    }

    // MARK: - Private methods
    private func configUI() {
        title = "Фильмы"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "blueView")
        navigationController?.navigationBar.tintColor = UIColor.red
        view.backgroundColor = UIColor(named: "blueView")
    }

    private func configCells() {
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "film")
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "filter")
        tableView.showsVerticalScrollIndicator = false
    }

    private func reformMovies() {
        let session = URLSession.shared

        guard let url = URL(string: actualURL) else { return }
        session.dataTask(with: URLRequest(url: url)) {(data, response, error) in
            
            do {
                guard let newData = data else { return }
                let result = try JSONDecoder().decode(MovieResult.self, from: newData)
                DispatchQueue.main.async {
                    self.movies = result.results
                    self.tableView.reloadData()
                    print("Movies: \(self.movies)")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}

extension FilmsTableViewController {
    enum Constants {
        
    }
    
    enum CellTypes {
        case filters
        case films
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FilmsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = cellTypes[section]
        switch type {
        case .filters:
            return 1
        case .films:
            return movies.count
    }
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellTypes[indexPath.section]
        switch type {
        case .filters:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "filter", for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }

            return cell
        case .films:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "film", for: indexPath) as? FilmTableViewCell else { return UITableViewCell() }
            cell.movieRefresh = movies[indexPath.row]
            
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


