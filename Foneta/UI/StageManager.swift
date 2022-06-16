//
//  StageManager.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation

protocol StageView {
    var data: StageData {get}
}

class StageManager {
    let stages: [StageView]

    subscript(stageIndex: Int) -> StageView {
        return stages[stageIndex]
    }
    subscript(stageId: String) -> StageView? {
        return stages.first(where: { $0.data.id == stageId })
    }
    
    init(_ stages: [StageView]) {
        self.stages = stages
    }
}
