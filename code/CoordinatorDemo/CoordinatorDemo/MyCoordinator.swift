//
//  MyCoordinator.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/6/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

class MyCoordinator: Coordinator {
    var name: String?
    var flipped: Bool = false

    private lazy var storyboard: UIStoryboard = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
    }()

    lazy var initialViewController: UIViewController = {
        guard let aViewController = storyboard.instantiateViewController(identifier: "AViewController") as? AViewController else {
            fatalError("Could not instantiate AViewController from storyboard")
        }

        aViewController.delegate = self
        aViewController.coordinatedDelegate = self

        return aViewController
    }()
}

extension MyCoordinator: AViewControllerDelegate {
    func didSubmitName(_ name: String?, from fromViewController: UIViewController) {
        self.name = name

        fromViewController.performSegue(withIdentifier: "AtoB", sender: self)
    }
}

extension MyCoordinator: BViewControllerDelegate {
    func didSubmitSwitchValue(_ flipped: Bool, from fromViewController: UIViewController) {
        self.flipped = flipped

        fromViewController.performSegue(withIdentifier: "BtoC", sender: self)
    }
}

extension MyCoordinator: CoordinatedViewControllerDelegate {
    func handlePrepareForSegue(_ segue: UIStoryboardSegue, from fromViewController: UIViewController) {
        if segue.identifier == "AtoB",
            let bViewController = segue.destination as? BViewController {

            bViewController.delegate = self
            bViewController.coordinatedDelegate = self
        }
        else if segue.identifier == "BtoC",
            let cViewController = segue.destination as? CViewController {

            cViewController.name = name
            cViewController.flipped = flipped
        }
    }
}
