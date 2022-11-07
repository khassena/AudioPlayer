//
//  UILabel+CreateView.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import UIKit

extension UILabel {
    static func createLabel(text: String, color: UIColor, fontSize: CGFloat, style: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .left
        label.numberOfLines = 0
        if style == "bold" {
            label.font = UIFont.boldSystemFont(ofSize: fontSize)
        } else {
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
        label.textColor = color
        return label
    }
}
