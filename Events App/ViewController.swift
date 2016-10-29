//
//  ViewController.swift
//  Events App
//
//  Created by Daniel Stagnaro on 10/29/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var importantCheckbox: NSButton!
    
    private var numb: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addClicked(_ sender: Any) {
        print("Hello \(numb)")
        numb += 1
        
        if textField.stringValue != "" {
            if let context = (NSApplication.shared().delegate as? AppDelegate)?.managedObjectContext {
                
                let eventItem = EventItem(context: context)
                eventItem.name = textField.stringValue
                
                if importantCheckbox.state == 1 {
                    eventItem.important = true
                } else {
                    eventItem.important = false
                }
                
                (NSApplication.shared().delegate as? AppDelegate)?.saveAction(nil)
                
                textField.stringValue = ""
                importantCheckbox.state = 0
                
            }
        } else {
//            There was nothing entered and button was akwardly pressed
//            Do nothing
        }
    }


}

