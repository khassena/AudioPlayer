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
    
    func bottomLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height + 11.0 , width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func clickAnimation(_ completionBlock: @escaping () -> Void) {
      isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}
