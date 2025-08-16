//
//  DetailEditView.swift
//  AppleTutorial
//
//  Created by parmar lakhman on 15/08/25.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum : DailyScrum
    
    @State private var attendeeName = ""
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble,in: 5...30,step: 1) {
                        Text("length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) in minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendess")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete{
                    indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("Add Attendee",text: $attendeeName)
                    Button( action : {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendees")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
   @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum)
}
