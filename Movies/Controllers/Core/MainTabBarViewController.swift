//
//  ViewController.swift
//  Movies
//
//  Created by Pham Trung Huy on 29/06/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private let vc1: UINavigationController
    private let vc2: UINavigationController
    private let vc3: UINavigationController
    private let vc4: UINavigationController

    init(vc1: HomeViewController, vc2: UpComingViewController, vc3: SearchViewController, vc4: DownloadsViewController) {
        self.vc1 = UINavigationController(rootViewController: vc1)
        self.vc2 = UINavigationController(rootViewController: vc2)
        self.vc3 = UINavigationController(rootViewController: vc3)
        self.vc4 = UINavigationController(rootViewController: vc4)
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        // Do any additional setup after loading the view.



        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        vc1.title = "Home"
        vc2.title = "Up Coming"
        vc3.title = "Search"
        vc4.title = "Download"

        tabBar.tintColor = .label
    }

    func makeSearchViewController() -> SearchViewController {
        let repository = MoviesRepository()
        let viewModel = SearchViewModel(repository: repository)
        let searchViewController = SearchViewController(viewModel: viewModel)
        return searchViewController
    }


}

