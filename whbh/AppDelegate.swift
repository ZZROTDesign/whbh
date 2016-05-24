//
//  AppDelegate.swift
//  whbh
//
//  Created by Sean Kilgarriff on 5/24/16.
//  Copyright © 2016 ZZROT. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theLabel: NSTextField!
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timer = NSTimer()
    
    
    
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

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
       
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
}

