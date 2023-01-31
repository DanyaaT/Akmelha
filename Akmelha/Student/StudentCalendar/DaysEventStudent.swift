//
//  DaysEventStudent.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct DaysEventStudent: View {
    @Binding var dateSelected: DateComponents?
    @EnvironmentObject var dbEvent: EventDB
    var user : User
    @EnvironmentObject var dbCourse: CourseDB
    var courseName = ""
    var courseColor = ""
    var courseLevel = ""
    var body: some View {
        
        NavigationStack {
            ScrollView{
          
                if let dateSelected {
                    let foundEvents = dbEvent.events
                        .filter {$0.eventDate.startOfDay == dateSelected.date!.startOfDay}
                    VStack{
                        ForEach(foundEvents.indices, id: \.self){index in
                            if isStudentEvents(eventCoures: foundEvents[index].eventCourse ?? "", student: user){
                                
                                let CourseNameColor = CourseNameLevel(id: foundEvents[index].eventCourse ?? "", courses: dbCourse.courses)
                                EventListStudent(user: user,event: foundEvents[index], courseName: CourseNameColor[0],courseColor: CourseNameColor[1], courseLevel: CourseNameColor[2])
                            }
                        }.environment(\.layoutDirection,.rightToLeft)
                    }
                    
                
            }
        }
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
        
}

/*struct DaysEventStudent_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .islamicUmmAlQura)
        return dateComponents
    }
    static var previews: some View {
        DaysEventStudent(dateSelected: .constant(dateComponents))
    }
}*/

