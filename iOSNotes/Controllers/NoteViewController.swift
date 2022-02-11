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
    public var isNew = true
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = currentTitle
        noteField.text = currentBody
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
    }
    @objc func savePressed() {
        if let title = titleField.text, !title.isEmpty, !noteField.text.isEmpty {
            completion?(title, noteField.text)
        }
    }
}

