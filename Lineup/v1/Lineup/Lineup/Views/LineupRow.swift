//
//  LineupRow.swift
//  Lineup
//
//  Created by Amy King on 23/06/23.
//

import SwiftUI

struct LineupRow: View {
    var lineup: Lineup
    
    var body: some View {
        HStack {
            lineup.image
                .resizable()
                .frame(width: 50, height: 50)
                .border(Color.black, width: 1)
            Text(lineup.name)
            Spacer()
            
        }
    }
}

struct LineupRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineupRow(lineup: lineups[0])
            LineupRow(lineup: lineups[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
