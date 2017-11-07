//
//  Colors3ViewController.swift
//  Intro
//
//  Created by Macbook Pro on 7/1/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class Colors3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
            Audio.correct = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "mp3")!))
            Audio.correct.prepareToPlay()
            
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()
            
            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.ljubicasta = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ljubicasta", ofType: "mp3")!))
            Audio.ljubicasta.prepareToPlay()
            
            Audio.narandzasta = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Narandzasta", ofType: "mp3")!))
            Audio.narandzasta.prepareToPlay()
            
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
    // shows the image of a non-colored carrot
    @IBOutlet weak var carrotImage: UIImageView!
    
    func update() {
        performSegue(withIdentifier: "colors 4", sender: self)
    }
    
    func good () {
        Audio.yay.play()
    }
    
    func bad() {
        Audio.wrong.play()
    }

    
    //correct
    @IBAction func orange(_ sender: Any) {
        Audio.narandzasta.play()
        
        // switches to this other image
        carrotImage.image = UIImage (named: "012-food")
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ColorsViewController.good), userInfo: nil, repeats: false)
        
        _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
    }
  
    @IBAction func blue(_ sender: Any) {
        Audio.plava.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
    @IBAction func purple(_ sender: Any) {
        Audio.ljubicasta.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
