//
//  LineupList.swift
//  Lineup
//
//  Created by Amy King on 23/06/23.
//

import SwiftUI
import Combine

struct LineupList: View {
    
    @State private var searchText = ""
    @State private var searchResults: [Lineup] = lineups
    
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
                }
                .navigationTitle("Lineups")
                

                Button(action: {
                    addLineup()
                    updateSearchResults()
                }) {
                    Text("New Lineup")
                        .foregroundColor(Color.blue)
                        .bold()
                }
                
            }
        }
        .searchable(text: $searchText)
        .onReceive(Just(searchText)) { _ in
                    updateSearchResults()
                }
    }
     
    func updateSearchResults() {
        if searchText.isEmpty {
            searchResults = lineups
        } else {
            searchResults = lineups.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct LineupList_Previews: PreviewProvider {
    static var previews: some View {
        LineupList()
    }
}

