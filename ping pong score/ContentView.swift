import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var pointPlayOne = 0
    @State var pointPlayTwo = 0
    @State var playerOneName = "Jugador 1"
    @State var playerTwoName = "Jugador 2"
    
    @State private var isEditingPlayerOne = false
    @State private var isEditingPlayerTwo = false
    @State private var tempPlayerName = "" 
    
    var body: some View {
        ZStack {
            // Contenido principal (VStack o HStack)
            Group {
                if horizontalSizeClass == .compact {
                    VStack {
                        PlayerScoreView(playerName: $playerOneName, score: $pointPlayOne, color: .blue) {
                            pointPlayOne += 1 // Acción cuando se toca todo el VStack del Jugador 1
                        } onLongPress: {
                            tempPlayerName = playerOneName
                            isEditingPlayerOne = true // Abrir modal de edición para Jugador 1
                        }
                        PlayerScoreView(playerName: $playerTwoName, score: $pointPlayTwo, color: .red) {
                            pointPlayTwo += 1 // Acción cuando se toca todo el VStack del Jugador 2
                        } onLongPress: {
                            tempPlayerName = playerTwoName
                            isEditingPlayerTwo = true // Abrir modal de edición para Jugador 2
                        }
                    }
                } else {
                    HStack {
                        PlayerScoreView(playerName: $playerOneName, score: $pointPlayOne, color: .blue) {
                            pointPlayOne += 1 // Acción cuando se toca todo el VStack del Jugador 1
                        } onLongPress: {
                            tempPlayerName = playerOneName
                            isEditingPlayerOne = true // Abrir modal de edición para Jugador 1
                        }
                        PlayerScoreView(playerName: $playerTwoName, score: $pointPlayTwo, color: .red) {
                            pointPlayTwo += 1 // Acción cuando se toca todo el VStack del Jugador 2
                        } onLongPress: {
                            tempPlayerName = playerTwoName
                            isEditingPlayerTwo = true // Abrir modal de edición para Jugador 2
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)

            // Botón flotante en el centro
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
                    // Acción para abrir la configuración
                    print("Botón de configuración presionado")
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
        .sheet(isPresented: $isEditingPlayerOne) {
            editPlayerNameModal(playerName: $playerOneName)
        }
        .sheet(isPresented: $isEditingPlayerTwo) {
            editPlayerNameModal(playerName: $playerTwoName)
        }
    }
    
   
    
    // Modal para editar el nombre del jugador
    func editPlayerNameModal(playerName: Binding<String>) -> some View {
        EditPlayerModal(playerName: playerName)
    }
}

// Vista modal para editar el nombre
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
    ContentView()
}
