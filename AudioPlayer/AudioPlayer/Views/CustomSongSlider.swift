//
//  CustomSongSlider.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 09.11.2022.
//

import UIKit

class CustomSongSlider: UISlider {

    private let height: CGFloat = 3.0
    
    private let thumbView: UIView = {
        let thumbView = UIView()
        thumbView.backgroundColor = .systemGreen
        return thumbView
    }()
    
    init(thumbRadius: CGFloat) {
        super.init(frame: CGRect.zero)
        let thumb = thumbImage(radius: thumbRadius)
        setThumbImage(thumb, for: .normal)
        maximumTrackTintColor = #colorLiteral(red: 0.4187612496, green: 0.7685038056, blue: 0.2133596507, alpha: 0.2476690432)
        minimumTrackTintColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func thumbImage(radius: CGFloat) -> UIImage {
        thumbView.frame = CGRect(x: 0, y: radius / 2, width: radius, height: radius)
        thumbView.layer.cornerRadius = radius / 2
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newRect = super.trackRect(forBounds: bounds)
        newRect.size.height = height
        return newRect
    }
}
