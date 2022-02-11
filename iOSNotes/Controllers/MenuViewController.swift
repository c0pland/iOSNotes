//
//  ViewController.swift
//  iOSNotes
//
//  Created by Богдан Беннер on 09.02.2022.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    @IBOutlet weak var label: UILabel!
    
    var models: [(noteTitle: String, noteBody: String)] = [("Title", "Note")]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Consts.appTitle
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func newNotePressed() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Consts.noteVCIdentifier) as? NoteViewController else {
            return
        }
        vc.title = "Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {noteTitle, noteBody in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((noteTitle, noteBody))
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Consts.cellIdentifier, for: indexPath)
        cell.textLabel?.text = models[indexPath.row].noteTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Consts.noteVCIdentifier) as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        print("IndexPathRow is \(indexPath.row)")
        vc.currentTitle = models[indexPath.row].noteTitle //set the title
        vc.currentBody = models[indexPath.row].noteBody //set the body
        navigationController?.pushViewController(vc, animated: true)
    }
}

