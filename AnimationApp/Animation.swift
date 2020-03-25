//
//  Animation.swift
//  AnimationApp
//
//  Created by Dmitry on 24.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import Foundation
import Spring

struct Animation {
    let name: String
    let curve: String
    let force: CGFloat
    let delay: CGFloat
    let duration: CGFloat
    
    static func getAnimation() -> Animation {
        return Animation(
            name: Spring.AnimationPreset.allCases.randomElement()!.rawValue,
            curve: Spring.AnimationCurve.allCases.randomElement()!.rawValue,
            force: CGFloat.random(in: 0.5...1.5),
            delay: CGFloat.random(in: 0...1),
            duration: CGFloat.random(in: 0.5...1.5))
    }
}
