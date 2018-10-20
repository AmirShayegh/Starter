//
//  ViewController.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import UIKit
import Extended
import Designer

class ViewController: UIViewController, Designer {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: Outlets
    @IBOutlet weak var body: UIView!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var navBarBackButton: UIButton!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!

    @IBOutlet weak var backIcon: UIImageView!
    // MARK: Constants
    let presentationDuration = 0.3
    let flipDuration: Double = 0.4
    let notification = UISelectionFeedbackGenerator()

    // MARK: Variables
    var currentViewController: UIViewController?
    var previousViewControllers: [UIViewController] = [UIViewController]()

    var leftTransitionAnimation: UIView.AnimationOptions = .transitionFlipFromLeft
    var rightTransitionAnimation: UIView.AnimationOptions = .transitionFlipFromRight

    var transitionOptions: UIView.AnimationOptions = [.showHideTransitionViews, .transitionFlipFromLeft]

    var initialTransitionOptions: UIView.AnimationOptions = [.curveEaseIn]

    var clone: UIView?
    // MARK: ViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
//        setStatusBarAppearanceLight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + presentationDuration) {
            self.showHome()
        }
    }


    // MARK: Outlet actions
    @IBAction func navBackAction(_ sender: UIButton) {
        notification.selectionChanged()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.goBack()
        }
    }

    // MARK: Styling
    func style() {
        self.view.backgroundColor = Theme.Colors.main
        self.body.backgroundColor = Theme.Colors.main
        self.navBar.backgroundColor = Theme.Colors.main
        self.pageTitle.textColor = Theme.Colors.Text.navigationTitle
        self.pageTitle.font = Theme.Fonts.medium(size: 15)
    }

    // MARK: Nav Bar
    func hideNav() {
        self.navBarBackButton.alpha = 0
        self.backIcon.alpha = 0
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: presentationDuration) {
            self.pageTitle.alpha = 0
            self.navBarHeight.constant = 0
            self.view.layoutIfNeeded()
            //            DispatchQueue.main.async {
            //                self.clone = self.getClone()
            //            }
        }
    }

    func showNav() {
        UIView.animate(withDuration: presentationDuration, animations: {
            self.pageTitle.alpha = 1
            self.navBarHeight.constant = 45
            self.view.layoutIfNeeded()
        }) { (done) in
            self.navBarBackButton.alpha = 1
            self.backIcon.alpha = 1
            self.view.layoutIfNeeded()
//            //            self.clone = self.getClone()
//            //            DispatchQueue.main.sync {
//            //                self.clone = self.getClone()
//            //            }
        }
    }

    func setNav(title: String) {
        UIView.animate(withDuration: presentationDuration, animations: {
            self.pageTitle.alpha = 0
            self.view.layoutIfNeeded()
        }) { (done) in
            self.pageTitle.text = title
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: self.presentationDuration, animations: {
                self.pageTitle.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }

    func goBack() {
        transitionOptions = [.showHideTransitionViews, rightTransitionAnimation]
        removeCurrentVC()
    }

    func goHome() {
        if let current = previousViewControllers.popLast() {
            previousViewControllers.removeAll()
            remove(asChildViewController: current)
            showHome()
        }
    }

    // Clone view for animation
    func getClone() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: body.frame.width, height: body.frame.height))
        let imageView = UIImageView()
        imageView.image = body.toImage()
        imageView.frame =  CGRect(x: 0, y: 0, width: body.frame.width, height: body.frame.height)
        view.center.y = body.center.y
        view.center.x = body.center.x
        view.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:0.9)
        view.alpha = 1
        view.tag = 99
        imageView.frame = body.frame
        view.addSubview(imageView)
        return view
    }

    // MARK: Adding and removing viewControllers mechanic
    func show(viewController: UIViewController, addToStack: Bool? = true) {
        /*
         let clone = getClone()
         */
        if let current = self.currentViewController {
            self.remove(asChildViewController: current)
            //            self.body.addSubview(clone)
            self.view.layoutIfNeeded()
            self.currentViewController = viewController
            self.previousViewControllers.append(viewController)

            self.addChild(viewController)
            viewController.view.frame = self.body.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.body.addSubview(viewController.view)
            viewController.didMove(toParent: self)

            //            UIView.transition(from: clone, to: viewController.view, duration: flipDuration, options: transitionOptions) { (done) in
            //
            //                clone.removeFromSuperview()
            //            }

        } else {
            self.currentViewController = viewController
            self.previousViewControllers.append(viewController)
            self.addChild(viewController)
            viewController.view.frame = self.body.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.body.addSubview(viewController.view)
            viewController.didMove(toParent: self)
        }

        self.currentViewController = viewController

        /* Choose when to show navigation */
        if viewController is HomeViewController {
            self.hideNav()
        } else {
            self.showNav()
        }

    }

    func removeCurrentVC() {
        if let current = self.previousViewControllers.popLast() {
            remove(asChildViewController: current)
            if let previous = self.previousViewControllers.popLast() {
                show(viewController: previous)
            }
        }
    }

    func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
