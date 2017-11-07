//
//  ColorsViewController.swift
//  Intro
//
//  Created by Macbook Pro on 4/3/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

// This class represents the view controller for the banana. 

class ColorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.forward = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Forward", ofType: "mp3")!))
            Audio.forward.prepareToPlay()
            
            Audio.correct = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "correct", ofType: "mp3")!))
            Audio.correct.prepareToPlay()
            
            Audio.wrong = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "wrong", ofType: "mp3")!))
            Audio.wrong.prepareToPlay()
            
            Audio.yay = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Yay", ofType: "mp3")!))
            Audio.yay.prepareToPlay()
            
            Audio.ljubicasta = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ljubicasta", ofType: "mp3")!))
            Audio.ljubicasta.prepareToPlay()
            
            Audio.zelena = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zelena", ofType: "mp3")!))
            Audio.zelena.prepareToPlay()
            
            Audio.zuta = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zuta", ofType: "mp3")!))
            Audio.zuta.prepareToPlay()
            
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
    
    //shows an image of the non-color banana
    @IBOutlet weak var bananaImage: UIImageView!
    
    func update() {
         performSegue(withIdentifier: "colors 2", sender: self)
        }
    
    func good () {
        Audio.yay.play()
    }
    
    func bad() {
        Audio.wrong.play()
    }
        
    //yellow button
    @IBAction func yellow(_ sender: UIButton) {
        Audio.zuta.play()
        
        //when the yellow button is pressed, the banana image is colored in - switched to this other image
        bananaImage.image = UIImage (named: "004-fruit-2")
        
         _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ColorsViewController.good), userInfo: nil, repeats: false)
        _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ColorsViewController.update), userInfo: nil, repeats: false)

        
        //let image = UIImage (named: "001-arrows")
        
//        func scaledImage(_ image: UIImage, maximumWidth: CGFloat) -> UIImage {
//            let rect: CGRect = CGRect(x: 0, y: 0, width: 10, height: 10)
//            let cgImage: CGImage = image.cgImage!.cropping(to: rect)!
//            return UIImage(cgImage: cgImage, scale: image.size.width / maximumWidth, orientation: image.imageOrientation)
//        }
//       let bravo: UIAlertController = UIAlertController ()
//        
//        let next: UIAlertAction = UIAlertAction(title: "next", style: .default) { action -> Void in
//            self.performSegue(withIdentifier: "next", sender: self)
//        }
//        next.setValue(image, forKey: "image")
//
//        bravo.addAction(next)
//        self.present(bravo, animated: true, completion: nil)
//        
    }
    
    //purple button
    @IBAction func purple(_ sender: Any) {
        Audio.ljubicasta.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }
    
    //green button
    @IBAction func green(_ sender: Any) {
        Audio.zelena.play()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ColorsViewController.bad), userInfo: nil, repeats: false)
    }

    //These two buttons play a discouraging sound, since they are the wrong colors.
    
    
   // self.present(actionSheetController, animated: true, completion: nil)
    
//    let alertView = UIAlertAction(UIAlertAction(title: "Cancel", handler: nil))
//    presentViewController(alertView, animated: true, completion: nil)
}
