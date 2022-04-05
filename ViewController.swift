//
//  ViewController.swift
//  Timerapp
//
//  Created by Tilek on 15/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    
    
    @IBOutlet weak var startStopbtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var TimerLabe: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopbtn.setTitleColor(UIColor.green, for: .normal)
        
    }
    @IBAction func stopStartbtn(_ sender: Any) {
        
        if (timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopbtn.setTitle("START", for: .normal)
            startStopbtn.setTitleColor(UIColor.white, for: .normal)

            
        }
        else{
            timerCounting = true
            startStopbtn.setTitle("STOP", for: .normal)
            startStopbtn.setTitleColor(UIColor.yellow, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)


        }
    }
    
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = secondsToHoursMinutesSecond(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabe.text = timeString

    }
    
    func secondsToHoursMinutesSecond(seconds: Int) -> (Int,Int,Int){
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)

        return timeString
        
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: { (_) in
            //do nothing
        }))
            alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                
                self.count = 0
                self.TimerLabe.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
                self.startStopbtn.setTitle("START", for: .normal)
                self.startStopbtn.setTitleColor(UIColor.green, for: .normal)
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

