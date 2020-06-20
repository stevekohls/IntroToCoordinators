//
//  MyCoordinatedViewController.swift
//  CoordinatorDemo
//
//  Created by Steve Kohls on 5/7/20.
//  Copyright © 2020 Steve Kohls. All rights reserved.
//

import UIKit

protocol CoordinatedViewControllerDelegate: AnyObject {
    func handlePrepareForSegue(_ segue: UIStoryboardSegue, from fromViewController: UIViewController)
}

class CoordinatedViewController: UIViewController {
    weak var coordinatedDelegate: CoordinatedViewControllerDelegate?

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        coordinatedDelegate?.handlePrepareForSegue(segue, from: self)
    }
}
