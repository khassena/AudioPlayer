//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 03.11.2022.
//

import UIKit
import AVFoundation

class PlaylistViewController: UIViewController {

    @IBOutlet weak var generalStackView: UIStackView!
    
    private let songs = Song.getSongs()
    var sendSong = Song()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
   
    func setupView() {
        for song in songs {
            let playlist = PlaylistStackView()
            playlist.setupValue(song)
            playlist.delegate = self
            generalStackView.addArrangedSubview(playlist)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            guard let songVC = navVC.topViewController as? SongViewController else { return }
            songVC.song = sendSong
        }
    }
}

extension PlaylistViewController: PlaylistStackViewDelegate {
    func didTap(_ stackView: PlaylistStackView) {
        stackView.clickAnimation {
            self.sendSong = stackView.song
            self.performSegue(withIdentifier: "songVCSegue", sender: nil)
        }
    }
}



