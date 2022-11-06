//
//  TimeInterval.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import Foundation

extension TimeInterval {
    func getDuration() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        let duration = formatter.string(from: self)
        return duration ?? ""
    }
}
