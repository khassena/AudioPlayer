//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 03.11.2022.
//

import UIKit
import AVFoundation

class PlaylistViewController: UIViewController {

    @IBOutlet weak var songImageFirst: UIImageView!
    @IBOutlet weak var nameOfSongFirst: UILabel!
    @IBOutlet weak var durationOfSongFirst: UILabel!
    @IBOutlet weak var firstSongStackView: UIStackView!
    
    
    @IBOutlet weak var songImageSecond: UIImageView!
    @IBOutlet weak var nameOfSongSecond: UILabel!
    @IBOutlet weak var durationOfSongSecond: UILabel!
    @IBOutlet weak var secondSongStackView: UIStackView!
    
    @IBOutlet weak var songImageThird: UIImageView!
    @IBOutlet weak var nameOfSongThird: UILabel!
    @IBOutlet weak var durationOfSongThird: UILabel!
    @IBOutlet weak var thirdSongStackView: UIStackView!
    var player: AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

