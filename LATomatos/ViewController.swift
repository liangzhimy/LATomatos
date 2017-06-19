//
//  ViewController.swift
//  LATomatos
//
//  Created by liangzhimy on 17/6/13.
//  Copyright © 2017年 LA. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var statusBar : NSStatusItem?
    var timer : Timer?
    @IBOutlet var statusMenu: NSMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.statusBar = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
//        self.statusBar?.button?.image = NSImage.init(named: "stausIcon");
//        self.statusBar?.button?.title = "25:00"
//        self.statusBar?.button?.imagePosition = NSCellImagePosition.imageRight
//        self.statusBar?.highlightMode = true
//        self.statusBar?.menu = statusMenu;
//        self.timer = Timer.init(timeInterval: 1, target: self, selector: #selector(didTime), userInfo: nil, repeats: true)
//        self.timer?.fire();
    }
    
    func didTime() -> Void {
        print("didTime ")
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

