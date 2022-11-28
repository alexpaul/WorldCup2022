//
//  WorldCup2022App.swift
//  WorldCup2022
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

@main
struct WorldCup2022App: App {
    @StateObject var viewModel = FootballTeamViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
