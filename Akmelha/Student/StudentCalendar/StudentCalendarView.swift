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
    var courseName = ""
    var courseColor = ""
    var courseLevel = ""
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
                    ForEach(dbEvent.events.indices, id: \.self){index in
                        if isStudentEvents(eventCoures: dbEvent.events[index].eventCourse ?? "", student: user){
                            
                            let CourseNameColor = CourseNameLevel(id: dbEvent.events[index].eventCourse ?? "", courses: dbCourse.courses)
                            EventListStudent(user: user,event: dbEvent.events[index], courseName: CourseNameColor[0],courseColor: CourseNameColor[1], courseLevel: CourseNameColor[2])
                        }
                    }

                    .environment(\.layoutDirection, .rightToLeft)
                    
                    .sheet(isPresented: $displayEvents) {
                        ForEach(dbEvent.events.indices, id: \.self){index in
                            if isStudentEvents(eventCoures: dbEvent.events[index].eventCourse ?? "", student: user){
                                
                                let CourseNameColor = CourseNameLevel(id: dbEvent.events[index].eventCourse ?? "", courses: dbCourse.courses)
                                DaysEventStudent(dateSelected: $dateSelected, user: user, courseName: CourseNameColor[0],courseColor: CourseNameColor[1], courseLevel: CourseNameColor[2])
                            }
                        }
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


func isStudentEvents( eventCoures: String, student: User) -> Bool{
    for course in student.studentCourses{
        if course == eventCoures{
            return true
        }
    }
    return false
}
