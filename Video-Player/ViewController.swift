//
//  ViewController.swift
//  Video-Player
//
//  Created by vic_liu on 2019/5/7.
//  Copyright © 2019 ios-class. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var searchBar: UISearchBar!
    var cancelButton:UIButton!
    var playButton:UIButton!
    var pauseButton:UIButton!
    var serrchController: UISearchController!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.white,
                                 for: .normal)
        cancelButton.contentHorizontalAlignment = .left
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelButton)

        playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(UIColor.white,
                                   for: .normal)
        playButton.contentHorizontalAlignment = .left
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)

        pauseButton = UIButton()
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(UIColor.white,
                                 for: .normal)
        pauseButton.contentHorizontalAlignment = .right
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pauseButton)

        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true

        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true

        playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

        pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        pauseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

    }


}

