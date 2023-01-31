//
//  StudentCalendarView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct StudentCalendarView: View {
    var user: User
    var courseEvents: [Event]
    @State var dateSelected: DateComponents?
    @State var showAddEventSheet = false
    @EnvironmentObject var dbEvent: EventDB
    @EnvironmentObject var dbCourse: CourseDB
    //  var course : Course
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
                } .toolbar(.hidden) //end overlay
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
                        Text("")
                        
                    } //Hstack
                    
                    
                    .environment(\.layoutDirection, .rightToLeft)
                    
                    .padding(.top, -35.0)
                    ForEach(courseEvents.indices, id: \.self){index in
                        let CourseNameColor = EventCourseName(id: courseEvents[index].eventCourse ?? "", courses: dbCourse.courses)
                        EventListStudent(user: user,event: courseEvents[index], courseName: CourseNameColor[0],courseColor: CourseNameColor[1])
                    }

                    .environment(\.layoutDirection, .rightToLeft)
                    
                    .sheet(isPresented: $displayEvents) {
                        DaysEventStudent(dateSelected: $dateSelected, user: user)
                            .presentationDetents([.medium])
                    }
                    
                    
                }//scrollView
            }//Vstack
        }//Zstack
    }
}
    
//    struct StudentCalendarView_Previews: PreviewProvider {
//        static var dateComponents: DateComponents {
//
//            var dateComponents = Calendar.current.dateComponents(
//                [.month,
//                 .day,
//                 .year,
//                 .hour,
//                 .minute],
//                from: Date())
//            dateComponents.timeZone = TimeZone.current
//            dateComponents.calendar = Calendar(identifier: .islamicUmmAlQura)
//            return dateComponents
//        }
//
//        static var previews: some View {
//            StudentCalendarView()
//               .environment(\.layoutDirection, .rightToLeft)
//
//        }
//    }


func EventCourseName(id: String, courses: [Course]) ->[String]{
    var name = ""
    var color = ""
    for course in courses{
        if course.id == id{
            name = course.courseName ?? ""
            color = course.courseColor ?? "pink"
            break
        }
    }
    return [name, color]
}
