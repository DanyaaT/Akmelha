//
//  EventFormView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct EventFormView: View {

    @EnvironmentObject var eventStore: EventStore
    @StateObject var viewModel: EventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    @State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]
    @State var courses: [String] = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية المهنية","التربية الفنية","التفكير الناقد",]
    @State var selectedCourse = 0

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("العنوان", text: $viewModel.note, axis: .vertical)
                        .focused($focus, equals: true)
                    TextField("الوصف", text: $viewModel.note, axis: .vertical)
                    Section {
                        DatePicker(selection: $viewModel.date , displayedComponents:[.date])
                            {
                            Text("التاريخ")
                            
                            }.environment(\.calendar, Calendar(identifier: .islamicUmmAlQura))
                            .environment(\.locale, Locale.init(identifier: "ar_SA"))
                            .tint(.gray)
                    }

                    Section{
                        Picker(selection: $viewModel.section, label: Text("الصف الدراسي")){
                            Text("").tag("")
                            ForEach(levels, id:\.self){ level in
                                Text(level)
                                    .tag(level)
                            } //foreach
                        } // end picker

                    }
                    Section {
                        Picker(selection: $viewModel.subject, label: Text("اسم المادة")){
                            Text("").tag("")
                            ForEach(courses, id:\.self){ course in
                                Text(course)
                                    .tag(course)
                            }// foreach
                        }// end picker
                    }

       
            
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewModel.updating {
                                // update this event
                                let event = Eventt(id: viewModel.id!,
                                                  date: viewModel.date,
                                                  note: viewModel.note,
                                                  section: viewModel.section,
                                                  describtion: viewModel.describtion,
                                                  subject: viewModel.subject)
                                eventStore.update(event)
                            } else {
                                // create new event
                                let newEvent = Eventt(id: viewModel.id!,
                                                     date: viewModel.date,
                                                     note: viewModel.note,
                                                     section: viewModel.section,
                                                     describtion: viewModel.describtion,
                                                     subject: viewModel.subject)
                                eventStore.add(newEvent)
                            }
                            dismiss()
                        } label: {
                            Text(viewModel.updating ? "تحديث" :"اضافة")
                        }
                        .buttonStyle(.borderedProminent)
                        .background(Color("add"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
      
            }
            .environment(\.layoutDirection,.rightToLeft)
            .navigationTitle(viewModel.updating ? "تحديث حدث" : "اضافة حدث جديد")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                focus = true
            }
        }
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventFormViewModel())
            .environmentObject(EventStore())
            .environment(\.layoutDirection,.rightToLeft)

    }
}
