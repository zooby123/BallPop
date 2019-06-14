//
//  MainMenuScene.swift
//  DissapearingBalls
//
//  Created by Zohaib Shahid on 12/06/2019.
//  Copyright © 2019 Zohaib khan. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "newbackground")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameTitle = SKLabelNode(fontNamed: "Pusab")
        gameTitle.text = "Zedes Presents:"
        gameTitle.fontSize = 50
        gameTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        gameTitle.zPosition = 1
        gameTitle.fontColor = SKColor.white
        self.addChild(gameTitle)
        
        let gameTitle2 = SKLabelNode(fontNamed: "Pusab")
        gameTitle2.text = "Popping Balls"
        gameTitle2.fontSize = 130
        gameTitle2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameTitle2.zPosition = 1
        gameTitle2.fontColor = SKColor.white
        self.addChild(gameTitle2)
        
        let howToPlay = SKLabelNode(fontNamed: "Pusab")
        howToPlay.text = "Pop the balls before they dissappear"
        howToPlay.fontSize = 50
        howToPlay.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        howToPlay.zPosition = 1
        howToPlay.fontColor = SKColor.white
        self.addChild(howToPlay)
        
        let pushPlay = SKLabelNode(fontNamed: "Pusab")
        pushPlay.text = "Play"
        pushPlay.fontSize = 150
        pushPlay.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
        pushPlay.zPosition = 1
        pushPlay.fontColor = SKColor.white
        pushPlay.name = "playButton"
        self.addChild(pushPlay)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let positionOfTouch = touch.location(in:self)
            let tappedNode = atPoint(positionOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "playButton"{
                self.run(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
                
            }
        }
    }
}
