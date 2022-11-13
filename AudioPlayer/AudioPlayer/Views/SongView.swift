//
//  Custom.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 11.11.2022.
//

import UIKit
import AVFoundation

protocol SongViewDelegate: AnyObject {
    func endListening()
}

class SongView: UIView {
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songDurationForward: UILabel!
    @IBOutlet weak var songDurationBackward: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var shuffleDotImage: UIImageView!
    @IBOutlet weak var repeatDotImage: UIImageView!
    
    @IBOutlet weak var songDurationStackView: UIStackView!
    
    weak var delegate: SongViewDelegate?
    private let songSlider = CustomSongSlider(thumbRadius: 10.0)
    var songsDictionary = [Int:Song]()
    var song = Song()
    var timer: Timer?
    var player = AVAudioPlayer()
    var shuffleValue = false
    var repeatValue = false
    

    func passData( _ songs: [Song]) {
        for music in songs.indices {
            songsDictionary[music] = songs[music]
        }
    }
    
    public func setupSubviews(_ song: Song) {
        self.song = song
        do {
            guard let url = song.songUrl else { return }
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.delegate = self
            self.player = audioPlayer
        } catch {
            print(error)
        }
        songImage.image = (UIImage(data: song.songImage ?? Data())) ?? UIImage(named: "album-placeholder")
        songName.text = song.songName
        artistName.text = song.artist
        songSlider.maximumValue = Float(player.duration)
        songDurationStackView.addArrangedSubview(songSlider)
        songSlider.addTarget(self,
                             action: #selector(changeMusicTime),
                             for: .valueChanged)
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateSongSlider),
                                     userInfo: nil, repeats: true)
        player.prepareToPlay()
        playPauseMusic()
    }
    
    
    @IBAction func playAction(_ sender: UIButton) {
        playPauseMusic()
    }
    
    @IBAction func nextSongAction(_ sender: UIButton) {
        nextSong(songFinish: false)
    }
    
    @IBAction func prevSongAction(_ sender: UIButton) {
        prevSong()
    }
    
    @IBAction func volumeAction(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func dissmissByButton(_ sender: UIBarButtonItem) {
        stopPlayer()
        delegate?.endListening()
    }
    
    @IBAction func shuffleAction(_ sender: UIButton) {
        if shuffleDotImage.isHidden {
            shuffleValue = true
            shuffleButton.tintColor = .black
            shuffleDotImage.isHidden = false
            
        } else {
            shuffleValue = false
            shuffleButton.tintColor = .darkGray
            shuffleDotImage.isHidden = true
        }
        
    }
    
    @IBAction func repeatAction(_ sender: UIButton) {
        if repeatDotImage.isHidden {
            repeatValue = true
            repeatButton.tintColor = .black
            repeatDotImage.isHidden = false
            
        } else {
            repeatValue = false
            repeatButton.tintColor = .darkGray
            repeatDotImage.isHidden = true
        }
    }
    
    func nextSong(songFinish: Bool) {
        stopPlayer()
        var key = getKey(for: .next, songFinish: songFinish)
        if key == songsDictionary.count {
            key = 0
        }
        guard let song = songsDictionary[key] else { return }
        setupSubviews(song)
    }
    
    func prevSong() {
        stopPlayer()
        var key = getKey(for: .previous, songFinish: false)
        if key < 0 {
            key = songsDictionary.count - 1
        }
        guard let song = songsDictionary[key] else { return }
        setupSubviews(song)
    }
    
    func getKey(for direction: Direction, songFinish: Bool) -> Int {
        guard var key = songsDictionary.first(where: { $1 == song })?.key
        else { return 0 }
        let songsArray = (0...songsDictionary.count - 1).filter {$0 != key}
        guard let randomIndex = songsArray.randomElement() else { return 0 }
        
        if songFinish == true {
            switch repeatValue {
            case true: return key
            default: key += direction.rawValue
            }
        } else {
            switch shuffleValue {
            case true: key = randomIndex
            default: key += direction.rawValue
            }
        }
        return key
    }
    
    func stopPlayer() {
        player.stop()
        timer?.invalidate()
        timer = nil
    }
    
    func playPauseMusic() {
        if player.isPlaying == true {
            player.stop()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @objc func changeMusicTime() {
        player.stop()
        player.currentTime = TimeInterval(songSlider.value)
        player.prepareToPlay()
        playPauseMusic()
    }
    
    @objc func updateSongSlider() {
        songSlider.value = Float(player.currentTime)
        changeTimers(time: player.currentTime)
    }
    
    func changeTimers(time: TimeInterval) {
        songDurationForward.text = time.getDuration()
        songDurationBackward.text = "-"+(player.duration - time).getDuration()
    }
    
}

extension SongView: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        nextSong(songFinish: true)
    }
}
