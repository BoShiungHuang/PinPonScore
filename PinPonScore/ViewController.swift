//
//  ViewController.swift
//  PinPonScore
//
//  Created by Bo-Shiung Huang on 2022/12/6.
//

import UIKit

class ViewController: UIViewController {
    
    var aBest: Int = 0
    
    var bBest: Int = 0
    
    var aScore: Int = 0
    
    var bScore: Int = 0
    
    var tempBest: Int = 0
    
    var tempScore: Int = 0
    
    var serveIndex: Int = 2 //開啟app預設左側先serve設2 右設4
    
    
    //Labels
    
    @IBOutlet weak var aBestLabel: UILabel!
    
    @IBOutlet weak var bBestLabel: UILabel!
    
    @IBOutlet weak var aScoreLabel: UILabel!
    
    @IBOutlet weak var bScoreLabel: UILabel!
    
    //Buttons
    
    @IBOutlet weak var aBestBtn: UIButton!
    
    @IBOutlet weak var bBestBtn: UIButton!
    
    @IBOutlet weak var aScoreBtn: UIButton!
    
    @IBOutlet weak var bScoreBtn: UIButton!
    
    
    @IBOutlet weak var rewindBtn: UIButton!
    
    @IBOutlet weak var changeSideBtn: UIButton!
    
    @IBOutlet weak var ResetBtn: UIButton!
    
    @IBOutlet weak var aServeLabel: UILabel!
    
    @IBOutlet weak var bServeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whoServe()
        // Do any additional setup after loading the view.
    }
    
    
    func resetBest() {
        aBest=0
        bBest=0
        aBestLabel.text = "\(aBest)"
        bBestLabel.text = "\(bBest)"
        
    }
    
    func resetScore() {
        aScore=0
        bScore=0
        aScoreLabel.text = "\(aScore)"
        bScoreLabel.text = "\(bScore)"
    }
    
    func changeSide() {
        tempBest = bBest
        bBest = aBest
        aBest = tempBest
        tempScore = bScore
        bScore = aScore
        aScore = tempScore
        aBestLabel.text = "\(aBest)"
        bBestLabel.text = "\(bBest)"
        aScoreLabel.text = "\(aScore)"
        bScoreLabel.text = "\(bScore)"
        
        serveIndex += 2
        whoServe()
    }
    
    func whoServe() {
        if aScore >= 10 && bScore >= 10 {             //duece ?
            if serveIndex % 2 == 0 {
                aServeLabel.isHidden = true
                bServeLabel.isHidden = false
            }else {
                aServeLabel.isHidden = false
                bServeLabel.isHidden = true
            }
                
        } else {

            if serveIndex % 4 <= 1 {
                aServeLabel.isHidden = true
                bServeLabel.isHidden = false
            }else {
                aServeLabel.isHidden = false
                bServeLabel.isHidden = true
            }
        }
    }
    
    func endAlarm() {
        let controller = UIAlertController(title: "鹿死誰手", message: "勝負已分", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.resetScore()
        }
        controller.addAction(okAction)
        present(controller, animated: true)
    }
    

    
    
    @IBAction func pressaBest(_ sender: UIButton) {
        aBest = aBest + 1
        aBestLabel.text = "\(aBest)"
    }
    
    @IBAction func pressbBest(_ sender: UIButton) {
        bBest += 1
        bBestLabel.text = "\(bBest)"
    }
    
    @IBAction func pressaScore(_ sender: UIButton) {
        serveIndex += 1
        whoServe()
        if aScore >= 10 && bScore >= 10 {
            aScore += 1
            aScoreLabel.text = "\(aScore)"
            if abs(aScore - bScore) == 2 {
                endAlarm()
            }
        } else {
            
            if aScore < 11 {
                aScore += 1
                aScoreLabel.text = "\(aScore)"
            }
            if aScore == 11 {
                aBest += 1
                aBestLabel.text = "\(aBest)"
                endAlarm()
            }
        }
    }
        
    @IBAction func pressbScore(_ sender: UIButton) {
        serveIndex += 1
        whoServe()
        if aScore >= 10 && bScore >= 10 {
            bScore += 1
            bScoreLabel.text = "\(bScore)"
            if abs(aScore - bScore) == 2 {
                endAlarm()
            }
        } else {
            
            if bScore < 11 {
                bScore += 1
                bScoreLabel.text = "\(bScore)"
            }
            if bScore == 11 {
                bBest += 1
                bBestLabel.text = "\(bBest)"
                endAlarm()
            }
        }
    }
        
    @IBAction func pressRewind(_ sender: Any) {
        self.undoManager?.undo()
            //self.enableDisbaleActionsButtons()
          }
    
    
    @IBAction func pressChange(_ sender: Any) {
        changeSide()
    }
    
    @IBAction func pressReset(_ sender: Any) {
        resetBest()
        resetScore()
    }
        
}

