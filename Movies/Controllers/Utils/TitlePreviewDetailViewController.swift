//
//  TitlePreviewDetailViewController.swift
//  Movies
//
//  Created by Pham Trung Huy on 08/07/2022.
//

import UIKit
import WebKit

class TitlePreviewDetailViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private lazy var webView: WKWebView = WKWebView()

    private let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(webView)
        view.addSubview(downloadButton)
        applyConstraint()
        navigationItem.largeTitleDisplayMode = .never
    }

    private func applyConstraint() {

        webView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(webView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview()
        }

        overViewLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        downloadButton.snp.makeConstraints {
            $0.top.equalTo(overViewLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(3)
        }
    }

    public func configure(title: TitlePreviewDetail) {
        titleLabel.text = title.title
        overViewLabel.text = title.titleOverview
        guard let url = URL(string: "https://www.youtube.com/embed/\(title.youtubeView.id.videoId)") else {
            return
        }

        webView.load(URLRequest(url: url))
    }
}
