//
//  Practice01App.swift
//  Practice01
//
//  Created by Yusuke Abiko on 2022/12/21.
//

import SwiftUI

@main
struct Practice01App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MainViewModel())
        }
    }
}
