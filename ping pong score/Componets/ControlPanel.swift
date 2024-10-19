//
//  ControlPanel.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 17/10/24.
//

import SwiftUI

struct ControlPanel: View {
    var onTapRefresh: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                // Acción para abrir la configuración
                print("Botón de configuración presionado")
            }) {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.gray.opacity(0.8))
            .clipShape(Circle())
            .shadow(radius: 10)
            Button(action: {
                onTapRefresh()
            }) {
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.gray.opacity(0.8))
            .clipShape(Circle())
            .shadow(radius: 10)
        }
        .frame(width: 300, height: 80)
        .background(Color.black.opacity(0.7))
        .cornerRadius(20)
    }
}

#Preview {
    ControlPanel(onTapRefresh: {})
}
