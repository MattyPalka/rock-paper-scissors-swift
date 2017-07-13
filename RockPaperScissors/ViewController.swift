//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Mateusz Pałka on 13.07.2017.
//  Copyright © 2017 Mateusz Pałka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        update(forGameState: .start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameState: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!

    @IBAction func rockChosen(_ sender: Any) {
        playGame(.rock)
    }

    @IBAction func paperChosen(_ sender: Any) {
        playGame(.paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        playGame(.scissors)
    }
    
    @IBAction func playAgainChosen(_ sender: Any) {
        update(forGameState: .start)
    }

    func update (forGameState gameStat: GameState){
        
        gameState.text = gameStat.status
        
        switch gameStat {
        case .start:
            view.backgroundColor = UIColor.lightGray
            appSign.text = "🤖"
            
            rock.isEnabled = true
            rock.isHidden = false
            
            paper.isEnabled = true
            paper.isHidden = false
            
            scissors.isEnabled = true
            scissors.isHidden = false
            
            playAgain.isHidden = true
            
        case .win:
            view.backgroundColor = UIColor.green
        case .lost:
            view.backgroundColor = UIColor.red
        case .draw:
            view.backgroundColor = UIColor.darkGray
        }
    }
    
    func playGame (_ playerSign: Sign){
        let computerSign = randomSing()
        let GameState = playerSign.determineWinner(opponentSign: computerSign)
        update(forGameState: GameState)
        
        appSign.text = computerSign.emoji
        
        rock.isEnabled = false
        rock.isHidden = true
        
        paper.isEnabled = false
        paper.isHidden = true
        
        scissors.isEnabled = false
        scissors.isHidden = true
        
        switch playerSign {
        case .paper:
            paper.isHidden = false
        case .rock:
            rock.isHidden = false
        case .scissors:
            scissors.isHidden = false
        }
        
        playAgain.isHidden = false
        
    }
    
    
}

