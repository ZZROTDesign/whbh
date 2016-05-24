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
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        //let icon = NSImage(named: "menuIcon")
        if let button = statusItem.button {
            button.image = NSImage(named: "menuIcon")
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        popover.contentViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
        /*
        // Menu options -- pre popover
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Start timer", action: #selector(AppDelegate.showMenu(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit WHBH", action: #selector(NSTask.terminate), keyEquivalent: "q"))
        statusItem.menu = menu
        */
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

