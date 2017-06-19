//
//  AppDelegate.swift
//  LATomatos
//
//  Created by liangzhimy on 17/6/13.
//  Copyright © 2017年 LA. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBar : NSStatusItem?
    var timer : Timer?
    var timeInterval : TimeInterval = 60 * 25.0
    var isPause : Bool = false
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var startPauseMenuItem: NSMenuItem!
    @IBOutlet weak var settingMenuItem: NSMenuItem!
    @IBOutlet weak var quitMenuItem: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared().windows.last!.close()

        self.statusBar = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        self.statusBar?.button?.image = NSImage.init(named: "stausIcon");
        self.statusBar?.button?.imagePosition = NSCellImagePosition.imageRight
        self.statusBar?.highlightMode = true
//        self.statusBar?.button?.title = "25:00"
        self.statusBar?.menu = statusMenu
//        self.__startTime()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    func __startTime() {
        if (self.timer == nil) {
            self.timer?.invalidate()
            self.timer = nil
        }
        
        self.__didTime();
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(__didTime), userInfo: nil, repeats: true)
    } 
    
    func __showTime() {
        let minutes = Int(self.timeInterval / 60)
        let seconds = (Int(self.timeInterval)) % 60
        self.statusBar?.button?.title = "\(minutes):\(seconds)"
    } 
    
    func __didTime() {
        if (!isPause) {
            self.timeInterval = self.timeInterval - 1
        }
        
        if (self.timeInterval < 1) {
            self.timer?.invalidate()
        }
        
        self.__showTime()
    }
    
    func __pauseTime() {
    }
    
    @IBAction func startPauseMenuItemPressed(_ sender: Any) {
        if self.startPauseMenuItem.title == "Start" {
            self.startPauseMenuItem.title = "Pause"
            self.isPause = false
            self.__showTime()
            self.__startTime()           
        } else if self.startPauseMenuItem.title == "Pause" {
            self.isPause = true
        } 
    }
    
    @IBAction func settingMenuItemPressed(_ sender: Any) {
        NSApplication.shared().windows.last!.makeKeyAndOrderFront(nil)
        NSApplication.shared().activate(ignoringOtherApps: true)
            .activateIgnoringOtherApps(true)
        let mainStoryboard = NSStoryboard(name: "Main", bundle: nil)
        if let viewController = mainStoryboard.instantiateController(withIdentifier: "LAAlertViewController") as? NSViewController {

            viewController
        } 
//            let windowController = NSWindowController(window: NSApplication.shared().windows.first)
////            viewController.show
//            
//        } 
    }
    
    @IBAction func quitMenuItemPressed(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
}

