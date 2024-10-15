//
//  PlayerScoreView.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 8/10/24.
//

import SwiftUI

struct PlayerScoreView: View {
    var playerName: Binding<String>
    var score: Binding<Int>
    var color: Color
    var onTap: () -> Void
    var onLongPress: () -> Void
    
    var body: some View {
        VStack {
            Text(playerName.wrappedValue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("\(score.wrappedValue)")
                .font(.system(size: 120))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .onTapGesture {
            onTap() // Incrementar puntaje cuando se toca todo el VStack
        }
        .onLongPressGesture {
            onLongPress() // Permitir editar el nombre cuando se deja presionado
        }
    }
    
}

#Preview() {
    PlayerScoreView(
        playerName: .constant("Ricardo"),
        score: .constant(0),
        color: .blue,
        onTap: {},
        onLongPress: {}
    )
}  // Usa traits en lugar de .previewLayout
