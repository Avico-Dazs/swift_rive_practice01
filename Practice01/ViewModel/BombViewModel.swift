//
//  BombViewModel.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2023/01/04.
//

import Foundation
import RiveRuntime
import SwiftUI

class BombViewModel: RiveViewModel{
    var pressed: Bool{
        didSet{
            setInput("Pressed", value: pressed)
        }
    }
    
    init(_ initialPressed: Bool = false) {
        pressed = initialPressed
        super.init(fileName: "bomb_switch", fit: .fill)
    }
    
    override func view() -> AnyView {
        AnyView(
            super.view()
        )
    }
}
