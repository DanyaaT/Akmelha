//
//  PickerView.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct PickerView: View {
@State var characters =  ["المهام", "تقييم الطلاب","عن المادة"]
@Binding var selectedCharacter : String
@State var color = "pink"


var body: some View {
    
       
        HStack(spacing: 0) {
            ForEach(characters, id: \.self) { character in
                
                ZStack{
                    Rectangle().foregroundColor(Color("pickerBG"))
                if(selectedCharacter == character) {
                   
                                         Rectangle()
                            .foregroundColor(Color(color))
                                    .cornerRadius(20)
                                        .padding(2)
                    
                        Text(character)
                }
                    
                 else {
                    
                         
                         Text(character)
                         
                     
                        .onTapGesture {
                            withAnimation(  .interactiveSpring(response: 0.2,
                                                                              dampingFraction: 2,
                                                                              blendDuration: 0.2)) {
                                selectedCharacter = character
                            }
                        }
                     
                }
                 
            }
        }
        }
        .background(Color("pickerBG"))
        .frame(height: 40)
        .cornerRadius(20)
      
    
}
}


