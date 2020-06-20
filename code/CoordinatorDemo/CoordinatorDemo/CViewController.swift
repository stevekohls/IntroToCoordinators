//
//  CViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/5/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flippedLabel: UILabel!

    var name: String?
    var flipped: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        nameLabel?.text = name
        flippedLabel?.text = flipped ? "flipped" : "not flipped"
    }
}
