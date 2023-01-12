//
//  SwiftUIView.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth


class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    @ObservedObject var dbUsers: UserDB = UserDB()
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
           
        }
        
    }
    
    func signUp(email: String, password: String, name:String , userType: String){
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else{
                print(error)
                return
            }
            DispatchQueue.main.async { [self] in
                self?.signedIn = true
                if userType == "S"{
                    
                    self?.dbUsers.addUser(User(userEmail: email, userPassword: password, userName: name, userType: userType, studentCredit: 0, studentCourses: [], studentImage: "teacherProfile" ))
                }
                if userType == "T"{
                    self?.dbUsers.addUser(User(userEmail: email, userPassword: password, userName: name, userType: userType))
                    
                    
                }
                
            }
           
        }
            
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    
}

struct SwiftUIView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var dbUsers: UserDB
    @State var isActiveSignIn : Bool = false
    @State var isActiveSignUp : Bool = false
    var body: some View {
        
        
        if isActiveSignIn && viewModel.isSignedIn{
            let id = Auth.auth().currentUser?.uid
            let user = user(id: id ?? "", users: dbUsers.users)
            if user.userType == "S"{
                StudentTabBar(user: user)
                
                
            }else  if user.userType == "T"{
                TeacherTabBar(user: user)
            }
            
        }else if viewModel.isSignedIn{
            LogoView(isActiveSignIn: $isActiveSignIn)
            
            
            
        }else if isActiveSignUp{
              
               WelcomePage()
           
           
    }else if viewModel.isSignedIn ==  false{
        LogoViewSignedOut(isActiveSignUp: $isActiveSignUp)
          
    }
         
        
        
        
        
    }
}
    
func user(id: String, users: [User]) -> User{
    var user : User = User()
        var userType = ""
        for i in users{
            if i.id == id {
                user  = i
                print("id: "+id)
                userType = user.userType ?? ""
            }
        }
        print("usertype is: "+userType)
       return user
    }


//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogoView().environment(\.layoutDirection, .rightToLeft)
//    }
//}

struct LogoView: View{
    @Binding var isActiveSignIn: Bool
    var body: some View{
        
        
        ZStack{
            Color("bg").ignoresSafeArea()
            
            
            
            VStack{
                
                VStack(spacing: -30){
                    
                    
                    Image("oval").ignoresSafeArea()
                    Spacer()
                    
                    
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( width: 440, height: 0, alignment: .bottom)
                    Spacer()
                    
                    
                }
                
                
                HStack{
                    
                    Text("ـــلها")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                    
                    Spacer()
                    
                    Text("أكمِـــ")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                    
                    
                    
                    
                }
                Spacer()
                
                
                
                VStack{
                    
                    Text("أكمِـلها")
                        .font(.system(size: 50))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.015, brightness: 0.432))
                        .background(Rectangle().frame( height: 13 ).foregroundColor(Color("pink")))
                    
                    Spacer()
                    Spacer()
                    
                    
                    
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.clear)
                        .cornerRadius(50)
                    }
                }
                
                Spacer()
                
                
             

                    
                Rectangle()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.clear)
                    .cornerRadius(50)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {

                        isActiveSignIn = true

                    }
                }
            }
            
            
            
            
        }
        
    }

struct LogoViewSignedOut: View{
    @Binding var isActiveSignUp: Bool
    var body: some View{
        
        
        ZStack{
            Color("bg").ignoresSafeArea()
            
            
            
            VStack{
                
                VStack(spacing: -30){
                    
                    
                    Image("oval").ignoresSafeArea()
                    Spacer()
                    
                    
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( width: 440, height: 0, alignment: .bottom)
                    Spacer()
                    
                    
                }
                
                
                HStack{
                    
                    Text("ـــلها")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                    
                    Spacer()
                    
                    Text("أكمِـــ")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                    
                    
                    
                    
                }
                Spacer()
                
                
                
                VStack{
                    
                    Text("أكمِـلها")
                        .font(.system(size: 50))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.015, brightness: 0.432))
                        .background(Rectangle().frame( height: 13 ).foregroundColor(Color("pink")))
                    
                    Spacer()
                    Spacer()
                    
                    
                    
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.clear)
                        .cornerRadius(50)
                    }
                }
                
                Spacer()
                
                
             

                    
                Rectangle()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.clear)
                    .cornerRadius(50)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {

                        isActiveSignUp = true

                    }
                }
            }
            
            
            
            
        }
        
    }



