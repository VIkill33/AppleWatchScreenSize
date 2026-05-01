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
    
    var cornerRadius: CGFloat {
        //return 51 // experiment here
        CGFloat(screenSize.cornerSize ?? 0)
    }
    
    var body: some View {
        ZStack {
            // This rectange will show up if the radius set too big
            Rectangle()
                .fill(.white)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.red)
            
            guide.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            guide.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            guide.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            
            guide.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var guide: some View {
        Rectangle()
            .stroke(lineWidth: 0.5)
            .fill(.blue)
            .frame(width: cornerRadius, height: cornerRadius)
    }
}

#Preview {
    ContentView()
}
