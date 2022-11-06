//
//  AVMetaDataItem+getItem.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import Foundation
import AVFoundation

extension AVAsset {
    func getItems(byKey: AVMetadataKey) -> String {
        if let metadata = self.metadata.first(where: {$0.commonKey == byKey}),
           let value = metadata.value as? String {
            return value
        }
        return ""
    }
}
