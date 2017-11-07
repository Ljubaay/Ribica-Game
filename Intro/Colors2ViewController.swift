//
//  Colors2ViewController.swift
//  Intro
//
//  Created by Macbook Pro on 6/16/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

// This class represents the view controller for the strawberry

class Colors2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.correct = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "mp3")!))
            Audio.correct.prepareToPlay()
            
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()

            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.zelena = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zelena", ofType: "mp3")!))
            Audio.zelena.prepareToPlay()
            
            Audio.crvena = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Crvena", ofType: "mp3")!))
            Audio.crvena.prepareToPlay()
            
            Audio.plava = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Plava", ofType: "mp3")!))
            Audio.plava.prepareToPlay()
            
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
    // shows the image of a non-colored strawberry
    @IBOutlet weak var strawImage: UIImageView!
    
    func update() {
        performSegue(withIdentifier: "colors 3", sender: self)
    }
    
    func good () {
        Audio.yay.play()
    }
    
    func bad() {
        Audio.wrong.play()
    }

    //correct button
    @IBAction func red(_ sender: Any) {
        
        Audio.crvena.play()
        
        // switches to this other image
        strawImage.image = UIImage (named: "011-strawberry")
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ColorsViewController.good), userInfo: nil, repeats: false)
        
        _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
    }
    
    @IBAction func blue(_ sender: Any) {
        Audio.plava.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
    
    @IBAction func green(_ sender: Any) {
        Audio.zelena.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
}
