//
//  MainMenuScene.swift
//  MarvinGardenGamingFirstGame
//
//  Created by Zachary Marvin on 12/16/16.
//  Copyright © 2016 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MainMenuScene: SKScene{
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        if highScoreNumber == 0{
        chooseShip = 1
        defaults.set(chooseShip, forKey: "shipChosenSaved")
        }
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.size = self.size
        background.zPosition = -10
        self.addChild(background)
        
        let backdrop = SKSpriteNode(imageNamed: "backdrop")
        backdrop.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        backdrop.zPosition = -1
        backdrop.xScale = 1.07
        backdrop.yScale = 0.45
        self.addChild(backdrop)
        
        let gameBy = SKLabelNode(fontNamed: "spaceranger")
        gameBy.text = "Zachary Marvin's"
        gameBy.fontSize = 60
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.73)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "spaceranger")
        gameName1.text = "RocketMan"
        gameName1.fontSize = 133
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.67)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let startGame = SKLabelNode(fontNamed: "spaceranger")
        startGame.text = "Start Game"
        startGame.fontSize = 80
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint (x: self.size.width*0.5, y: self.size.height*0.375)
        startGame.zPosition = 1
        startGame.name = "StartButtonText"
        self.addChild(startGame)
        
        let startGameButton = SKSpriteNode(imageNamed: "blueButton")
        startGameButton.xScale = 0.68
        startGameButton.yScale = 0.3
        startGameButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.385)
        startGameButton.zPosition = 0
        startGameButton.name = "StartButton"
        self.addChild(startGameButton)
        
        let changeShip = SKLabelNode(fontNamed: "spaceranger")
        changeShip.text = "Change Ship"
        changeShip.fontSize = 80
        changeShip.fontColor = SKColor.white
        changeShip.position = CGPoint (x: self.size.width*0.5, y: self.size.height*0.275)
        changeShip.zPosition = 1
        changeShip.name = "ChangeShip"  //reference name to use outside of function
        self.addChild(changeShip)
        
        let changeShipButton = SKSpriteNode(imageNamed: "blueButton")
        changeShipButton.xScale = 0.68
        changeShipButton.yScale = 0.3
        changeShipButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.285)
        changeShipButton.zPosition = 0
        self.addChild(changeShipButton)
        
        let settingLabel = SKLabelNode(fontNamed: "spaceranger")
        settingLabel.text = "Settings"
        settingLabel.fontSize = 80
        settingLabel.fontColor = SKColor.white
        settingLabel.position = CGPoint (x: self.size.width*0.5, y: self.size.height*0.175)
        settingLabel.zPosition = 1
        settingLabel.name = "Settings"  //reference name to use outside of function
        self.addChild(settingLabel)
        
        let settingButton = SKSpriteNode(imageNamed: "blueButton")
        settingButton.xScale = 0.68
        settingButton.yScale = 0.3
        settingButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.185)
        settingButton.zPosition = 0
        self.addChild(settingButton)
        
        let topBorder = SKSpriteNode(imageNamed: "topBorder")
        topBorder.xScale = 0.68
        topBorder.yScale = 0.6
        topBorder.position = CGPoint(x: self.size.width/2, y: self.size.height*0.44)
        topBorder.zPosition = 0
        self.addChild(topBorder)
        
        let bottomBorder = SKSpriteNode(imageNamed: "bottomBorder")
        bottomBorder.xScale = 0.68
        bottomBorder.yScale = 0.6
        bottomBorder.position = CGPoint(x: self.size.width/2, y: self.size.height*0.13)
        bottomBorder.zPosition = 0
        self.addChild(bottomBorder)
        
        func spawnShootingStar(){
            
            let randomStart = CGPoint(x: Int(arc4random_uniform(1400)), y: 2500)
            let randomEnd = CGPoint(x: Int(arc4random_uniform(1400)), y: 0)
            
            let rand = Double(arc4random_uniform(50) + 10)
            
            let randFloat = rand*0.01
            
            let shootingStar = SKSpriteNode(imageNamed: "shootingStar")
            shootingStar.setScale(CGFloat(randFloat))
            shootingStar.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
            shootingStar.position = randomStart
            shootingStar.zPosition = -2
            self.addChild(shootingStar)
            
            let moveShootingStar = SKAction.move(to: randomEnd, duration: 1.0)  //Moves enemy
            let deleteShootingStar = SKAction.removeFromParent()  //Deletes enemy
            let shootingStarSequence = SKAction.sequence([moveShootingStar, deleteShootingStar])  //Enemy action sequence
        
            shootingStar.run(shootingStarSequence)
            
            
            let dx = randomEnd.x - randomStart.x
            let dy = randomEnd.y - randomStart.y
            let amountToRotate = atan2(dy, dx)
            shootingStar.zRotation = amountToRotate
            
            
        }
        
        let spawn = SKAction.run(spawnShootingStar)
        let waitToSpawn = SKAction.wait(forDuration: 5)  //references levelDuration for the spawn rate
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
        
        func spawnNewMoon(){
            
            let newMoonStart = CGPoint(x: 1700, y: 1720)
            let newMoonMid = CGPoint(x: 785, y: 1800)
            let newMoonEnd  = CGPoint(x: -200, y: 1720)
            
            
            let newMoon = SKSpriteNode(imageNamed: "newMoon")
            newMoon.setScale(0.18)
            newMoon.name = "newMoon"  //Reference name so enemy can be called upon outside of the function
            newMoon.position = newMoonStart
            newMoon.zPosition = -5
            self.addChild(newMoon)
            
            let moveNewMoon = SKAction.move(to: newMoonMid, duration: 15)  //Moves enemy
            let moveNewMoonAgain = SKAction.move(to: newMoonEnd, duration: 15)
            let deleteNewMoon = SKAction.removeFromParent()  //Deletes enemy
            let newMoonSequence = SKAction.sequence([moveNewMoon, moveNewMoonAgain, deleteNewMoon])
            
            newMoon.run(newMoonSequence)
        }
        
        let spawnMoon = SKAction.run(spawnNewMoon)
        let waitToSpawnMoon = SKAction.wait(forDuration: 32)
        let moonSequence = SKAction.sequence([spawnMoon, waitToSpawnMoon])
        let spawnMoonForever = SKAction.repeatForever(moonSequence)
        self.run(spawnMoonForever)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped.name == "StartButton"{  //references startButton and runs any code below if this is the node tapped
                
                let sceneToMoveTo = GameScene(size: self.size)
                nodeITapped.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)

            }
            
            if nodeITapped.name == "StartButtonText"{  //references startButton and runs any code below if this is the node tapped
                
                let sceneToMoveTo = GameScene(size: self.size)
                nodeITapped.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nodeITapped.name == "ChangeShip"{  //references startButton and runs any code below if this is the node tapped
                
                let sceneToMoveTo = ChangeShipScene(size: self.size)
                nodeITapped.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
        
    }
    
}
