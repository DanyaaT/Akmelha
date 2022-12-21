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
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.sync {
                self?.signedIn = true
            }
           
        }
        
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil
            
            else{
                print(error)
                return
            }
            DispatchQueue.main.sync {
                self?.signedIn = true
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
    var body: some View {
        
        NavigationView{
            if viewModel.isSignedIn{
                VStack{
                    Text("You are signed in")
                    Button("Sign Out"){
                        viewModel.signOut()
                    }.foregroundColor(.red)
                }
                
            }else{
                WelcomePage()
            }
            
        }.onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
