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
    @IBOutlet var p1Button: UIButton!
    @IBOutlet var p2Button: UIButton!

    //Initial Game
    //***********************************************
    // 1. Why can't p1Count and p2Count be initialized as Integers and why do they have to be before viewDidLoad()?
    // 2. How come I can initialize a new Game() and where is it best to layout my new varialbes/objects
    //***********************************************
    
    var p1Count = 0
    var p2Count = 0
    var game = Game()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        p1Count = game.gamePoints
        p2Count = game.gamePoints

        //Border Colors
        var p1BorderColor : UIColor = UIColor( red: 0.78, green: 0.07, blue:0.07, alpha: 1.0 )
        var p2BorderColor : UIColor = UIColor( red: 0.45, green: 0.11, blue:0.7, alpha: 1.0 )

        //Buttons to Circles and Flip first
        p1Button.layer.cornerRadius = p1Button.bounds.size.width / 2.0
        p1Button.layer.borderWidth = 5
        p1Button.layer.borderColor = p1BorderColor.CGColor
        p1Button.titleLabel?.transform = CGAffineTransformMakeRotation(3.14)
        
        p2Button.layer.cornerRadius = p2Button.bounds.size.width / 2.0
        p2Button.layer.borderWidth = 5
        p2Button.layer.borderColor = p2BorderColor.CGColor
        
        self.startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startGame(){
        refreshScore()
    }
    
    func p1Score(){
        ++p1Count
        --p2Count
    }
    
    func p2Score(){
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
        p1Button.setTitle("\(p1Count)", forState: UIControlState.Normal)
        p2Button.setTitle("\(p2Count)", forState: UIControlState.Normal)
    }
    
    //Player Buttons
    @IBAction func p2Action(sender: AnyObject) {
        p2Score()
        refreshScore()
        if isWin(p1Count){
            println("Player2 Wins")
        }
    }
    @IBAction func p1Action(sender: AnyObject) {
        p1Score()
        refreshScore()
        if isWin(p2Count){
            println("Player1 Wins")
        }
    }
}

