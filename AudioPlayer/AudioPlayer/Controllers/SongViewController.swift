//
//  SongViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 08.11.2022.
//

import UIKit

class SongViewController: UIViewController {
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songDurationForward: UILabel!
    @IBOutlet weak var songDurationBackward: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var prevSongButton: UIButton!
    @IBOutlet weak var NextSongButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var songDurationStackView: UIStackView!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let song = self.song {
            print(song)
        }
        self.navigationItem.titleView = UINavigationItem.setTitle(title: "Playing from album", subtitle: "Fuu")
    }

}
