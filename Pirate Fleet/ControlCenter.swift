//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}
struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let smallShip1 = Ship (length: 2, location: GridLocation(x:0,y:0), isVertical: false)
        human.addShipToGrid(smallShip1)
        let mediumShip1 = Ship (length: 3, location: GridLocation(x:7,y:1), isVertical: true)
        human.addShipToGrid(mediumShip1)
        let mediumShip2 = Ship (length: 3, location: GridLocation(x:0,y:2), isVertical: false)
        human.addShipToGrid(mediumShip2)
        let largeShip1 = Ship (length: 4, location: GridLocation(x:0,y:6), isVertical: false)
        human.addShipToGrid(largeShip1)
        let extralargeShip1 = Ship (length: 5, location: GridLocation(x:5,y:3), isVertical: true)
        human.addShipToGrid(extralargeShip1)
        let landMine1 = Mine (location: GridLocation(x:4,y:2), explosionText: "Boom")
        human.addMineToGrid(landMine1)
        let landMine2 = Mine (location: GridLocation(x:2,y:5), explosionText: "Say Hello to the Fishes")
        human.addMineToGrid(landMine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        let humanShipsRemainng = 5 - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemainng * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        print("the value of final score is \(finalScore)")
        
        return finalScore
        
    }
}