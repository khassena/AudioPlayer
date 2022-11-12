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
        songView.passData(song, songs)
        songView.setupSubviews()
        self.navigationItem.titleView = UINavigationItem.setTitle(title: "Playing from album", subtitle: song.albumName ?? "")
        
    }
    
}

extension SongViewController: SongViewDelegate {
    func endListening() {
        self.dismiss(animated: true)
    }

}
