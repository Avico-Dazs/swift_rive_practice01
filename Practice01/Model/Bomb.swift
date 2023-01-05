//
//  Bomb.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2022/12/31.
//

import Foundation

// 爆弾モデル
struct Bomb : Identifiable{
    var id = UUID()
    var pressed: Bool = false
    var canExplosion: Bool = false
}
