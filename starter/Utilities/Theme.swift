//
//  Theme.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import Foundation
import Extended
import UIKit

struct Theme {
    struct Colors {
        // Shown under view in iPhone X
        static let main = UIColor(hex: "5a88cd")
        static let secondary = UIColor(hex: "3fa861")

        struct Text {
            static let fixed = UIColor(hex: "000000")
            static let input = UIColor(hex: "474747")
            static let navigationTitle = UIColor(hex: "ffffff")
        }

        struct Background {
            static let main = UIColor(hex: "b0b0b0")
        }
    }

    struct Fonts {
        static func regular(size: CGFloat) -> UIFont {
            return UIFont(name: "HelveticaNeue", size: size)!
        }
        static func heavy(size: CGFloat) -> UIFont {
            return UIFont(name: "HelveticaNeue-Bold", size: size)!
        }
        static func light(size: CGFloat) -> UIFont {
            return UIFont(name: "HelveticaNeue-Light", size: size)!
        }
        static func medium(size: CGFloat) -> UIFont {
            return UIFont(name: "HelveticaNeue-Medium", size: size)!
        }
    }
}
