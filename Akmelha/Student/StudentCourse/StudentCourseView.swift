//
//  StudentCourseView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct CornerRadiusShapee: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStylee: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadiuss(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


struct StudentCourseView: View {
    @State private var showSheet = false
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
                        NavigationLink(destination:TeacherProfile()) {
                            Image("StudentProfile")
                                .resizable()
                                .frame(width: 64, height: 60)
                                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                        } //NavigationLink
                        Spacer()
                    }// hstack
                    .padding()
                    VStack{
                        
                        
                        Text("\n"+"موادي")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                    }// Vstack
                }//Zstac
                .toolbar(.hidden) //end overlay
                
                Spacer()
                HStack(spacing: -3){
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green")).ignoresSafeArea()
                            .cornerRadius(3)
                            .frame(width: 98,height:29, alignment: .bottomLeading)
                        
                        Text("إضافة مادة")
                            .font(.system(size: 15))
                        
                    } // end Zstack
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green"))
                            .frame(width:56,height:56)
                            .cornerRadius(21.8)
                        
                        ZStack{
                            Button("+"){
                                showSheet.toggle()
                            }// end Button
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            
                        }// end Zstack
                    }// end Zstack
                    Spacer()
                } //End Hstack}
            }
        } // first z
        .sheet(isPresented: $showSheet){
            addCourseSheetView(showSheet:$showSheet)
                .presentationDetents([.fraction(0.3)])
            
        }
    }
    
}



    
struct addCourseSheetView:View{
@Binding var showSheet : Bool
@State var id : String = ""

    var body: some View{
        NavigationView{
            
            Form {
                TextField("الرقم التعريفي", text: $id)
                    .environment(\.layoutDirection, .rightToLeft)
            }
            .environment(\.layoutDirection,.rightToLeft)
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .navigationTitle("إضافة مادة جديدة")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showSheet=false}){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(.gray)
                    }// end button
                }// end toolbar item
            }//end toolbar
            
        }
        
        
        
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    

struct StudentCourseView_Previews: PreviewProvider {
    static var previews: some View {
        StudentCourseView()
            .environment(\.layoutDirection,.rightToLeft)

    }
}

