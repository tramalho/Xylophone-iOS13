//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func keyPressed(_ sender: UIButton) {
        if let currentTitle = sender.currentTitle {
            
            sender.alpha = 0.5
                        
            print("start")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                print("end")
                self.playSound(soundName: currentTitle)
                sender.alpha = 1.0
            }
        }
    }
    
    private func playSound(soundName: String) {
        if let resource = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            player = try! AVAudioPlayer(contentsOf: resource)
            player.play()
        }
    }
}

