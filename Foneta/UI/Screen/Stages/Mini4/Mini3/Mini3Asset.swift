//
//  Mini3Asset.swift
//  Foneta
//
//  Created by Evan Susanto on 24/06/22.
//

import SwiftUI
struct ImageContentMini3: Hashable {
    let id = UUID()
    var name: String?
    init(name: String) {
        self.name = name
    }
}

let imageContentMini3: [String: ImageContent] = [
    "apel": ImageContent(name: "Apel"),
    "buku": ImageContent(name: "Buku"),
    "cabai": ImageContent(name: "Cabai"),
    "domba": ImageContent(name: "Domba"),
    "es krim": ImageContent(name: "Es Krim"),
    "fosil": ImageContent(name: "Fosil"),
    "gergaji": ImageContent(name: "Gergaji"),
    "hiu": ImageContent(name: "Hiu"),
    "istana": ImageContent(name: "Istana"),
    "jendela": ImageContent(name: "Jendela"),
    "kambing": ImageContent(name: "Kambing"),
    "lebah": ImageContent(name: "Lebah"),
    "mobil": ImageContent(name: "Mobil"),
    "nangka": ImageContent(name: "Nangka"),
    "otak": ImageContent(name: "Otak"),
    "pisang": ImageContent(name: "Pisang"),
    "quokka": ImageContent(name: "Quokka"),
    "rambutan": ImageContent(name: "Rambutan"),
    "semangka": ImageContent(name: "Semangka"),
    "topi": ImageContent(name: "Topi"),
    "ubi": ImageContent(name: "Ubi"),
    "venus": ImageContent(name: "Venus"),
    "woll": ImageContent(name: "Woll"),
    "xerus": ImageContent(name: "Xerus"),
    "yoghurt": ImageContent(name: "Yoghurt"),
    "zebra": ImageContent(name: "Zebra")
]


