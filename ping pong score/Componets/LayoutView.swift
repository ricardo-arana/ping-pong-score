//
//  LayoutView.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 18/10/24.
//

import SwiftUI

struct LayoutView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                if proxy.size.width > proxy.size.height {
                    HStack {
                        content
                    }
                } else {
                    VStack {
                        content
                    }
                }
            }
        }
                
    }
}
