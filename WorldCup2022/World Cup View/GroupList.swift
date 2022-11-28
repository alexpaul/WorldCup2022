//
//  GroupList.swift
//  WorldCup2022
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

struct GroupList: View {
    @EnvironmentObject var viewModel: FootballTeamViewModel

    @State private var isSelected = ""

    private let groups = [
        "A","B","C","D","E","F","G","H"
    ]

    private let diameter: Double = 40

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(groups, id: \.self) { group in
                        ZStack {
                            Circle()
                                .frame(width: diameter, height: diameter)
                                .foregroundColor(isSelected == group ? .fifaBlue : .fifaPurple)
                            Text(group)
                                .foregroundColor(.white)
                                .font(.headline)
                                .bold()
                        }
                        .onTapGesture {
                            viewModel.filter(by: group)
                            isSelected = group
                        }
                    }
                }
            }
            .frame(height: diameter)
        }
    }
}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList()
            .environmentObject(FootballTeamViewModel())
    }
}

extension Color {
    static let fifaPurple = Color(red: 73/255, green: 11/255, blue: 89/255)
    static let fifaGray = Color(red: 58/255, green: 60/255, blue: 63/255)
    static let fifaBlue = Color(red: 45/255, green: 103/255, blue: 211/255)
}
