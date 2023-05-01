//
//  UIView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 26/04/23.
//

import UIKit

extension UIView {
    
    func blink(enabled: Bool = true, duration: CFTimeInterval = 1.0, delay: TimeInterval = 0.0, stopAfter: CFTimeInterval = 0.0, alpha: CGFloat = 0.0 ) {
        enabled ? UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.alpha = alpha
        }) : self.layer.removeAllAnimations()
        if !stopAfter.isEqual(to: 0.0) && enabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + stopAfter) { [weak self] in
                self?.layer.removeAllAnimations()
            }
        }
    }
    
}
