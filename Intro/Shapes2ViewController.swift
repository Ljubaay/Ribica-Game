//
//  Shapes2ViewController.swift
//  Intro
//
//  Created by Macbook Pro on 7/2/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class Shapes2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.correct = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "mp3")!))
            Audio.correct.prepareToPlay()
        
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()
            
            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.trokut = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Trokut", ofType: "mp3")!))
            Audio.trokut.prepareToPlay()
            
            Audio.polukrug = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Polukrug", ofType: "mp3")!))
            Audio.polukrug.prepareToPlay()
            
            Audio.zvijezda = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zvijezda", ofType: "mp3")!))
            Audio.zvijezda.prepareToPlay()
            
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //keeps track of which gaps are filled in
    var starComplete: Bool = false
    var triangleComplete: Bool = false
    var halfComplete: Bool = false
    
    // this function moves to the next screen
    func update() {
        performSegue(withIdentifier: "shapes 3", sender: self)
    }
    
    // This variable keeps track of which gap was selected
    var clickedObject: String = ""
    
    // creates refernces for all the gaps and options
    @IBOutlet weak var starHR: UIButton!
    
    @IBOutlet weak var halfHR: UIButton!
    
    @IBOutlet weak var triangleHR: UIButton!
    
    @IBOutlet weak var starR: UIButton!
    
    @IBOutlet weak var triangleR: UIButton!
    
    @IBOutlet weak var halfR: UIButton!
    
    
    @IBAction func starHole(_ sender: Any) {
        Audio.zvijezda.play()
        clickedObject = "starHole"
    }
    
    @IBAction func halfHole(_ sender: Any) {
        Audio.polukrug.play()
        clickedObject = "halfHole"
    }
    
    @IBAction func triangleHole(_ sender: Any) {
        Audio.trokut.play()
        clickedObject = "triangleHole"
    }
    
    @IBAction func star(_ sender: Any) {
        if (clickedObject == "starHole"){
            
            Audio.correct.play()
            
            // fills in the gap
            starHR.setBackgroundImage(UIImage (named: "star"), for: .normal)
            
              // removes the shape from the side
            starR.setImage(UIImage (named: ""), for: .normal)
            
            starComplete = true
            
            //if the entire puzzle is finished
            if (triangleComplete && halfComplete){
                Audio.yay.play()
                
                 _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
        else {
            Audio.wrong.play()
        }

    }
    
    @IBAction func triangle(_ sender: Any) {
        if (clickedObject == "triangleHole"){
           
            Audio.correct.play()
            
            // fills in the gap
            triangleHR.setBackgroundImage(UIImage (named: "triangle"), for: .normal)
            
              // removes the shape from the side
            triangleR.setImage(UIImage (named: ""), for: .normal)
            
            triangleComplete = true
            
            //if the entire puzzle is finished
            if (starComplete && halfComplete){
                Audio.yay.play()
                
                 _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
        else {
            Audio.wrong.play()
        }

    }
    
    @IBAction func half(_ sender: Any) {
        if (clickedObject == "halfHole"){
            
            Audio.correct.play()
            
            //fills in the gap
            halfHR.setBackgroundImage(UIImage (named: "halfCircle"), for: .normal)
            
              // removes the shape from the side
            halfR.setImage(UIImage (named: ""), for: .normal)
            
            halfComplete = true
            
            //if the entire puzzle is finished
            if (starComplete && triangleComplete){
                Audio.yay.play()
                
                 _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
            }
        }
        else {
            Audio.wrong.play()
        }

    }

}
