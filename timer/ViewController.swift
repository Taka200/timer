//
//  ViewController.swift
//  timer
//
//  Created by 中川貴裕 on 2019/02/05.
//  Copyright © 2019 Taka200. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
}

