//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 03.11.2022.
//

import UIKit
import AVFoundation

protocol PlaylistViewControllerDelegate: AnyObject {
    func sendSongs(_ song: [Song])
}

class PlaylistViewController: UIViewController {

    private let songs = Song.getSongs()
    var player: AVAudioPlayer?
    private let playlist = PlaylistStackView()
    weak var delegate: PlaylistViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    func setupView() {
        delegate?.sendSongs(songs)
    }
}

