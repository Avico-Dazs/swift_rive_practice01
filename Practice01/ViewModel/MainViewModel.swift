//
//  MainViewModel.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2022/12/23.
//

import Foundation
import SwiftUI

class MainViewModel:ObservableObject{
    @Published var explosion = false
    @Published var bombs = [Bomb]()
    
    let maxBombs = 20
        
    func tapBomb(bomb: Bomb){
        if let index = bombs.firstIndex(where: {$0.id == bomb.id}){
            bombs[index] = Bomb(id:UUID() , pressed: true, canExplosion: bomb.canExplosion)
            if bomb.canExplosion{
                self.explosion = true
            }
        }
    }
        
    init(){
        populate()
    }
    
    func populate(){
        bombs.removeAll()
        
        explosion = false
        
        let exIndex = Int.random(in: 0..<maxBombs)
        for num in 0..<maxBombs{
            bombs.append(.init(pressed: false, canExplosion: exIndex == num))
        }
    }
}
