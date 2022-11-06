//
//  StackView+CreateView.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 06.11.2022.
//

import UIKit

extension UIStackView {
    static func createStackView(views: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        var stackView = UIStackView()
        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 10.0
        return stackView
    }
}
