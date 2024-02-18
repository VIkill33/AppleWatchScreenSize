//
//  ContentView.swift
//  DemoApp Watch App
//
//  Created by Vikill Blacks on 2024/2/18.
//

import SwiftUI
import AppleWatchScreenSize

struct ContentView: View {
    let screenSize = ScreenSize()
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: Double(screenSize.cornerSize ?? 0), height: Double(screenSize.cornerSize ?? 0)))
            .stroke(lineWidth: 10.0)
            .foregroundColor(.red)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
