//
//  ViewController.swift
//  WorkTimer
//
//  Created by Vahid Sayad on 1/12/1396 .
//  Copyright © 1396 Vahid Sayad. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var appTimer: Timer!
    @IBOutlet weak var hour: NSTextField!
    @IBOutlet weak var minute: NSTextField!
    @IBOutlet weak var second: NSTextField!
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    
    @objc func runTimedCode() {
        seconds += 1
        
        if seconds >= 60 {
            self.minutes += 1
            self.seconds = 0
        }
        
        if minutes >= 60 {
            self.hours += 1
            self.minutes = 0
        }
        
        second.stringValue = "\(seconds) s"
        minute.stringValue = "\(minutes) m"
        hour.stringValue = "\(hours) h"
    }

    @IBAction func startTapped(_ sender: NSButton) {
        self.appTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        self.appTimer.fire()
    }
    
    
    @IBAction func pauseTapped(_ sender: NSButton) {
        self.appTimer.invalidate()
    }
    
    @IBAction func resetTapped(_ sender: NSButton) {
        showAlert()
    }
    
    private func showAlert() {
        let alert = NSAlert()
        alert.messageText = "Are you sure?"
        alert.informativeText = "If you reset the timer all the times will be reset."
        alert.alertStyle = .critical
        alert.addButton(withTitle: "Reset")
        alert.addButton(withTitle: "Cancel")
        let res = alert.runModal()
        if res == .alertFirstButtonReturn {
            resetTimer()
        }
    }
    
    private func resetTimer() {
        if appTimer != nil {
            self.appTimer.invalidate()
        }
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
    }
}

