//
//  ChangeShipColorScene.swift
//  AstroMan
//
//  Created by Zachary Marvin on 1/3/17.
//  Copyright © 2017 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ChangeShipColorScene: SKScene{
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let mainMenuLabel = SKLabelNode(fontNamed: "spaceranger")
    
    override func didMove(to view: SKView) {
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 90
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.08)
        mainMenuLabel.zPosition = 1
        self.addChild(mainMenuLabel)
        
        let mainMenuButton = SKSpriteNode(imageNamed: "blueButton")
        mainMenuButton.xScale = 1.07
        mainMenuButton.yScale = 0.4
        mainMenuButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.09)
        mainMenuButton.zPosition = 0
        self.addChild(mainMenuButton)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.size = self.size
        background.zPosition = -10
        self.addChild(background)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {  //All this is information is used to restart the game
        
        for touch: AnyObject in touches{  //This areas pulls all information for where we touched
            
            
            let pointOfTouch = touch.location(in: self)  //Take the coordinates of where we touched and set this to point of touch
            
            if mainMenuLabel.contains(pointOfTouch){
                let sceneToMoveTo = MainMenuScene(size: self.size)
                mainMenuLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
    
}
