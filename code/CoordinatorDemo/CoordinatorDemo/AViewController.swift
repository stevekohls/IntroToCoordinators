//
//  AViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/5/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!

    var name: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        nameTextField?.text = name
    }

    @IBAction func didTapContinueButton(_ sender: Any) {
        nameTextField.resignFirstResponder()

        guard let bViewController = storyboard?.instantiateViewController(identifier: "BViewController") as? BViewController else { return }
        bViewController.name = name

        navigationController?.pushViewController(bViewController, animated: true)
    }
}

extension AViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        name = textField.text
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
