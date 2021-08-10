//
//  UIView+Image.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 29/07/21.
//

import Foundation
import SwiftUI

extension UIView {
    func asImage(size: CGSize) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        return UIGraphicsImageRenderer(size: size, format: format).image { context in
            layer.render(in: context.cgContext)
        }
    }
}
