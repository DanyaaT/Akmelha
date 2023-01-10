

import SwiftUI

struct Camera_View: View {
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                Rectangle().ignoresSafeArea()
                    .cornerRadius(50)
                    .foregroundColor(Color("top")).ignoresSafeArea()
                    .frame(height:80)
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
                
            }    }
        

    }
    
  
}

struct Camera_View_Previews: PreviewProvider {
    static var previews: some View {
        Camera_View().environment(\.layoutDirection,.rightToLeft)
    }
}






