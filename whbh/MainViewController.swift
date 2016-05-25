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
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startTimerPressed(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimerPressed(sender: AnyObject) {
        stopTimer(sender)
    }
    
    @IBAction func restartTimerPressed(sender: AnyObject) {
        resetTimer(sender)
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
        
        if minutes > 9 {
            timeLabel.stringValue =  "\(minutes):\(seconds)"
        }
        else {
            timeLabel.stringValue = ("0\(minutes):\(seconds)")
        }
    }
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
