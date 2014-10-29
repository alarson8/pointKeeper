//
//  ViewController.swift
//  pokerTracker
//
//  Created by Andrew Larson on 10/28/14.
//  Copyright (c) 2014 Andrew Larson. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    //Disable View Rotation
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    //Buttons
    @IBOutlet var tapMe: UIButton!
    @IBOutlet var tapMe2: UIButton!

    //Initial Game
    // Why can't p1Count and p2Count be initialized as Integers and why do they have to be before viewDidLoad()?
    var game = Game()
    var p1Count = 0
    var p2Count = 0
   
    
    
    //Border Colors
    var p1BorderColor : UIColor = UIColor( red: 0.78, green: 0.07, blue:0.07, alpha: 1.0 )
    var p2BorderColor : UIColor = UIColor( red: 0.45, green: 0.11, blue:0.7, alpha: 1.0 )

    override func viewDidLoad() {
        
        p1Count = game.p1Points
        p2Count = game.p2Points


        super.viewDidLoad()
        //Buttons to Circles and Flip first
        tapMe.layer.cornerRadius = tapMe.bounds.size.width / 2.0
        tapMe.layer.borderWidth = 5
        tapMe.layer.borderColor = p1BorderColor.CGColor
        tapMe.titleLabel?.transform = CGAffineTransformMakeRotation(3.14)
        
        tapMe2.layer.cornerRadius = tapMe2.bounds.size.width / 2.0
        tapMe2.layer.borderWidth = 5
        tapMe2.layer.borderColor = p2BorderColor.CGColor
        
        self.startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startGame(){
        refreshScore()
    }
    
    func p1Rules(){
        ++p1Count
        --p2Count
    }
    
    func p2Rules(){
        ++p2Count
        --p1Count
    }
    
    func isWin(score: Int) -> Bool {
        if score==0 {
            return true
        }
        return false
    }
    
    func refreshScore(){
        tapMe.setTitle("\(p1Count)", forState: UIControlState.Normal)
        tapMe2.setTitle("\(p2Count)", forState: UIControlState.Normal)
    }
    
    
    @IBAction func p2Action(sender: AnyObject) {
        p2Rules()
        refreshScore()
        if isWin(p1Count){
            println("Player2 Wins")
        }
        
    }
    
    
    @IBAction func p1Action(sender: AnyObject) {
        p1Rules()
        refreshScore()
        if isWin(p2Count){
            println("Player1 Wins")
        }
    }
    
    
    
}

