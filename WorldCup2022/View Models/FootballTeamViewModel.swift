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
            .init(country: "Brazil", flag: "🇧🇷", group: "G"),
            .init(country: "Spain", flag: "🇪🇸", group: "E"),
            .init(country: "France", flag: "🇫🇷", group: "D")
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
}
