//
//  ViewController.swift
//  Video-Player
//
//  Created by vic_liu on 2019/5/7.
//  Copyright © 2019 ios-class. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var searchBar: UISearchBar!
    var cancelButton:UIButton!
    var playButton:UIButton!
    var pauseButton:UIButton!
    var serrchController: UISearchController!
    var newM3u8: String?

    var playerItem: AVPlayerItem!
    var playerLayer: AVPlayerLayer!
    var player: AVPlayer!

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

        cancelButton.addTarget(self, action: #selector(ViewController.cancel(_:)), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(ViewController.play(_:)), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(ViewController.pause(_:)), for: .touchUpInside)

        playerItem = M3u8ResourceLoader.shared.playerItem(with: "")

        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.contentsScale = UIScreen.main.scale
        playerLayer.frame = UIScreen.main.bounds

    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(AVPlayerItem.loadedTimeRanges) {

        } else if keyPath == #keyPath(AVPlayerItem.status) {

            if playerItem.status == .readyToPlay {

                player.play()
            } else {
                print("loading error")
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }

    deinit {
        playerItem.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
        playerItem.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.loadedTimeRanges))
    }

    @objc func cancel(_ sender: UIButton) {

        searchBar.text = ""
    }

    @objc func play(_ sender: UIButton) {

        var sampleM3u8 = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        newM3u8 = avplayString(m3u8: sampleM3u8)
        searchBar.text = newM3u8
        view.layer.insertSublayer(playerLayer, at: 0)

        if sender.isEnabled {
            player.play()
        }

        playerItem.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: .new, context: nil)
        playerItem.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.loadedTimeRanges), options: .new, context: nil)


    }

    @objc func pause(_ sender: UIButton) {
        player.pause()
    }

    func avplayString(m3u8:String) -> String {

        return m3u8

    }

}



