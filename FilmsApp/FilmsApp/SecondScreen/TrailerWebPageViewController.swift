//
//  TrailerWebPageViewController.swift
//  FilmsApp
//
//  Created by Daniil on 27.10.2022.
//

import UIKit
import WebKit

// Класс открывает контроллер с WebView с ссылкой на трейлер к фильму
final class TrailerWebPageViewController: UIViewController {

    // MARK: - Visual components
    private let trailerWebView: WKWebView = {
        let webConfig = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfig)
        return web
    }()

    // MARK: Public properties
    var trailerURLString = "https://www.youtube.com/watch?v=cpJMSOvnwTI&list=PLmTuDg46zmKD6nI5Meg0_atl0qY-UgTtP&index=27"
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configWeb()
    }
    
    // MARK: - Private methods
    private func configWeb() {
        guard let trailerURL = URL(string: trailerURLString) else { return }
        let productRequest = URLRequest(url: trailerURL)
        trailerWebView.load(productRequest)
        view = trailerWebView
    }
}
