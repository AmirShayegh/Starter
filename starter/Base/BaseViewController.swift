//
//  BaseViewController.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import UIKit
import Extended
import Designer

class BaseViewController: UIViewController, Designer {

    var containerVC: UIViewController?

    var pageTitle: String?

    override func viewDidLoad() {
        self.view.backgroundColor = Theme.Colors.Background.main
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let containerVC = self.containerVC, let container = containerVC as? ViewController else {return}
        container.setNav(title: pageTitle ?? "")
    }

    func setup(containerVC: UIViewController) {
        self.containerVC = containerVC
    }

    func getContainer() -> ViewController? {
        guard let containerVC = self.containerVC, let container = containerVC as? ViewController else {return nil}
        return container
    }
}

