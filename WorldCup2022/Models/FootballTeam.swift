//
//  FootballTeam.swift
//  WorldCup2022
//
//  Created by Alex Paul on 11/28/22.
//

import Foundation

struct WorldCup: Decodable {
    let teams: [FootballTeam]
}

struct FootballTeam: Decodable, Hashable {
    let country: String
    let flag: String
    let group: String
    let roundOfSixteen: Bool
    let quarterFinal: Bool
    let semiFinal: Bool
}
