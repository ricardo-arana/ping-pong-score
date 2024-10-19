//
//  EditPlayerModal.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 18/10/24.
//

import SwiftUI

struct EditPlayerModal: View {
    @Binding var playerName: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Editar Nombre del Jugador")
                .font(.headline)
            TextField("Nuevo nombre", text: $playerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Guardar") {
                // El nombre ya está enlazado a playerName, se cerrará el modal al presionar guardar
                dismiss() // Cierra el modal
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    EditPlayerModal(playerName: .constant("Ricardo"))
}
