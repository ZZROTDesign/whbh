//
//  MainViewController.swift
//  whbh
//
//  Created by Killian M Brackey on 5/24/16.
//  Copyright © 2016 ZZROT Design. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var timeLabel: NSTextField!
    @IBOutlet weak var startTimerButton: NSButton!
    @IBOutlet weak var stopTimerButton: NSButton!
    @IBOutlet weak var restartTimerButton: NSButton!
    @IBOutlet weak var quitButton: NSButton!
    @IBOutlet weak var breakTimeBox: NSTextField!
    @IBOutlet weak var WorkTimeBox: NSTextField!
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timer = NSTimer()
    var timerRunning = false
    
    var WORK_TIME = 25 //minutes
    var BREAK_TIME = 1 //minutes
    var onBreak = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTimerPressed(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimerPressed(sender: AnyObject?) {
        stopTimer(self)
    }
    
    @IBAction func restartTimerPressed(sender: AnyObject?) {
        resetTimer(self)
    }
    
    func startBreak(sender: AnyObject?) {
        resetTimer(self)
        startTimer(self)
    }
    
    func startTimer(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func resetTimer(sender: AnyObject) {
        timer.invalidate()
        
        //Reset timers
        seconds = 0
        minutes = 0
        hours = 0
        
        //timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timeLabel.stringValue = ""
    }
    
    func stopTimer(sender: AnyObject) {
        timer.invalidate()
    }
    
    func timerAction() {
        seconds += 1
        
        if seconds > 59 {
            minutes += 1
            seconds = 0
        }
        
        if onBreak == false && minutes == WORK_TIME {
            onBreak = true
            timeLabel.stringValue = "ON BREAK!"
            print("On break") //console logging
            startBreak(self)
            
        }
        if onBreak == true && minutes == BREAK_TIME {
            onBreak = false
            resetTimer(self)
            startTimer(self)
        }
        if minutes > 9 {
            if seconds < 10 {
                timeLabel.stringValue = "\(minutes):0\(seconds)"
            } else {
            timeLabel.stringValue =  "\(minutes):\(seconds)"
            }
        }
        else {
            if seconds < 10 {
                timeLabel.stringValue = "\(minutes):0\(seconds)"
            } else {
            timeLabel.stringValue = ("0\(minutes):\(seconds)")
            }
        }
        
    }
    
    //Break and work time setters
    @IBAction func subtractBreak(sender: AnyObject) {
        if BREAK_TIME > 0 {
            BREAK_TIME -= 1
        }
        breakTimeBox.stringValue = "\(BREAK_TIME)"
    }
    
    @IBAction func addBreak(sender: AnyObject) {
        BREAK_TIME += 1
        breakTimeBox.stringValue = "\(BREAK_TIME)"
    }
    
    @IBAction func subtractWork(sender: AnyObject) {
        if WORK_TIME > 0 {
            WORK_TIME -= 1
        }
        WorkTimeBox.stringValue = "\(WORK_TIME)"
    }
    
    @IBAction func addWork(sender: AnyObject) {
        WORK_TIME += 1
        WorkTimeBox.stringValue = "\(WORK_TIME)"
    }

    
    
    // Quit on button press
    @IBAction func quitButtonClicked(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
    
}

/*
 override func awakeFromNib() {
 
 //Add statusBarItem
 statusBarItem = statusBar.statusItemWithLength(-1)
 statusBarItem.title = "0\(minutes):\(seconds)"
 
 menu.addItem(NSMenuItem(title: "Start Timer", action: #selector(AppDelegate.startTimer(_:)), keyEquivalent: ""))
 menu.addItem(NSMenuItem(title: "Reset Timer", action: #selector(AppDelegate.resetTimer(_:)), keyEquivalent: ""))
 menu.addItem(NSMenuItem(title: "Stop Timer", action: #selector(AppDelegate.stopTimer(_:)), keyEquivalent: ""))
 
 
 statusBarItem.menu = menu
 
 
 
 }
 
 func startTimer(sender: AnyObject) {
 timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
 }
 
 func resetTimer(sender: AnyObject) {
 timer.invalidate()
 
 //Reset timers
 seconds = 0
 minutes = 0
 hours = 0
 
 timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
 }
 
 func stopTimer(sender: AnyObject) {
 timer.invalidate()
 }
 
 func timerAction() {
 seconds += 1
 
 if seconds > 59 {
 minutes += 1
 seconds = 0
 }
 
 if minutes > 9 {
 statusBarItem.title = "\(minutes):\(seconds)"
 }
 else {
 statusBarItem.title = "0\(minutes):\(seconds)"
 }
 
 
 }
*/
