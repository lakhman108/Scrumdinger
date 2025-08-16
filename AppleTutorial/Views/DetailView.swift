//
//  DetailView.swift
//  AppleTutorial
//
//  Created by parmar lakhman on 15/08/25.
//

import SwiftUI

struct DetailView: View {
    
    let scrum : DailyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting",systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("length",systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme",systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                
            }
            Section(header : Text("Attendees")) {
                ForEach(scrum.attendees) {
                    attendee in Label(attendee.name,systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit") {
                isPresentingEditView.toggle()
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack{
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView.toggle()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView.toggle()
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
