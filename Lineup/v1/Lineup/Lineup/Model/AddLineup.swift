//
//  AddLineup.swift
//  Lineup
//
//  Created by Amy King on 24/06/23.
//  creating and adding a new lineup to the json file
//

import Foundation
import SwiftUI

func addLineup() {
    
    do {
        var lastId = 0
        if let lastLineup = lineups.last {
            lastId = lastLineup.id
        }
        let newLineup = Lineup(id: lastId+1, name: "new", imageName: "blank")
        lineups.append(newLineup)
        
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
