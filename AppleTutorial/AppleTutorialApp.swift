//
//  AppleTutorialApp.swift
//  AppleTutorial
//
//  Created by parmar lakhman on 14/08/25.
//

import SwiftUI

@main
struct AppleTutorialApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
