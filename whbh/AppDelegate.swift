//
//  AppDelegate.swift
//  whbh
//
//  Created by Killian M Brackey on 5/24/16.
//  Copyright © 2016 ZZROT Design. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timer = NSTimer()
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        //let icon = NSImage(named: "menuIcon")
        if let button = statusItem.button {
            button.image = NSImage(named: "menuIcon")
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        popover.contentViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
    }
    
    func showMenu(sender: AnyObject) {
        let text = "Testing console output"
        print("\(text)")
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        }
        else {
            showPopover(sender)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    
    @IBAction func menuClicked(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
        
        
    }
    
}

