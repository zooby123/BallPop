//
//  GameOverScene.swift
//  DissapearingBalls
//
//  Created by Zohaib Shahid on 12/06/2019.
//  Copyright © 2019 Zohaib khan. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "newbackground")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Pusab")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 140
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOverLabel.zPosition = 1
        gameOverLabel.fontColor = SKColor.white
        self.addChild(gameOverLabel)
        let finalScoreLabel = SKLabelNode(fontNamed: "Pusab")
        
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 90
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        finalScoreLabel.zPosition = 1
        finalScoreLabel.fontColor = SKColor.white
        self.addChild(finalScoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if  scoreNumber > highScoreNumber {
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
            
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "Highest Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 110
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        highScoreLabel.zPosition = 1
        highScoreLabel.fontColor = SKColor.white
        self.addChild(highScoreLabel)
        
        let restartLabel = SKLabelNode(fontNamed: "Pusab")
        restartLabel.text = "Restart"
        restartLabel.fontSize = 80
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        restartLabel.zPosition = 1
        restartLabel.fontColor = SKColor.white
        restartLabel.name = "restartButton"
        self.addChild(restartLabel)
        
        let exitLabel = SKLabelNode(fontNamed: "Pusab")
        exitLabel.text = "Exit"
        exitLabel.fontSize = 80
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.1)
        exitLabel.zPosition = 1
        exitLabel.fontColor = SKColor.white
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let positionOfTouch = touch.location(in:self)
            let tappedNode = atPoint(positionOfTouch)
            let tappedNodeName = tappedNode.name
        
            if tappedNodeName == "restartButton"{
                self.run(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
                
            }
            
            if tappedNodeName == "exitButton"{
                self.run(clickSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            
            }
        
    }
    
    
    }

}
