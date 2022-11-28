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
            .init(country: "Brazil", flag: "🇧🇷", group: "G", roundOfSixteen: true),
            .init(country: "Spain", flag: "🇪🇸", group: "E", roundOfSixteen: true),
            .init(country: "Canada", flag: "🇨🇦", group: "F", roundOfSixteen: false),
            .init(country: "France", flag: "🇫🇷", group: "D", roundOfSixteen: true)
        ]
    }

    init() {
        fetchTeams()
    }

    func fetchTeams() {
        let results: WorldCup = Bundle.parse("worldCupTeams", fileExtension: "json")
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
        teams = teams.filter { $0.roundOfSixteen }
    }
}
