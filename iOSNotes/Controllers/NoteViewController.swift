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
        print("Note Did load")
        titleField.text = currentTitle
        noteField.text = currentBody
        titleField.becomeFirstResponder()
        print("strt")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
        print("finish")
    }
    @objc func savePressed() {
        if let title = titleField.text, !title.isEmpty, !noteField.text.isEmpty {
            completion?(title, noteField.text)
        }
    }
}

