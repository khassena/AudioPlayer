//
//  TimeInterval.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import Foundation

extension TimeInterval {
    func getDuration() -> String {
        let duration = Int(self)
        let minute = (duration / 60) % 60
        let second = duration % 60
        let time = String(format: "%0.1d:%0.2d", minute, second)
        return time
    }
}
