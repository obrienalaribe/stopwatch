//
//  ViewController.swift
//  Stopwatch
//
//  Copyright © 2016 Pam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var hours = 0
    var minutes = 0
    var seconds = 0

    var timer = Timer()

    @IBOutlet weak var timerLabel: UILabel!

    @IBAction func startStopWatch(_ sender: AnyObject) {
       startTimer()
    }

    @IBAction func pause(_ sender: AnyObject) {
        pauseTimer()
    }

    @IBAction func resetStopWatch(_ sender: AnyObject) {
        timer.invalidate()
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
        self.timerLabel.text = "\(formatTime(timeUnit: self.hours)) : \(formatTime(timeUnit: self.minutes)) : \(formatTime(timeUnit: self.seconds))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let startGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.startTimer))
        startGesture.numberOfTapsRequired = 2

         let pauseGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.pauseTimer))


        self.timerLabel.isUserInteractionEnabled = true
        self.timerLabel.addGestureRecognizer(startGesture)
        self.timerLabel.addGestureRecognizer(pauseGesture)

    }


    func startTimer(){
         timer = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector : #selector(ViewController.calculateTime), userInfo: nil, repeats: true)
    }

    func pauseTimer(){
        timer.invalidate()
    }

    func calculateTime(timer: Timer){
        self.timerLabel.text = "\(formatTime(timeUnit: self.hours)) : \(formatTime(timeUnit: self.minutes)) : \(formatTime(timeUnit: self.seconds))"

        self.seconds += 1
        if self.seconds == 60 {
            self.minutes += 1
            self.seconds = 0
        }
        if self.minutes == 60 {
            if self.hours == 23 {
                self.hours = 0
            }else{
                self.hours += 1
            }
            self.minutes = 0
        }

    }


    func formatTime(timeUnit: Int) -> String{
        if timeUnit < 10 {
            return "0\(timeUnit)"
        }else{
            return "\(timeUnit)"
        }
    }

}
