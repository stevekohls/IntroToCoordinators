//
//  BViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/5/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

protocol BViewControllerDelegate: AnyObject {
    func didSubmitSwitchValue(_ flipped: Bool, from fromViewController: UIViewController)
}

class BViewController: UIViewController {
    @IBOutlet weak var theSwitch: UISwitch!

    weak var delegate: BViewControllerDelegate?

    var flipped: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        theSwitch?.isOn = flipped
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        flipped = sender.isOn
    }

    @IBAction func didTapContinueButton(_ sender: Any) {
        delegate?.didSubmitSwitchValue(flipped, from: self)
    }
}
