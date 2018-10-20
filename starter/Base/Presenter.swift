//
//  ShowViewController.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import Foundation
extension ViewController {
    // MARK: Presentations
    func showHome() {
        transitionOptions = [.showHideTransitionViews, leftTransitionAnimation]
        let vb = ViewBox()
        let home = vb.home
        home.setup(containerVC: self)
        show(viewController: home)
    }

    func showPrivacy() {
        transitionOptions = [.showHideTransitionViews, leftTransitionAnimation]
        let vb = ViewBox()
        let vc = vb.privacy
        vc.setup(containerVC: self)
        show(viewController: vc)
    }
}
