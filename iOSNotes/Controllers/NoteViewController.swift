//
//  NoteViewController.swift
//  iOSNotes
//
//  Created by Богдан Беннер on 09.02.2022.
//

import Foundation
import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var currentTitle = ""
    public var currentBody = ""
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true) //hide the back button, so that the note is always saved
        titleField.text = currentTitle //set the title and the body for the existing note
        noteField.text = currentBody // if the note has just been created, it will be empty
        titleField.becomeFirstResponder() //toggle keyboard to the title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed)) //save button
    }
    @objc func savePressed() {
        if let title = titleField.text, !title.isEmpty, !noteField.text.isEmpty { // note MUST have the title and the body
            completion?(title, noteField.text) // toggle root VC and save the note
        }
    }
}

