//
//  StageView.swift
//  WorldCup2022
//
//  Created by Alex Paul on 12/3/22.
//

import SwiftUI

struct StageView: View {
    let viewModel: FootballTeamViewModel
    let stageTitle: String

    var action: () -> Void

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Section {
            Button(action: action) {
                Text(stageTitle)
                    .frame(minHeight: 44)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(colorScheme == .dark ? .white : .fifaPurple)
                    .bold()
            }
        }
    }
}

struct StageView_Previews: PreviewProvider {
    static var previews: some View {
        StageView(
            viewModel: FootballTeamViewModel(),
            stageTitle: "Round of Sixteen",
            action: {}
        )
    }
}
