//
//  Designer.swift
//  starter
//
//  Created by Amir Shayegh on 2018-10-19.
//  Copyright © 2018 shayegh.ca. All rights reserved.
//

import Foundation
import Designer

extension Designer {
    func styleInput(field: UITextField, readOnly: Bool? = false) {
        field.textColor = Theme.Colors.Text.input
        field.font = Theme.Fonts.regular(size: 14)
        if let readOnly = readOnly, readOnly {
            field.textColor = Theme.Colors.Text.fixed
            field.isUserInteractionEnabled = false
        }
    }
}
