//
//  StudentTaskView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI




struct StudentTaskView: View {
    @EnvironmentObject var dbUsers: UserDB
    var user: User
    var courseTasks : [CourseTask]
    var studentOwnTasks : [StudentOwnTask]
    @State var selectedSection = "الكل"
    @State var pickerColor = "pink"
    @State var medal = ""
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
                        NavigationLink(destination:StudentProfile(user: user)) {
                            Image(user.studentImage ?? "teacherProfile")
                                .resizable()
                                .cornerRadius(100)
                                .frame(width: 64, height: 60)
                                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                        } //NavigationLink
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        //                        Image("bell")
                        //                            .resizable()
                        //                            .scaledToFit()
                        //                            .frame(width: 25,height: 70 )
                        //                            .padding([.top, .trailing], -40)
                        //                            .padding(.trailing)
                        ZStack{
                            Image(medalType())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 70 )
                                .padding([.top, .trailing], -25.0)
                            Text("\(user.studentCredit ?? 0)")
                                .padding(.leading, 28)
                            
                        }// zstack
                        Spacer()
                    }// hstack
                    .padding()
                    VStack{
                        
                        
                        Text("\n"+"مهامي")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                    }// Vstack
                }//Zstac
                
                
                
                PickerView(characters: ["الكل", "مكتملة","غير مكتملة"], selectedCharacter: $selectedSection).padding(.horizontal                                                    )
                if selectedSection == "الكل"{
                    AllTask(user: user, courseTasks: courseTasks, studentOwnTasks: studentOwnTasks)
                }
                if selectedSection == "مكتملة"{
                    completedTasks(user: user, courseTasks: courseTasks, studentOwnTasks: studentOwnTasks)
                }
                if selectedSection == "غير مكتملة"{
                    IncompleteTasks(user: user, courseTasks: courseTasks, studentOwnTasks: studentOwnTasks)
                }
                
                
                
                
            }.toolbar(.hidden) //end overlay
        }
    }
    
    func medalType()-> String {
        var medal = "bronze"
        if user.studentCredit ?? 0 >= 601{
            medal = "bronze"
            user.studentCredit = 0
            dbUsers.changeStudentCredit(user)
            
        }else if  user.studentCredit ?? 0 >= 499{
            medal = "gold"
            
        }else if  user.studentCredit ?? 0 >= 199{
            medal = "silver"
        }else {
            medal = "bronze"
        }
        return medal
        
    }
    
}

//struct StudentTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentTaskView()
//            .environment(\.layoutDirection,.rightToLeft)
//
//    }
//}
