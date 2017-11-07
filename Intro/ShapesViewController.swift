//
//  ShapesViewController.swift
//  Intro
//
//  Created by Macbook Pro on 4/3/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class ShapesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         do {
            Audio.forward = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Forward", ofType: "mp3")!))
            Audio.forward.prepareToPlay()
            
            Audio.correct = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "mp3")!))
            Audio.correct.prepareToPlay()
            
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()
            
            Audio.pravokutnik = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pravokutnik", ofType: "mp3")!))
            Audio.pravokutnik.prepareToPlay()
            
            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.trokut = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Trokut", ofType: "mp3")!))
            Audio.trokut.prepareToPlay()
            
            Audio.krug = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Krug", ofType: "mp3")!))
            Audio.krug.prepareToPlay()
            
        // Do any additional setup after loading the view.
         }
         catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // makes references for all the gaps and options
    @IBOutlet weak var squareRef: UIButton!
    
    @IBOutlet weak var triangleRef: UIButton!
    
    @IBOutlet weak var circleRef: UIButton!
    
    @IBOutlet weak var squareRef2: UIButton!
    
    @IBOutlet weak var triangleRef2: UIButton!
    
    @IBOutlet weak var circleRef2: UIButton!
    
    
    @IBAction func squareHole(_ sender: Any) {
        Audio.pravokutnik.play()
        clickedObject = "squareHole"
    }

    @IBAction func circleHole(_ sender: Any) {
        Audio.krug.play()
        clickedObject = "circleHole"
    }
    
    @IBAction func triangleHole(_ sender: Any) {
        Audio.trokut.play()
        clickedObject = "triangleHole"
    }
    
    // keeps track of whether or not these gaps were filled in
    var squareComplete: Bool = false
    var triangleComplete: Bool = false
    var circleComplete: Bool = false
    
    // this function moves to the next screen
    func update() {
        performSegue(withIdentifier: "shapes2", sender: self)
    }
    
    
    @IBAction func square(_ sender: Any) {
        if (clickedObject == "squareHole"){
            //print("test")
            Audio.correct.play()
            
            // fills in the gap
             squareRef.setBackgroundImage(UIImage (named: "Window-Square"), for: .normal)
            
            // removes the shape from the side
             squareRef2.setImage(UIImage (named: ""), for: .normal)
            
            squareComplete = true
            
            // if the netire puzzle is finished
            if (circleComplete && triangleComplete){
                
                Audio.yay.play()
                
                //calls the update function after 4 seconds, to move on to the next screen
                 _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
        else {
            Audio.wrong.play()
        }
    }

    @IBAction func triangle(_ sender: Any) {
        if (clickedObject == "triangleHole"){
           // print("testT")
            Audio.correct.play()
            
            // fills in the gap
            triangleRef.setBackgroundImage(UIImage (named: "Window-Triangle"), for: .normal)
            
              // removes the shape from the side
            triangleRef2.setImage(UIImage (named: ""), for: .normal)
            
            triangleComplete = true
            
            //if the entire puzzle is finished
            if (squareComplete && circleComplete){
                
                Audio.yay.play()
                
                //calls the update function after 4 seconds, to move on to the next screen
                _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
            else {
                Audio.wrong.play()
            }
    }
    
    @IBAction func circle(_ sender: Any) {
        if (clickedObject == "circleHole"){
            //print("testC")
            Audio.correct.play()
            
            // fills in the gap
            circleRef.setBackgroundImage(UIImage (named: "Wheel"), for: .normal)
            
            // removes the shape from the side
            circleRef2.setImage(UIImage (named: ""), for: .normal)
            
            circleComplete = true
            
            //if the entire puzzle is finished
            if (squareComplete && triangleComplete){
                
                Audio.yay.play()
                
                //calls the update function after 4 seconds, to move on to the next screen
                _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
            else {
                Audio.wrong.play()
            }
    }
    
    // This variable keeps track of which gap was selected
    var clickedObject: String = ""


}
