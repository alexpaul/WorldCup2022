//
//  WorldCupView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

struct WorldCupView: View {
    @EnvironmentObject var viewModel: FootballTeamViewModel

    var body: some View {
        NavigationStack {
            List {
                GroupList()
                    .environmentObject(viewModel)
                StageView(viewModel: viewModel, stageTitle: "Round of Sixteen") {
                    viewModel.filterRoundOfSixteen()
                }
                StageView(viewModel: viewModel, stageTitle: "Quarter Finals") {
                    viewModel.filterQuarterRounds()
                }
                WorldCupList()
                    .environmentObject(viewModel)
            }
            .scrollIndicators(.hidden)
            .listStyle(.insetGrouped)
            .navigationTitle("World Cup 2022")
            .toolbar {
                EditButton()
            }
        }
        .refreshable {
            viewModel.fetchTeams()
        }
    }
}

struct WorldCupView_Previews: PreviewProvider {
    static var previews: some View {
        WorldCupView()
            .environmentObject(FootballTeamViewModel())
    }
}




