//
//  NotificationView.swift
//  welcomPages
//
//  Created by H on 06/06/1444 AH.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            
            VStack{
                ZStack{
                    
                    
                    Rectangle()
                        .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                        .foregroundColor(Color("top")).ignoresSafeArea()
                        .frame(height:90)
                 
                    VStack{
                        
                        Text("\n"+"التنبيهات")
                            .font(.system(size: 35))
                            .foregroundColor(Color("title"))
                    }// Vstack
                }//Zstac
           
                
                ScrollView{
                    
                    // Date of alarm
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.91))
                            .cornerRadius(10)
                            .frame( height: 43)
                        
                            
                            HStack{
                                Spacer()
                                
                                ZStack{
                                    Image("calendar")
                                        .frame(width: 30)
                                    Spacer()
                                    
                                }
                                Text("الأحد ١٤٤٤/٦/١٥")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                    }.padding(.horizontal)
                    
                    // The alarm
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 80).background(Color.white).shadow(radius: 0.6)
                        VStack{
                       
                            HStack{
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("تسليم مطوية العلوم")
                                            .font(.title3)
                                        Spacer()

                                    }
                                    HStack{
                                        Text("التاريخ: ١٤٤٤/٧/١٨").font(.title3)
                                        Spacer()

                                    }
                                    
                                }.padding(.bottom, 5.0)
                                
                           

                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10) .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.91))
                                            .frame( width: 50,height: 80,alignment: .trailing)
                                        VStack{
                                            Image("alarm")
                                                .frame(width: 50)
                                            Text("٩:١٤م")
                                            
                                        }
                                    }.padding(-15)
                            }

                           
                        }.padding()
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 80).background(Color.white).shadow(radius: 0.6)
                        VStack{
                       
                            HStack{
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("اختبار الرياضيات")
                                            .font(.title3)
                                        Spacer()

                                    }
                                    HStack{
                                        Text("التاريخ: ١٤٤٤/٩/١").font(.title3)
                                        Spacer()

                                    }
                                    
                                }.padding(.bottom, 5.0)
                                
                           

                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10) .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.91))
                                            .frame( width: 50,height: 80,alignment: .trailing)
                                        VStack{
                                            Image("alarm")
                                                .frame(width: 50)
                                            Text("١٠:٠٠ص")
                                            
                                        }
                                    }.padding(-15)
                            }

                           
                        }.padding()
                    }.padding(.horizontal)
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.91))
                            .cornerRadius(10)
                            .frame( height: 43)
                        
                            
                            HStack{
                                Spacer()
                                
                                ZStack{
                                    Image("calendar")
                                        .frame(width: 30)
                                    Spacer()
                                    
                                }
                                Text("الخميس ١٤٤٤/٥/٣٠")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                    }.padding(.horizontal)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 80).background(Color.white).shadow(radius: 0.6)
                        VStack{
                       
                            HStack{
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("مشروع اللغة الإنجليزية")
                                            .font(.title3)
                                        Spacer()

                                    }
                                    HStack{
                                        Text("التاريخ: ١٤٤٤/١/١١").font(.title3)
                                        Spacer()

                                    }
                                    
                                }.padding(.bottom, 5.0)
                                
                           

                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10) .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.91))
                                            .frame( width: 50,height: 80,alignment: .trailing)
                                        VStack{
                                            Image("alarm")
                                                .frame(width: 50)
                                            Text("٩:١٤م")
                                            
                                        }
                                    }.padding(-15)
                            }

                           
                        }.padding()
                    }.padding(.horizontal)
                    
                    
                    
                    
                    
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView().environment(\.layoutDirection, .rightToLeft)
    }
}
