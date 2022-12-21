//
//  Card3ContentView.swift
//  Akmelha
//
//  Created by Aldana on 21/12/2022.
//

import SwiftUI

struct Card3ContentView: View {
    @State var generatedImage: Image?
    @State var generatedPDFURL:URL?
    @State var showShareLink: Bool = false
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ZStack(alignment : .top){
                
                    Card3View()
                        .padding(.vertical)
                        .padding(.vertical)
                        .padding(.vertical)
                        .padding(.vertical)
                        .padding(.vertical)
                        .padding(.vertical)
                       
                    HStack(spacing:10){
                        
                        Spacer()
                        
                        if let generatedImage{
                            ShareLink(item: generatedImage  , preview: SharePreview("cards")){
                                Image(systemName: "square.and.arrow.up")
                                
                            }
                        }
                        
                     /*   if let generatedPDFURL{
                            ShareLink(item: generatedPDFURL  , preview: SharePreview("cards")){
                                Image(systemName: "arrow.up.doc")
                                
                                
                            }
                        }*/
                        
                        if let _ = generatedPDFURL{
                           
                            Button {
                                showShareLink.toggle()
                            }label: {
                                Image(systemName: "arrow.up.doc")
                                    .font(.title3)
                            }
                        }
                        
                    }.foregroundColor(.gray)
                        .padding()
               
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline:.now() + 0.5){
                    renderView(viewSize: size)
                }
            }//onappear closer
        }
       
        .sheet(isPresented:$showShareLink)
        {
            if let generatedPDFURL{
                ShareSheet(items: [generatedPDFURL])
            }
        }
        
    }//body
       @MainActor
        func renderView( viewSize : CGSize ){
        let renderer = ImageRenderer(content: Card3View().frame(width : viewSize.width , height : viewSize .height , alignment : .center ))
            if let image = renderer.uiImage{
                generatedImage = Image(uiImage: image)
            }
            
            //Generating PDF
            let renderer_PDF = ImageRenderer(content: Card3ViewPDF().frame(width : viewSize.width , height : viewSize .height , alignment : .center ))
            let tempURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask )[0]
            let renderURL = tempURL.appending(path : "\(UUID().uuidString).pdf")

            if let consumer = CGDataConsumer(url: renderURL as CFURL),let context =
                CGContext(consumer: consumer, mediaBox: nil, nil){
                renderer_PDF.render { size ,renderer_PDF in
                    var mediaBox = CGRect(origin: .zero , size : size)
                    
                    //Drawing PDF
                    
                    context.beginPage(mediaBox: &mediaBox )
                    renderer_PDF(context)
                    context.endPDFPage()
                    context.closePDF()
                    
                    //updating PDF URL
                    generatedPDFURL = renderURL
                    
                    
                }
            }
            
            
        }//func

    }

struct Card3ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Card3ContentView().environment(\.layoutDirection, .rightToLeft)
    }
}


///Card 3

//card 3 pdf view
struct Card3ViewPDF: View {
 var body: some View {
    
      VStack{
          Spacer()
          HStack{
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
          HStack{
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
          HStack{
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("orangeCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
      }
 }
}

//card 3 png view
struct Card3View: View {
 var body: some View {
     
     Image("orangeCard")
         .resizable()
         .aspectRatio(contentMode: .fit)
         .frame(width:360 , height: 400)
  
 }
}
