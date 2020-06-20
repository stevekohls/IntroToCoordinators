//
//  AViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/5/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

protocol AViewControllerDelegate: AnyObject {
    func didSubmitName(_ name: String?, from fromViewController: UIViewController)
}

class AViewController: CoordinatedViewController {
    @IBOutlet weak var nameTextField: UITextField!

    weak var delegate: AViewControllerDelegate?

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

        delegate?.didSubmitName(name, from: self)
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
