//
//  ContentView.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2022/12/21.
//

import SwiftUI
import RiveRuntime
import AVFoundation

struct ContentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: 4)
    
    var explosionVm = RiveViewModel(fileName:"explosion",stateMachineName: "State Machine 1")
    
    private let explosionSound = try! AVAudioPlayer(data:NSDataAsset(name: "se_explosion")!.data)
    
    private func playSound(){
        explosionSound.play()
    }
    
    private let file = try! RiveFile(name: "bomb_switch")
    var dismiss: () -> Void = {}
        
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack{
                    ZStack{
                        LazyVGrid(columns: columns, alignment: .center){
                            ForEach(viewModel.bombs){bomb in
                                BombView(bomb: bomb)
                                    .onTapGesture{
                                        self.viewModel.tapBomb(bomb: bomb)
                                    }
                            }
                        }
                        .padding(20)
                        explosionVm.view()
                            .allowsHitTesting(false)
                            .onChange(of: viewModel.explosion) { value in
                                explosionVm.setInput("Showing", value: value)
                                if value {
                                    playSound()
                                }
                                debugPrint("exp property changed")
                            }
                    }
                    Button(action: {
                        viewModel.populate()
                    }){
                        Text("Reset")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(8)
                    }

                }
            }
            .navigationBarTitle(Text("Bomb Switch"),displayMode: .inline)
        }
    }
    
    func model() -> RiveModel { RiveModel(riveFile: file) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MainViewModel())
    }
}
