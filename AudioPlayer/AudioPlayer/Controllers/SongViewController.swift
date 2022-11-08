//
//  SongViewController.swift
//  AudioPlayer
//
//  Created by Amanzhan Zharkynuly on 08.11.2022.
//

import UIKit

class SongViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UINavigationItem.setTitle(title: "Playing from album", subtitle: "Fuu")
    }

}
