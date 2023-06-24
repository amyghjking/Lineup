//
//  LineupDetail.swift
//  Lineup
//
//  Created by Amy King on 23/06/23.
//

import SwiftUI

struct LineupDetail: View {
    var lineup: Lineup
    
    var body: some View {
        VStack {
            Text(lineup.name)
                .font(.title)
            lineup.image
                .resizable()
                .border(Color.black, width: 1)
                .padding()
        }
        Spacer()
    }
}

struct LineupDetail_Previews: PreviewProvider {
    static var previews: some View {
        LineupDetail(lineup: lineups[0])
    }
}
