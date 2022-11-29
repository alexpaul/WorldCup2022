//
//  WorldCupView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

struct WorldCupView: View {
    @EnvironmentObject var viewModel: FootballTeamViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationStack {
            List {
                GroupList()
                    .environmentObject(viewModel)
                Section {
                    Button(action: {
                        viewModel.filterRoundOfSixteen()
                    }) {
                        Text("Round of Sixteen")
                            .frame(minHeight: 44)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(colorScheme == .dark ? .white : .fifaPurple)
                            .bold()
                    }
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




