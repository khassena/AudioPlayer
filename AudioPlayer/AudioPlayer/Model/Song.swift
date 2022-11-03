//
//  Song.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 03.11.2022.
//

import Foundation
import AVFoundation

enum Music: String {
    case mockingbird = "mockingbird"
    case blackBumer = "Черный бумер"
    case yesterday = "Yesterday"
    case defaults
}

struct Song {
    let songName: Music
    let duration: Float = 0
    
    func getSong(songName: Music) -> AVAudioPlayer {
        var player = AVAudioPlayer()
        do {
            if let audioPath = Bundle.main.path(forResource: songName.rawValue, ofType: ".mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print(error)
        }
        return player
    }
}

extension Song {
    static func createSong(index: Int) -> Song {
        switch index {
        case 1: return Song(songName: Music.mockingbird)
        case 2: return Song(songName: Music.blackBumer)
        case 3: return Song(songName: Music.yesterday)
        default: return Song(songName: Music.defaults)
        }
    }
}
