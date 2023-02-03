//
//  ImageDetile.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 12/07/1444 AH.
//

import SwiftUI

struct ImageDetile: View {
    @State  var showSheet = false
    var body: some View {
        ZStack{
            Color("sheet").ignoresSafeArea()
            VStack {
        
                Image("puzzle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(25)

            }

        }  .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {showSheet = false}){
                    Image(systemName: "xmark.circle").foregroundColor(.gray)
                }
            }
        }
    }
}
struct ImageDetile_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetile()
    }
}
