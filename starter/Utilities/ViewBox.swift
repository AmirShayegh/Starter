//
//  ViewBox.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import Foundation
import UIKit

class ViewBox {

    lazy var home: HomeViewController = {
        return UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "Home") as! HomeViewController
    }()

    lazy var privacy: PrivacyViewController = {
    return UIStoryboard(name: "Privacy", bundle: Bundle.main).instantiateViewController(withIdentifier: "Privacy") as! PrivacyViewController
    }()
}
