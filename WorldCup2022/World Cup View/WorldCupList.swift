//
//  WorldCupList.swift
//  WorldCup2022
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

struct WorldCupList: View {
    @EnvironmentObject var viewModel: FootballTeamViewModel

    var body: some View {
        Section {
            ForEach(viewModel.teams, id: \.self) { team in
                HStack(alignment: .center, spacing: 20) {
                    Text(team.flag)
                        .font(.largeTitle)
                    Text(team.country)
                }
            }
            .onDelete(perform: onDelete)
            .onMove(perform: move)
        }
    }

    private func move(at offsets: IndexSet, to newIndex: Int) {
        viewModel.move(at: offsets, to: newIndex)
    }

    private func onDelete(at offsets: IndexSet) {
        viewModel.remove(at: offsets)
    }
}

struct WorldCupList_Previews: PreviewProvider {
    static var previews: some View {
        WorldCupList()
            .environmentObject(FootballTeamViewModel())
    }
}
