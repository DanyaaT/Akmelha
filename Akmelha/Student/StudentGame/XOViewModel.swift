//
//  XOViewModel.swift
//  Akmelha
//
//  Created by Deema on 03/06/1444 AH.
//

import SwiftUI

final class XOViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisable = false
    @Published var alertItem: AlertItem?
    
    
    func processPlayerMoving (in indexOfCircle: Int) {
        if isSquareOccupied(in: moves, forIndex: indexOfCircle) { return }
        moves[indexOfCircle] = Move(player: .human, boardIndex: indexOfCircle)
        
        if checkWinCondition(for: .human, in: moves){
            alertItem = AlertContext.humanWin
            return
        }
        
        if checkingForDraw(in: moves){
            alertItem = AlertContext.draw
            return
        }
        
        isGameBoardDisable = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determinePositionForComputer(in: moves)
            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
            isGameBoardDisable = false
            
            if checkWinCondition(for: .computer, in: moves){
                alertItem = AlertContext.computerWin
                return
            }
            
            if checkingForDraw(in: moves){
                alertItem = AlertContext.draw
                return
            }
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) ->Bool {
        return moves.contains { $0?.boardIndex == index}
    }
    
    
    func determinePositionForComputer(in moves: [Move?]) ->Int {
        
        // If AI can win, then win
        let winPattern: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let computerMoves = moves.compactMap { $0 }.filter { $0.player == .computer}
        let computerPostions = Set(computerMoves.map { $0.boardIndex })
        
        for pattern in winPattern {
            let winPosition = pattern.subtracting(computerPostions)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable { return winPosition.first! }
            }
        }
        
        // If AI can't win, then block
        let humanMoves = moves.compactMap { $0 }.filter { $0.player == .human}
        let humanPostions = Set(humanMoves.map { $0.boardIndex })
        
        for pattern in winPattern {
            let winPosition = pattern.subtracting(humanPostions)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable { return winPosition.first! }
            }
        }
        
        // If AI can't block, then take middle square
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        // If AI can't take middle square, take available sqaure
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPattern: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player}
        let playerPostions = Set(playerMoves.map { $0.boardIndex })
        
        for pattern in winPattern where pattern.isSubset(of: playerPostions) {
            return true
        }
        return false
    }
    
    func checkingForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    func buttonForResetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
