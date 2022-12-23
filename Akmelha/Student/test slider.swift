//
//  test slider.swift
//  Akmelha
//
//  Created by Deema on 29/05/1444 AH.
//

import SwiftUI
struct Item: Identifiable {
    var id: Int
    var title: String
    var color: String
    @State var userImage = "teacherProfile"
    @State var images = ["girl1","girl2","girl3","boy1","boy2","boy3"]
    @State var selectedImage =  ""
    
}

class Store: ObservableObject {
    @Published var items: [Item]
    
    let colors: [String] = ["girl1","girl2","girl3","boy1","boy2","boy3"]

    // dummy data
    init() {
        items = []
        for i in 0...5 {
            let new = Item(id: i, title: "Item \(i)", color: colors[i])
            items.append(new)
        }
    }
}

struct test_slider: View {
    @StateObject var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var userImage = "teacherProfile"
    @State var selectedImage =  ""
    
    
    
    var body: some View {
        
        VStack{
        Image(userImage)
            .resizable()
            .scaledToFit()
            .frame(height: 100, alignment: .center)
            .overlay(Circle().stroke(Color("title"), lineWidth: 2))
        
        Text("__________________________ ")
            .foregroundColor(Color("title"))
        
        
        ZStack {
            ForEach(store.items) { item in
                
                // article view
                ZStack {
                    //                    RoundedRectangle(cornerRadius: 18)
                    Image(item.color)
                        .resizable()
                        .frame(width: 77, height: 79, alignment: .center)
                        .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                        .padding()
                    
                }
                //                .frame(width: 200, height: 200)
                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2)
                .opacity(1.0 - abs(distance(item.id)) * 0.5 )
                .offset(x: myXOffset(item.id), y: 0)
                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                        snappedItem = draggingItem
                    }
                }
        )
    }
}
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 150

    }
    
}

 

struct test_slider_Previews: PreviewProvider {
    static var previews: some View {
        test_slider()
    }
}




    
    
