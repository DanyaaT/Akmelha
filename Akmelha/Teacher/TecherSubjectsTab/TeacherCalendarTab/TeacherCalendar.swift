//
//  TeacherCalendar.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherCalendar: View {
    
    @State var dateSelected: DateComponents?
    @State var showAddEventSheet = false
    @EnvironmentObject var dbEvent: EventDB
    @State private var displayEvents = false
    var body: some View {
        
        ZStack{
            Color("bg").ignoresSafeArea()
            
            VStack{
                ZStack{
                    
                    Rectangle()
                        .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                        .foregroundColor(Color("top")).ignoresSafeArea()
                        .frame(height:99)
                    
                    
                    
                    Text("\n"+"التقويم الدراسي")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40))
                        .foregroundColor(Color("title"))
                }//end overlay
                ScrollView{
                    
                    CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                 dbEvent: dbEvent,
                                 dateSelected: $dateSelected,
                                 displayEvents: $displayEvents)
                    
                    HStack {
                        Text("الأحداث المهمة")
                            .font(.system(size: 23))
                            .foregroundColor(Color("addEvent"))
                            .padding()
                        Spacer()
                        
                        Button {
                            showAddEventSheet = true
                        } label: {
                            Image(systemName: "calendar.badge.plus")
                                .resizable()
                                .foregroundColor(Color("addEvent"))
                                .frame(width: 38, height: 35)
                                .padding()
                        }//Button
                    } //Hstack
                    
                    .sheet(isPresented: $showAddEventSheet){
                        EventFormView(showAddEventSheet: $showAddEventSheet)
                            .presentationDetents([.large])
                        
                    }.environment(\.layoutDirection, .rightToLeft)
                    
                        .padding(.top, -35.0)
                    
                    
                    //  ForEach(eventStore.events.sorted {$0.date < $1.date }) { event in
                    //  EventList(event: event)
                    
                    
                    ForEach(dbEvent.events.indices, id: \.self) {index in
                        EventList(event : dbEvent.events[index])
                    }
                    .environment(\.layoutDirection, .rightToLeft)
                    
                    .sheet(isPresented: $displayEvents) {
                        DaysEventsListView(dateSelected: $dateSelected)
                            .presentationDetents([.medium])
                    }
                    
                    
                    
                }//scrollView
            }//Vstack
        }//Zstack
    }
    
    
    
    struct TeacherCalendar_Previews: PreviewProvider {
        static var dateComponents: DateComponents {
            
            var dateComponents = Calendar.current.dateComponents(
                [.month,
                 .day,
                 .year,
                 .hour,
                 .minute],
                from: Date())
            dateComponents.timeZone = TimeZone.current
            dateComponents.calendar = Calendar(identifier: .gregorian)
            return dateComponents
        }
        static var previews: some View {
            
            TeacherCalendar()
                .environment(\.layoutDirection, .leftToRight)
            
            
        }
    }
    struct EventFormView: View {
        
        //@EnvironmentObject var eventStore: EventStore
        @Binding var showAddEventSheet: Bool
        @Environment(\.dismiss) var dismiss
        @FocusState private var focus: Bool?
        @State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]
        @State var courses: [String] = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية المهنية","التربية الفنية","التفكير الناقد",]
        @State var eventName = ""
        @State var eventDesc = ""
        @State var eventDate = Date()
        @State var eventSection = ""
        @State var eventCourse = ""
        @State var selectedCourse = 0
        @EnvironmentObject var dbEvent: EventDB
        
        var body: some View {
            NavigationStack {
                
                ZStack {
                    VStack {
                        Form {
                            TextField("العنوان", text: $eventName, axis: .vertical)
                                .focused($focus, equals: true)
                            TextField("الوصف", text: $eventDesc, axis: .vertical)
                            Section {
                                DatePicker(selection: $eventDate, displayedComponents:[.date])
                                {
                                    Text("التاريخ")
                                }//.environment(\.calendar, Calendar(identifier: .islamicUmmAlQura))
                                //.environment(\.locale, Locale.init(identifier: "ar_SA"))
                                .tint(Color("purple"))
                            }
                            Section{
                                Picker(selection: $eventSection, label: Text("الصف الدراسي")){
                                    Text("").tag("")
                                    ForEach(levels, id:\.self){ level in
                                        Text(level)
                                            .tag(level)
                                    } //foreach
                                } // end picker
                            }
                            Section {
                                Picker(selection: $eventCourse, label: Text("اسم المادة")){
                                    Text("").tag("")
                                    ForEach(courses, id:\.self){ course in
                                        Text(course)
                                            .tag(course)
                                    }// foreach
                                }// end picker
                            }
                            
                            
                            
                            Section(footer:
                                        HStack {
                                Spacer()
                                Button {
                                    // create new event
                                    dbEvent.addEvent(Event(eventName: eventName, eventDate:eventDate, eventDesc: eventDesc, eventCourse: eventCourse, eventSection: eventSection ))
                                    //   eventStore.add(newEvent)
                                    
                                    dismiss()
                                } label: {
                                    Text("اضافة")
                                }
                                .buttonStyle(.borderedProminent)
                                .background(Color("green"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                Spacer()
                            }
                            ) {
                                EmptyView()
                            }
                        }
                        
                        
                    }
                    
                    .environment(\.layoutDirection,.rightToLeft)
                    .navigationTitle("اضافة حدث جديد")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {showAddEventSheet = false}){
                                Image(systemName: "xmark.circle").foregroundColor(.gray)
                            }
                        }
                    }
                    
                    .onAppear {
                        focus = true
                    }
                }
            }
        }
    }
    
    
    
}
