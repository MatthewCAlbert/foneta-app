//
//  SampleStageView.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import SwiftUI

struct SampleStageView: View, StageView {
    let data: StageData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SampleStageView_Previews: PreviewProvider {
    static var previews: some View {
        SampleStageView(
            data: StageData(id: "1")
        )
    }
}
