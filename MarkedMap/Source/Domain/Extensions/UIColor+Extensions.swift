//
//  UIColor+Extensions.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 14/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import UIKit

enum AssetsColor: String {
    case bikeColor
    case electricCarColor
    case mopedColor
    case publicTransportColor
    case publicTransport2Color
    case publicTransport3Color
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? UIColor.black // Black For Testing
    }

}
