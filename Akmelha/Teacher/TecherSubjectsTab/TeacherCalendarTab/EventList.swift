//
//  EventList.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct EventList: View {
    @State var pickerColor = "pink"
    let event: Eventt
    @State private var formType: EventFormType?
    var body: some View {
        Button {
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text(event.subject).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                        Spacer()
                        Text(event.date.formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text(event.note).font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        Text("").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                        Spacer()
                        Text(event.section).foregroundColor(.gray)
                    }
                        

                    
                }.padding()
                
                
            }.padding(.horizontal)
        }

    }
}

struct EventLisr_Previews: PreviewProvider {
    static let event =  Eventt(date: Date().diff(numDays: 0), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات")
    static var previews: some View {
        EventList(event: event)
            .environment(\.layoutDirection, .rightToLeft)
            
    }
}
