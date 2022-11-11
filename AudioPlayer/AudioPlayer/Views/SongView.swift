//
//  Custom.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 11.11.2022.
//

import UIKit

class SongView: UIView {
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songDurationForward: UILabel!
    @IBOutlet weak var songDurationBackward: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var prevSongButton: UIButton!
    @IBOutlet weak var nextSongButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var songDurationStackView: UIStackView!
    
    var songs = [Song]()
    var song = Song()
    

    func passData(_ song: Song, _ songs: [Song]) {
        self.song = song
        self.songs = songs
    }
    
    public func setupSubviews() {
        songImage.image = (UIImage(data: song.songImage ?? Data())) ?? UIImage(named: "album-placeholder")
        songName.text = song.songName
        artistName.text = song.artist
    }
    
    @IBAction func nextSongAction(_ sender: Any) {
        
    }
    
}
