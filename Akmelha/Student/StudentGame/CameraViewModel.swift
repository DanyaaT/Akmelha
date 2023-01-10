//
//  CameraViewModel.swift
//  Akmelha
//
//  Created by H on 13/06/1444 AH.
//

import SwiftUI
import AVFoundation


struct CameraViewModel: View {
    @StateObject var camera = CameraModel()

    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                Rectangle()
                    .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                    .foregroundColor(Color("top")).ignoresSafeArea()
                    .frame(height:40)
                Spacer()
              

                
                Text("وجه الكاميرا نحو بطاقة النقاط")
                    .font(.system(size: 35))
                    .foregroundColor(Color("title"))
                    .frame(alignment: .center)
                Spacer()

                ZStack{
                    Rectangle()
                        .frame(width: 350,height:450)
                        .cornerRadius(50)
                        .foregroundColor(Color(red: 0.947, green: 0.937, blue: 0.916))
                        .frame(alignment: .center)

                    CameraView()
                        .frame(width: 350,height:450)
                        .frame(alignment: .center)
                        .cornerRadius(50)

                    
                }
                Spacer()

               Spacer()

                
//                if !camera.isTaken {
//                  Button(action: camera.TakePic, label:{
//
//                        ZStack{
//                            Circle()
//                                .fill(Color("green"))
//                                .frame(width: 65,height: 65)
//
//                            Circle()
//                                .stroke(Color("green"), lineWidth: 2)
//                                .frame(width: 75,height: 75)
//
//                        }
//
//                   })
//                    Spacer()
//
//               }

                
                
                
                
            }    }
        
    }
}
    
struct CameraViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CameraViewModel().environment(\.layoutDirection,.rightToLeft)
    }
}

struct CameraView: View {

    @StateObject var camera = CameraModel()
     
    var body: some View {
        ZStack{
           CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            VStack{
              

                if camera.isTaken{

                        Button (action: camera.reTakePic , label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            Spacer()
                           
                        }).padding(.all).padding(.leading)
                   Spacer()

                    
                }
                 
                
//                if we want saved the photo
//                VStack{
//                    if camera.isTaken{
//                        Button (action: {if !camera.isSaved{camera.savPic()}}, label: {
//                            Text(camera.isSaved ? "تم الحفظ" : "حفظ")
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .padding(.vertical,10)
//                                .padding(.horizontal,20)
//                                .background(Color.white)
//                                .clipShape(Capsule())
//                        }).padding(.leading)
//Spacer()
//                    }
                
//                    while camera running
                    else{
                        Spacer()
                        
                        Button(action: camera.TakePic, label:{
                            ZStack{
                                Circle()
                                    .fill(Color("green"))
                                    .frame(width: 65,height: 65)

                                Circle()
                                    .stroke(Color("green"), lineWidth: 2)
                                    .frame(width: 75,height: 75)

                            }

                        }).padding(.all)
                        

                   }

//                }
//                .frame(height: 75)
            }
        }
        .onAppear {
            camera.Check()
        }
    }
}

class CameraModel : NSObject,ObservableObject,AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alrt = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    func Check(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for:.video){
                (status) in
                if status{
                    self.setUp()
                }
            }
            
        case .denied:
            self.alrt.toggle()
            return
            
        default:
            return
            
        }
        
        
    }
    
    func setUp (){
        do{
            
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func TakePic(){
        DispatchQueue.global(qos: .background).async {
            
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
        
    }
    
    func reTakePic(){
        DispatchQueue.main.async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
               
                self.isSaved = false
            }
        }
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto,  error: Error?) {
        if error != nil {
            return
        }
        print("تم أخذ الصورة...")
        
        guard let imageDate = photo.fileDataRepresentation()
        else{
            return
        }
        
        self.picData = imageDate
    }
    
    func savPic(){
        let image = UIImage(data: self.picData)!
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        self.isSaved = true
        print("تم حفظ الصورة")
    }
}


struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera : CameraModel

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)

        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame

        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)

        camera.session.startRunning()


return view

    }
    func updateUIView(_ uiView: UIView, context: Context) {
        

    }
}


