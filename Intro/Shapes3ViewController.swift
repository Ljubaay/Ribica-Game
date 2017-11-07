//
//  Shapes3ViewController.swift
//  Intro
//
//  Created by Macbook Pro on 7/2/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class Shapes3ViewController: UIViewController {

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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // references to all the buttons
    @IBOutlet weak var triangleHR: UIButton!
    
    @IBOutlet weak var circleHR: UIButton!
    
    @IBOutlet weak var rectangleHR: UIButton!
    
    @IBOutlet weak var rectangleR: UIButton!
    
    @IBOutlet weak var circleR: UIButton!

    @IBOutlet weak var triangleR: UIButton!
    
    //keeps track of which gaps are filled in
    var rectangleComplete: Bool = false
    var triangleComplete: Bool = false
    var circleComplete: Bool = false
    
    // this function moves to the next screen
    func update() {
        performSegue(withIdentifier: "endShapes", sender: self)
    }
    
    // This variable keeps track of which gap was selected
    var clickedObject: String = ""
    
    @IBAction func circleHole(_ sender: Any) {
        Audio.krug.play()
        clickedObject = "circleHole"
    }
    
    @IBAction func rectangleHole(_ sender: Any) {
        Audio.pravokutnik.play()
        clickedObject = "squareHole"
    }
    
    @IBAction func triangleHole(_ sender: Any) {
        Audio.trokut.play()
        clickedObject = "triangleHole"
    }
    
    @IBAction func rectangle(_ sender: Any) {
        if (clickedObject == "squareHole"){
            //print("test")
            Audio.correct.play()
            
            // fills in the gap
            rectangleHR.setBackgroundImage(UIImage (named: "pot1"), for: .normal)
            
            // removes the shape from the side
            rectangleR.setImage(UIImage (named: ""), for: .normal)
            
            rectangleComplete = true
            
            // if the netire puzzle is finished
            if (circleComplete && triangleComplete){
                
                Audio.yay.play()
                
//                //calls the update function after 4 seconds, to move on to the next screen
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
            circleHR.setBackgroundImage(UIImage (named: "sun1"), for: .normal)
            
            // removes the shape from the side
            circleR.setImage(UIImage (named: ""), for: .normal)
            
            circleComplete = true
            
            //if the entire puzzle is finished
            if (rectangleComplete && triangleComplete){
                
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
            triangleHR.setBackgroundImage(UIImage (named: "tree1"), for: .normal)
            
            // removes the shape from the side
            triangleR.setImage(UIImage (named: ""), for: .normal)
            
            triangleComplete = true
            
            //if the entire puzzle is finished
            if (rectangleComplete && circleComplete){
                
                Audio.yay.play()
                
                //calls the update function after 4 seconds, to move on to the next screen
                _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
        else {
            Audio.wrong.play()
        }

    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
}
