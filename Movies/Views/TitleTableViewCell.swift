//
//  TitleTableViewCell.swift
//  Movies
//
//  Created by Pham Trung Huy on 04/07/2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"

    private lazy var titlePosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterImage)
        contentView.addSubview(titleLabel)
        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func applyConstraints() {
        titlePosterImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(titlePosterImage.snp.trailing).offset(20)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    public func configure(with model: TitlePreview){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        titlePosterImage.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
}
