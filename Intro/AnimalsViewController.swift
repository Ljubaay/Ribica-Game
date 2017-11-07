//
//  AnimalsViewController.swift
//  Intro
//
//  Created by Macbook Pro on 4/3/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation

class AnimalsViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            Audio.moo = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Moo", ofType: "mp3")!))
             Audio.moo.prepareToPlay()
            
            Audio.quack = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "quack", ofType: "mp3")!))
             Audio.quack.prepareToPlay()
            
            Audio.frog = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "frog", ofType: "mp3")!))
             Audio.frog.prepareToPlay()
            
            Audio.elephant = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "elephant", ofType: "mp3")!))
             Audio.elephant.prepareToPlay()
            
            Audio.monkey = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "monkey", ofType: "mp3")!))
             Audio.monkey.prepareToPlay()
            
            Audio.meow = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "meow", ofType: "wav")!))
            Audio.meow.prepareToPlay()
            
            Audio.sheep = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "billy goat", ofType: "mp3")!))
            Audio.sheep.prepareToPlay()
            
            Audio.bee = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bee", ofType: "mp3")!))
            Audio.bee.prepareToPlay()
            
            Audio.ovca = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ovca1", ofType: "mp3")!))
            Audio.ovca.prepareToPlay()
            
            Audio.macka = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Macka", ofType: "mp3")!))
            Audio.macka.prepareToPlay()
            
            Audio.majmun = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Majmun", ofType: "mp3")!))
            Audio.majmun.prepareToPlay()
            
            Audio.zaba = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Zaba", ofType: "mp3")!))
            Audio.zaba.prepareToPlay()
            
            Audio.pcela = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pcela", ofType: "mp3")!))
            Audio.pcela.prepareToPlay()
            
            Audio.patka = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Patka", ofType: "mp3")!))
            Audio.patka.prepareToPlay()
            
            Audio.slon = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Slon", ofType: "mp3")!))
            Audio.slon.prepareToPlay()
            
            Audio.krava = try AVAudioPlayer (contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Krava", ofType: "mp3")!))
            Audio.krava.prepareToPlay()
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // This declares the number of items so that this many can be printed out later.
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // This basically shows as many "squares" as there are items declared. If there were 6 buttons, it would show 6 buttons, and empty space. Currently there are 8 buttons. More can be added in the storyboard, and printed out by following the programming pattern below.
     
        switch indexPath.row {
        case 0:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "zero", for: indexPath)
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "one", for: indexPath)
        case 2:
             return collectionView.dequeueReusableCell(withReuseIdentifier: "two", for: indexPath)
        case 3:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "three", for: indexPath)
        case 4:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "four", for: indexPath)
        case 5:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "five", for: indexPath)
        case 6:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "six", for: indexPath)
        case 7:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "seven", for: indexPath)
        case 8:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "eight", for: indexPath)
            
        default:
           return collectionView.dequeueReusableCell(withReuseIdentifier: "one", for: indexPath)
        }
        
    }
    var doubleTap : Bool! = false
    //used to change which sound each button plays

    
    @IBAction func Cow(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.moo.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.krava.play()
            doubleTap = true
        }

    }

    @IBAction func sheep(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.sheep.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.ovca.play()
            doubleTap = true
        }
    }
    
    @IBAction func monkey(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.monkey.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.majmun.play()
            doubleTap = true
        }    }
    
    @IBAction func frog(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.frog.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.zaba.play()
            doubleTap = true
        }
    }
    
    @IBAction func elephant(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.elephant.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.slon.play()
            doubleTap = true
        }
    }
    
    @IBAction func bee(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.bee.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.pcela.play()
            doubleTap = true
        }
    }
    
    @IBAction func cat(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.meow.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.macka.play()
            doubleTap = true
        }
    }
    
    @IBAction func duck(_ sender: Any) {
        if (doubleTap) {
            //plays the sound
            Audio.quack.play()
            doubleTap = false
        }
        else {
            //plays the name
            Audio.patka.play()
            doubleTap = true
        }
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
