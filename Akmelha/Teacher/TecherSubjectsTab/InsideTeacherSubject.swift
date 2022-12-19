//
//  InsideTeacherSubject.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct InsideTeacherSubject: View {
    let course : Course
    @State var selectedSection = "المهام"
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                HStack{

                    Text(title).font(.title).background(Rectangle().frame( height: 13 ).foregroundColor(Color(pickerColor)))
                    Spacer()
                }
            PickerView(characters: ["المهام", "تقييم الطلاب","عن المادة"], selectedCharacter: $selectedSection, color: pickerColor)
                Spacer()
            if selectedSection == "المهام"{
                TeacherTasks()
                
            }
                if selectedSection == "تقييم الطلاب"{
                TeacherReviews(course: course)
             }
                if selectedSection == "عن المادة"{
                    AboutTeacherSubject(course : course)
          }
                
            }.padding()
        }.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
     
    }
  }

