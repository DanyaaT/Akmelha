//
//  TeacherCalendar.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct TeacherCalendar: View {
    
    @State var dateSelected: DateComponents?
    @State var showAddEventSheet = false
    @EnvironmentObject var dbEvent: EventDB
    @State private var displayEvents = false
    var user:User
    var course: [Course]
    
    var body: some View {
        
        ZStack{
            Color("bg").ignoresSafeArea()
            
            VStack{
                ZStack{
                    
                    Rectangle()
                        .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                        .foregroundColor(Color("top")).ignoresSafeArea()
                        .frame(height:99)
                    Spacer()
                    HStack{
                        NavigationLink(destination:TeacherProfile(user:user)) {
                            Image("teacherProfile")
                                .resizable()
                                .frame(width: 64, height: 60)
                                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                        } //NavigationLink
                        Spacer()
                    }// hstack
                    .padding()
                    VStack{
                        
                        
                        Text("\n"+"التقويم الدراسي")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                        
                    }// Vstack
                    
                    
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
                        
                        EventFormView(showAddEventSheet: $showAddEventSheet, showButtom :false, course: course)
                            .presentationDetents([.large])
                        
                    }.environment(\.layoutDirection, .rightToLeft)
                    
                        .padding(.top, -35.0)
                    
                    
                    //  ForEach(eventStore.events.sorted {$0.date < $1.date }) { event in
                    //  EventList(event: event)
                    
                    
                    let id = Auth.auth().currentUser?.uid
                    ForEach(dbEvent.events.indices, id: \.self) {index in
                        if ( dbEvent.events[index].courseTeacher == id ){
                            EventList(event : dbEvent.events[index])
                        }
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
    struct EventFormView: View {
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
        @State var NameMessage = ""
        @State var courseMessage = ""

        @State var showButtom: Bool
        var course: [Course]
        @EnvironmentObject var dbCourse: CourseDB
        @EnvironmentObject var dbEvent: EventDB
        let id = Auth.auth().currentUser?.uid
        
        var body: some View {
            NavigationStack {
                
                ZStack {
                    VStack {
                        Form {
                            Section(header:Text(NameMessage).foregroundColor(.red)){
                                TextField("العنوان", text: $eventName)
                                    .focused($focus, equals: true)
                                    .environment(\.layoutDirection, .rightToLeft)
                                TextField("الوصف", text: $eventDesc)
                                    .environment(\.layoutDirection, .rightToLeft)
                            }
                            
                            Section {
                                DatePicker(selection: $eventDate, displayedComponents:[.date])
                                {
                                    Text("التاريخ")
                                }.environment(\.calendar, Calendar(identifier: .gregorian))
                                .environment(\.locale, Locale.init(identifier: "ar_SA"))
                                .tint(Color("purple"))
                            }



//                            Section{
//                                Picker(selection: $eventSection, label: Text("الصف الدراسي")){
//                                    Text("").tag("")
//                                    let id = Auth.auth().currentUser?.uid
//                                    ForEach(dbCourse.courses.indices, id: \.self) {index in
//                                        if ( dbCourse.courses[index].courseTeacher == id ){
//                                            Text(dbCourse.courses[index].courseLevel ?? "")
//                                                .tag(dbCourse.courses[index].courseName ?? "")
//
//                                        }
//                                    }
//                                } // end picker
//                            }

                            Section(header:Text(courseMessage).foregroundColor(.red)){
                                Picker(selection: $eventCourse, label: Text("المادة ")){
                                    Text("").tag("")
                                    
                                    let id = Auth.auth().currentUser?.uid
                                    ForEach(dbCourse.courses.indices, id: \.self) {index in
                                        if ( dbCourse.courses[index].courseTeacher == id ){
                                            let option = (dbCourse.courses[index].courseName ?? "") + ",  \(dbCourse.courses[index].courseLevel ?? "")"

                                         
                                                  

                                            Text(option)
                                                .tag(dbCourse.courses[index].id ?? "")
                                            

                                        }
                                        
                                    }
                                   // ForEach(courses, id:\.self){ course in
                                       // Text(course)
                                    //  .tag(course)
                                 //   }// foreach
                                } // end picker
                            }
                            
                            
                            
                            Section(footer:
                                        HStack {
                                Spacer()
                                Button {

                                    
                                    //for courses in course {
                                    //   if (courses.courseName == eventCourse ){
                                            //for student in courses.coureseStudents ?? []{
                                    
//                                    var indexChar = eventCourse.firstIndex(of: ",")!
//                                    var t = eventCourse.index(before: indexChar)
//                                    var r = eventCourse.index(after: indexChar)
                                    
                                    if eventName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && eventCourse.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                        NameMessage = "الرجاء إدخال عنوان الحدث"
                                        courseMessage = "الرجاء اختيار اسم المادة "

                                    }
                                    
                                    else if eventName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                                        NameMessage = "الرجاء إدخال عنوان الحدث"
                                        courseMessage = ""

                                    }
                                    
                                    else if eventCourse.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                                        courseMessage = "الرجاء اختيار اسم المادة "
                                        NameMessage = ""

                                    }
                                    
                                    else{
                                        courseMessage = ""
                                        NameMessage = ""
                                        
                                        dbEvent.addEvent(Event(eventName: eventName, eventDate:eventDate, eventDesc: eventDesc, eventCourse: eventCourse, courseTeacher: id ))
                                        // }
                                        //  }
                                        //}
                                        // dbEvent.addEvent(Event(eventName: eventName, eventDate:eventDate, eventDesc: eventDesc, eventCourse: eventCourse, eventSection: eventSection , courseTeacher: id ,eventStudent: "" ))
                                        
                                        // create new event
                                        // if (!eventName.isEmpty && !eventCourse.isEmpty && //!eventSection.isEmpty){
                                        
                                        
                                        //}else{
                                        // showButtom = false
                                        // }
                                        
                                        dismiss()
                                    }
                                } label: {
                                    HStack{
                                        Spacer()
                                        Text("إضافة").font(.title2)
                                        Spacer()
                                    }
                                    
                                }.tint(Color("green"))
                                .buttonStyle(.borderedProminent)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .disabled(showButtom)
                
                            }
                            ) {
                                EmptyView()
                            }
                        }
                        
                        
                    }.scrollContentBackground(.hidden)
                        .background(Color("sheet"))
                    
                    .environment(\.layoutDirection,.rightToLeft)
                    .navigationTitle("إضافة حدث جديد")
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
