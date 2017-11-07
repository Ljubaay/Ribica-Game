//
//  Colors4ViewController.swift
//  Intro
//
//  Created by Macbook Pro on 7/1/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class Colors4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()
            
            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.zelena = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zelena", ofType: "mp3")!))
            Audio.zelena.prepareToPlay()
            
            Audio.zuta = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zuta", ofType: "mp3")!))
            Audio.zuta.prepareToPlay()
            
            Audio.crvena = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Crvena", ofType: "mp3")!))
            Audio.crvena.prepareToPlay()

            
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //shows un/colored broccoli
    @IBOutlet weak var broccoli: UIImageView!
    
    func update() {
        performSegue(withIdentifier: "endColors", sender: self)
    }
    
    func good () {
        Audio.yay.play()
    }
    
    func bad() {
        Audio.wrong.play()
    }
    
    //correct
    @IBAction func green(_ sender: Any) {
        Audio.zelena.play()
        
        // switches to this other image
        broccoli.image = UIImage (named: "006-food-2")
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ColorsViewController.good), userInfo: nil, repeats: false)
        
        _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)
    }
    
    @IBAction func yellow(_ sender: Any) {
        Audio.zuta.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
    
    @IBAction func red(_ sender: Any) {
        Audio.crvena.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }

}
