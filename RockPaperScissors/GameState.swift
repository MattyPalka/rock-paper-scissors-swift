//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Mateusz Pałka on 13.07.2017.
//  Copyright © 2017 Mateusz Pałka. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lost, draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Win!"
        case .lost:
            return "You Lost"
        case .draw:
            return "It's a tie!"
        }
    }
}
