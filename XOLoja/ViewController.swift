//
//  ViewController.swift
//  XOLoja
//
//  Created by Drin Krasniqi on 5/13/19.
//  Copyright © 2019 drini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelFituesi: UILabel!
    @IBOutlet weak var buttonRifillo: UIButton!
    //1 = lojtari X
    //2 = lojtari O
    var activePlayer:Int = 1
    var isGameActive:Bool = true
    var gameState:[Int] = [0,0,0,0,0,0,0,0,0]
    var winningCombinations:[[Int]] = [ [0,1,2], [3,4,5], [6,7,8], [1,4,7], [2,5,8], [0,4,8], [2,4,6], [0,3,6] ]
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        //labelFituesi.isHidden = true
        //buttonRifillo.isHidden = true
        
        for var butoni in 1...9{
            let buttonView:UIButton = view.viewWithTag(butoni) as! UIButton
            buttonView.setImage(nil, for: .normal)
        
        }
        isGameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
    }

    @IBAction func rifillo(_ sender: Any) {
        for var butoni in 1...9{
            let buttonView:UIButton = view.viewWithTag(butoni) as! UIButton
            buttonView.setImage(nil, for: .normal)
            
        }
        isGameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
    
    }
    
    
    @IBAction func playGame(_ sender: UIButton) {
        
        if (gameState[sender.tag - 1] == 0 && isGameActive){
            var xImage:UIImage? = nil
            gameState[sender.tag - 1] = activePlayer
            if (activePlayer == 1){
                xImage = UIImage.init(named: "x")
                activePlayer = 2
            }else{
                xImage = UIImage.init(named: "o")
                activePlayer = 1
            }
            sender.setImage(xImage, for: .normal)
            
            for var combination in winningCombinations{
                
                if(gameState[combination[0]] != 0 && gameState[combination[1]] == gameState[combination[0]] && gameState[combination[2]] == gameState[combination[1]] ){
                   
                    //labelFituesi.isHidden = false
                    //buttonRifillo.isHidden = false
                    
                    if(gameState[combination[0]] == 1){
                        labelFituesi.text = "fitues eshte X"
                    }else{
                        labelFituesi.text = "fituesi eshte O"
                    }
                    print("kemi fitues - \(gameState[combination[0]] )")
                } else{
                
                    if(!gameState.contains(0)){
                        
                        labelFituesi.text = "nuk ka fitues"
                        labelFituesi.isHidden = false
                        //buttonRifillo.isHidden = false
                    
                        
                    }
    
               
                
                }

            }
        }
    }
}

