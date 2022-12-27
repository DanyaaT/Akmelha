//
//  XOView.swift
//  Akmelha
//
//  Created by Deema on 03/06/1444 AH.
//


import SwiftUI

struct XOView: View {
    
    @StateObject private var viewModel = XOViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack{
                    
                    Rectangle()
                    .frame(width: 200, height: 20)
                    .foregroundColor(Color("arabic")).opacity(0.7)
                    
                    Text("إكس-أو")
                        .font(.system(size: 40))
                        .foregroundColor(Color("title"))

                }

                Spacer()
                LazyVGrid(columns: viewModel.columns){
                    ForEach(0..<9) {indexOfSquare in
                        ZStack {
                            GameCircleView(proxy: geometry)
                            
                            PlayerIndexes(systemImageName: viewModel.moves[indexOfSquare]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMoving(in: indexOfSquare)
                            
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisable)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { viewModel.buttonForResetGame()}))
            }
        }
    }
    
    
    
}

enum Player {
    case human
    case computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        XOView()
            .environment(\.layoutDirection,.rightToLeft)

    }
}

struct GameCircleView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(Color("islamic")).opacity(0.5)
            .frame(width: proxy.size.width/3 - 15,
                   height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndexes: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(Color("bg"))
    }
}
