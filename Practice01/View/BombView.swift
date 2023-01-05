//
//  BombView.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2022/12/31.
//

import SwiftUI
import RiveRuntime

struct BombView: View {
    var bomb: Bomb
    
    let viewModel = RiveViewModel(fileName: "bomb_switch")
    var body: some View {
        viewModel.view()
            .aspectRatio(contentMode: .fit)
            .onChange(of: self.bomb.pressed, perform: { value in
                viewModel.setInput("Pressed", value: value)
            })
            .onAppear(){
                viewModel.setInput("Pressed", value: bomb.pressed)
            }
    }
}
//
//struct BombView_Previews: PreviewProvider {
//    static var previews: some View {
//        BombView()
//    }
//}
