//
//  SongViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 08.11.2022.
//

import UIKit

class SongViewController: UIViewController {

    var songs = [Song]()
    var song = Song()
    var songView: SongView {
        return self.view as! SongView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        songView.delegate = self
        songView.containerView.layer.cornerRadius = 10.0
        songView.containerView.layer.shadowColor = UIColor.black.cgColor
        songView.containerView.layer.shadowOffset = .zero
        songView.containerView.layer.shadowOpacity = 1.0
        songView.containerView.layer.shadowRadius = 10.0
        let cgPath = UIBezierPath(roundedRect: songView.containerView.bounds,
                                  byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 10.0, height: 10.0)).cgPath
        songView.containerView.layer.shadowPath = cgPath
        songView.containerView.layer.shouldRasterize = true
        songView.passData(songs)
        songView.setupSubviews(song)
        
        self.isModalInPresentation = true
        self.navigationItem.titleView = UINavigationItem.setTitle(title: "Playing from album", subtitle: song.albumName ?? "")
    }
    
}

extension SongViewController: SongViewDelegate {
    func changeSong(_ albumName: String?) {
        self.navigationItem.titleView = UINavigationItem.setTitle(title: "Playing from album", subtitle: albumName ?? "")
    }
    
    func endListening() {
        self.dismiss(animated: true)
    }

}
