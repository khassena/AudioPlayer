//
//  MusicListView.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import UIKit

protocol PlaylistStackViewDelegate {
    func didTap(_ stackView: PlaylistStackView)
}

class PlaylistStackView: UIStackView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size.width = 67
        imageView.frame.size.height = 66
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel = UILabel.createLabel(text: "assas",
                                                color: .black,
                                                fontSize: 20,
                                                style: "")
    
    private let artistLabel = UILabel.createLabel(text: "dfddvf",
                                                  color: .gray,
                                                  fontSize: 17,
                                                  style: "regular")
    
    private let songDuration = UILabel.createLabel(text: "vf",
                                                   color: .gray,
                                                   fontSize: 17,
                                                   style: "regular")
    private lazy var namesStackView = UIStackView.createStackView(views: [titleLabel, artistLabel],
                                                                 axis: .vertical)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        let pLaylistVC = PlaylistViewController()
        pLaylistVC.delegate = self
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addArrangedSubview(imageView)
        addArrangedSubview(namesStackView)
        addArrangedSubview(songDuration)
        axis = .horizontal
        alignment = .center
        distribution = .fillProportionally
        spacing = 10.0
        imageView.image = UIImage(named: "dog12")
        
        NSLayoutConstraint.activate([
            namesStackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 242),
            songDuration.widthAnchor.constraint(greaterThanOrEqualToConstant: 45),
            imageView.widthAnchor.constraint(equalToConstant: 67),
            imageView.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
    
}

extension PlaylistStackView: PlaylistViewControllerDelegate {
    func sendSongs(_ song: [Song]) {
        
    }
    
}
