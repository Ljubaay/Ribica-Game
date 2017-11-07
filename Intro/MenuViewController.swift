//
//  MenuViewController.swift
//  Intro
//
//  Created by Macbook Pro on 4/3/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.music = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")!))
            Audio.music.prepareToPlay()
            
            Audio.click = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "mp3")!))
            Audio.click.prepareToPlay()
            
            Audio.forward = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Forward", ofType: "mp3")!))
            Audio.forward.prepareToPlay()
            
            Audio.instructions = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "inst", ofType: "mp3")!))
            Audio.instructions.prepareToPlay()
            
            //
        }
        catch {
            print(error)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func help(_ sender: Any) {
        //Audio.click.play()
        // play recording of instructions
        if (Audio.music.isPlaying){
            Audio.music.stop()
        }
        else {
        Audio.instructions.play()
        }
    }
    
    var doubleTap : Bool! = false
    //used to change what the music button does
    
    @IBAction func musicOn(_ sender: AnyObject) {
        

        if (doubleTap) {
            //stops the music on the even number of taps
            Audio.music.stop()
            doubleTap = false
        }
        else {
            //plays the music on touch, and odd number of taps
             Audio.music.play()
             doubleTap = true
             }
        }
    
    // Pressing one of the three following buttons takes the user to the respective mini-game
    @IBAction func shapes(_ sender: Any) {
        Audio.forward.play()
        performSegue(withIdentifier: "goToShapes", sender: self)
    }
    
    @IBAction func colors(_ sender: Any) {
        Audio.forward.play()
        performSegue(withIdentifier: "goToColors", sender: self)
    }
    
    @IBAction func animals(_ sender: Any) {
        Audio.forward.play()
        performSegue(withIdentifier: "goToAnimals", sender: self)
    }
    
}
