//
//  FootballTeamViewModel.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 11/28/22.
//

import Foundation

final class FootballTeamViewModel: ObservableObject {
    @Published var teams: [FootballTeam] = []

    static var mockData: [FootballTeam] {
        [
            .init(country: "Brazil",
                  flag: "🇧🇷",
                  group: "G",
                  roundOfSixteen: true,
                  quarterFinal: false),
            .init(country: "Spain",
                  flag: "🇪🇸",
                  group: "E",
                  roundOfSixteen: true,
                  quarterFinal: false),
            .init(country: "Canada",
                  flag: "🇨🇦",
                  group: "F",
                  roundOfSixteen: false,
                  quarterFinal: false),
            .init(country: "France",
                  flag: "🇫🇷",
                  group: "D",
                  roundOfSixteen: true,
                  quarterFinal: false)
        ]
    }

    init() {
        fetchTeams()
    }

    func fetchTeams() {
        let results: WorldCup = Bundle.parse("worldCupTeams", fileExtension: "json")
        // https://www.donnywals.com/xcode-14-publishing-changes-from-within-view-updates-is-not-allowed-this-will-cause-undefined-behavior/
        teams = results.teams.sorted { $0.country < $1.country }
    }

    func remove(at offsets: IndexSet) {
        teams.remove(atOffsets: offsets)
    }

    func move(at offsets: IndexSet, to newIndex: Int) {
        teams.move(fromOffsets: offsets, toOffset: newIndex)
    }

    func filter(by group: String) {
        fetchTeams()
        teams = teams.filter { $0.group == group }
    }

    func filterRoundOfSixteen() {
        fetchTeams()
        // https://www.donnywals.com/xcode-14-publishing-changes-from-within-view-updates-is-not-allowed-this-will-cause-undefined-behavior/
        teams = teams.filter { $0.roundOfSixteen }
    }

    func filterQuarterRounds() {
        fetchTeams()
        teams = teams.filter { $0.quarterFinal }
    }
}
