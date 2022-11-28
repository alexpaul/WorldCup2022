//
//  ContentView.swift
//  WorldCup2022
//
//  Created by Alex Paul on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: FootballTeamViewModel
    
    var body: some View {
        WorldCupView()
            .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FootballTeamViewModel())
    }
}
