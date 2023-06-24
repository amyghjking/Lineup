//
//  RemoveLineup.swift
//  Lineup
//
//  Created by Amy King on 24/06/23.
//  Removing a lineup in the json file

import Foundation
import SwiftUI

func removeLineup(index: IndexSet) {
    do {
        
        lineups.remove(atOffsets: index)
        
        // encode the updated data structure back into json
        let updatedLineups = try JSONEncoder().encode(lineups)
        
        guard let file = Bundle.main.url(forResource: "lineupData.json", withExtension: nil)
            else {
                fatalError("Couldn't find lineupData.json in main bundle.")
        }
        
        // save json data back to the file
        try updatedLineups.write(to: file)
        
    } catch {
        fatalError("Couldn't parse add new lineup")
    }
    
}
