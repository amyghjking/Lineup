//
//  LineupList.swift
//  Lineup
//
//  Created by Amy King on 23/06/23.
//

import SwiftUI

struct LineupList: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    /* list each lineup matching search results. If search is empty shows all lineups
                     */
                    ForEach(searchResults, id : \.self) {
                        lineup in NavigationLink {
                            LineupDetail(lineup: lineup)
                        } label: {
                            LineupRow(lineup: lineup)
                        }
                    }
                    .onDelete {
                        // fix on delete so deletes this lineup from the json file
                        index in lineups.remove(atOffsets: index)
                    }
                    .onTapGesture {}.onLongPressGesture(minimumDuration: 0.1) {
                        // show a preview of the image
                        print("long press")
                    }
                    
                }
                .navigationTitle("Lineups")
                
                Button(action: addLineup) {
                    Text("New Lineup")
                        .foregroundColor(Color.blue)
                        .bold()
                }
                
                Spacer()
            }
        }
        .searchable(text: $searchText)
    }
    
    
    var searchResults: [Lineup] {
        if searchText.isEmpty {
            return lineups
        } else {
            return lineups.filter {$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    
}

struct LineupList_Previews: PreviewProvider {
    static var previews: some View {
        LineupList()
    }
}
