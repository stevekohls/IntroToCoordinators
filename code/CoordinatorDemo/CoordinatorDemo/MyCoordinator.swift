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
}

extension MyCoordinator: AViewControllerDelegate {
    func didSubmitName(_ name: String?, from fromViewController: UIViewController) {
        self.name = name

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let bViewController = storyboard.instantiateViewController(identifier: "BViewController") as? BViewController else { return }

        bViewController.delegate = self

        let navigationController = fromViewController.navigationController
        navigationController?.pushViewController(bViewController, animated: true)
    }
}

extension MyCoordinator: BViewControllerDelegate {
    func didSubmitSwitchValue(_ flipped: Bool, from fromViewController: UIViewController) {
        self.flipped = flipped

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let cViewController = storyboard.instantiateViewController(identifier: "CViewController") as? CViewController else { return }

        cViewController.name = name
        cViewController.flipped = flipped

        let navigationController = fromViewController.navigationController
        navigationController?.pushViewController(cViewController, animated: true)
    }
}