//
//  Song.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 03.11.2022.
//

import Foundation
import AVFoundation

struct Song: Equatable {
    var songName: String?
    var albumName: String?
    var artist: String?
    var songImage: Data?
    var songUrl: Foundation.URL?
    var duration: String?
    var player: AVAudioPlayer?
}

extension Song {
    static func getSongs() -> [Song] {
        
        var songs = [Song]()
        
        do {
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            let docDirectory = URL(fileURLWithPath: path)
            let directoryContents = try fm.contentsOfDirectory(at: docDirectory, includingPropertiesForKeys: nil)
            let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
            for url in mp3Files {
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                let asset = AVAsset(url: url)
                songs.append(Song(songName: asset.getItems(byKey: .commonKeyTitle),
                                  albumName: asset.getItems(byKey: .commonKeyAlbumName),
                                  artist: asset.getItems(byKey: .commonKeyArtist),
                                  songImage: asset.metadata.first(where: { $0.commonKey == .commonKeyArtwork})?.value as? Data,
                                  songUrl: url,
                                  duration: audioPlayer.duration.getDuration(),
                                  player: audioPlayer))
            }
        } catch {
            print(error)
        }
        return songs
    }
}
