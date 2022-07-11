//
//  HeroHeaderUIView.swift
//  Movies
//
//  Created by Pham Trung Huy on 30/06/2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroheaderimage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds // set frame of layer equal to bounds of superview
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraint(){
        playButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(self.frame.width * 0.2)
            $0.bottom.equalToSuperview().inset(self.frame.height*0.1)
            $0.width.equalTo(100)
        }
        downloadButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(self.frame.width * 0.6)
            $0.bottom.equalToSuperview().inset(self.frame.height*0.1)
            $0.width.equalTo(100)
        }
    }
}
