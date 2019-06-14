//
//  GameScene.swift
//  DissapearingBalls
//
//  Created by Zohaib Shahid on 12/06/2019.
//  Copyright © 2019 Zohaib khan. All rights reserved.
//

import SpriteKit
import GameplayKit
var scoreNumber = 0
let clickSound = SKAction.playSoundFileNamed("Click2.wav", waitForCompletion: false)
class GameScene: SKScene {
//    Game area, Text & Sounds
    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    let ballPop = SKAction.playSoundFileNamed("1339.wav", waitForCompletion: false)
    let playWhistle = SKAction.playSoundFileNamed("whistle.wav", waitForCompletion: false)
    let gameArea: CGRect
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect (x: gameAreaMargin , y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func random() -> CGFloat {
         return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
        
    }
//    Background, Score label & Ball position
    override func didMove(to view: SKView) {
        scoreNumber = 0
        let background = SKSpriteNode(imageNamed: "newbackground")
//        background.color = SKColor.gray
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let ball = SKSpriteNode(imageNamed: "512-1")
        ball.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        ball.zPosition = 2
        ball.name = "ballObject"
        self.addChild(ball)
        
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition =  1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/10)
        self.addChild(scoreLabel)
        
    }
//    Spawn ball in random position, ball tap noise,
    func spawnNewBall() {
    var randomImageNumber = arc4random()%5
        randomImageNumber += 1
    let ball = SKSpriteNode(imageNamed: "512-\(randomImageNumber)")
        ball.zPosition = 2
        ball.name = "ballObject"
        let randomX = random(min: gameArea.minX + ball.size.width/2,
                             max: gameArea.maxX - ball.size.width/2)
        let randomY = random(min: gameArea.minY + ball.size.height/2,
                             max: gameArea.maxY - ball.size.height/2)
        ball.position = CGPoint(x: randomX, y: randomY)
        self.addChild(ball)
        
        ball.run(SKAction.sequence([
            SKAction.scale(by: 0, duration: 3),
            playWhistle,
            SKAction.run(gameOver)]))
        
    }
//    Gameover
    func gameOver(){
    
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
//    Touch & Level up
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let positionOfTouch = touch.location(in:self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "ballObject" {
//               tappedNode.removeFromParent()
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.1),SKAction.removeFromParent()]))
                self.run(ballPop)
                spawnNewBall()
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
            
                if scoreNumber == 7 || scoreNumber == 20 || scoreNumber == 40 || scoreNumber == 65 || scoreNumber == 80 || scoreNumber == 95  || scoreNumber == 110 {
                    spawnNewBall()
                    
                }
                
            }
            
        }
        
    }
    
}
