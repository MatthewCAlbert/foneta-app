//
//  LevelContent.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation

class LevelContent {
    
    public let shared = LevelContent()
    
    private init() {}
    
    let content: [LevelData] = [
        LevelData(
            id: "1",
            title: "sample",
            categories: ["alphabet"],
            stages: [
                StageData(id: "1")
            ],
            level: .easy
        )
    ]
    
}
