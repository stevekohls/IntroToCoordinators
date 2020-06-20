//
//  BViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/5/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    @IBOutlet weak var theSwitch: UISwitch!

    var name: String?
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
        guard let cViewController = storyboard?.instantiateViewController(identifier: "CViewController") as? CViewController else { return }
        cViewController.name = name
        cViewController.flipped = flipped
        navigationController?.pushViewController(cViewController, animated: true)
    }
}
