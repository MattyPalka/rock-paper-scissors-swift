//
//  File.swift
//  RockPaperScissors
//
//  Created by Mateusz Pałka on 13.07.2017.
//  Copyright © 2017 Mateusz Pałka. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSing() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
           return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func determineWinner(opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        switch self {
        case .paper:
            if opponentSign == .rock {
                return .win
            }
        case .rock:
            if opponentSign == .scissors{
                return .win
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            }
        }
        return .lost
    }

}

