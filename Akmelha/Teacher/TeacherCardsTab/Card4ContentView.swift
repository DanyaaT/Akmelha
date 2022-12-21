//
//  Card4ContentView.swift
//  Akmelha
//
//  Created by Aldana on 21/12/2022.
//

import SwiftUI

struct Card4ContentView: View {
    @State var generatedImage: Image?
    @State var generatedPDFURL:URL?
    @State var showShareLink: Bool = false
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ZStack(alignment : .top){
                //for each card change this line
                    Card4View()
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
            //for each card change this line
        let renderer = ImageRenderer(content: Card4View().frame(width : viewSize.width , height : viewSize .height , alignment : .center ))
            if let image = renderer.uiImage{
                generatedImage = Image(uiImage: image)
            }
            
            //Generating PDF
            //for each card change this line
            let renderer_PDF = ImageRenderer(content: Card4ViewPDF().frame(width : viewSize.width , height : viewSize .height , alignment : .center ))
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

struct Card4ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Card4ContentView().environment(\.layoutDirection, .rightToLeft)
    }
}


///Card 4

//card 4 pdf view
struct Card4ViewPDF: View {
 var body: some View {
    
      VStack{
          Spacer()
          HStack{
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
          HStack{
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
          HStack{
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
              
              Image("purpleCard")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:150 , height: 250)
          }
      }
 }
}

//card 4 png view
struct Card4View: View {
 var body: some View {
     
     Image("purpleCard")
         .resizable()
         .aspectRatio(contentMode: .fit)
         .frame(width:360 , height: 400)
  
 }
}

