//
//  ViewController.swift
//  DIY Workout Timer
//
//  Created by 윤진영 on 6/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countSeconds: UILabel!
    @IBOutlet weak var commentShow: UILabel!
    
    
    let exerciseTime = ["Deadlift" : 5, "Plank" : 10, "Stepmill" : 15]
    var counter = 0
    var totalTime = 0
    var timer = Timer()
    var isPaused = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let currentButton = sender.currentTitle!
        totalTime = exerciseTime[currentButton]!
        counter = 0
        //1. Timer goes when clicked
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func PausePressed(_ sender: UIButton) {
        //멈춰있을 때 누르면, 다시 작동시키고
        if isPaused {
            isPaused = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        } else {
            //작동 중에 누르면 멈춘다
            isPaused = true
            timer.invalidate()
        }
    }
    
    //0으로 시계를 돌려놓는다
    @IBAction func StopPressed(_ sender: UIButton) {
        counter = 0
        timer.invalidate()
        countSeconds.text = "\(counter)"
        commentShow.text = "Stopped"
    }
    
    
    @objc func timerAction() {
        //시간 범위 내에 있으면 계속 작동한다
        if counter < totalTime {
            counter += 1
            countSeconds.text = "\(counter)"
            commentShow.text = "You Can Do It!"
        } else {
            timer.invalidate()
            commentShow.text = "Well Done!"
        }
    }
}


