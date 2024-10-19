import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var deviceOrientation = DeviceOrientation()
    @State var pointPlayOne = 0
    @State var pointPlayTwo = 0
    @State var playerOneName = "Jugador 1"
    @State var playerTwoName = "Jugador 2"
    
    @State private var isEditingPlayerOne = false
    @State private var isEditingPlayerTwo = false
    @State private var tempPlayerName = "" 
    
    var body: some View {
        ZStack {
            LayoutView {
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $isEditingPlayerOne) {
                       editPlayerNameModal(playerName: $playerOneName)
                   }
            .sheet(isPresented: $isEditingPlayerTwo) {
                       editPlayerNameModal(playerName: $playerTwoName)
                   }
            ControlPanel() {
                pointPlayOne = 0
                pointPlayTwo = 0
            }
        }
    }
    
   
    
    // Modal para editar el nombre del jugador
    func editPlayerNameModal(playerName: Binding<String>) -> some View {
        EditPlayerModal(playerName: playerName)
    }
}



#Preview {
    ContentView()
}
