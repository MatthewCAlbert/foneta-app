//
//  LevelData.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation

enum LevelEnum {
    case easy, medium, hard
}

struct LevelData {
    var id: String // generated
    var title: String
    var categories: [String]
    var stages: [StageData]
    var level: LevelEnum
}
