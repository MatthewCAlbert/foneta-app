import Foundation
import SwiftUI
struct ImageContent:Hashable {
    let id=UUID()
    var name:String?
    var firstLetter:Character?
    init(name: String) {
        self.name = name
        self.firstLetter = name.first
        }
}
let mini4Asset:[String:ImageContent] = [
    "ayam" : ImageContent(name: "Ayam"),
    "bola" : ImageContent(name: "Bola"),
    "cacing" : ImageContent(name: "Cacing"),
    "domba" : ImageContent(name: "Domba"),
    "elang" : ImageContent(name: "Elang"),
    "foto" : ImageContent(name: "Foto"),
    "gajah" : ImageContent(name: "Gajah"),
    "harimau" : ImageContent(name: "Harimau"),
    "ikan" : ImageContent(name: "Ikan"),
    "jerapah" : ImageContent(name: "Jerapah"),
    "kucing" : ImageContent(name: "Kucing"),
    "lemon" : ImageContent(name: "Lemon"),
    "monyet" : ImageContent(name: "Monyet"),
    "nyamuk" : ImageContent(name: "Nyamuk"),
    "obat" : ImageContent(name: "Obat"),
    "panda" : ImageContent(name: "Panda"),
    "quran" : ImageContent(name: "Quran"),
    "rusa" : ImageContent(name: "Rusa"),
    "sapi" : ImageContent(name: "Sapi"),
    "tikus" : ImageContent(name: "Tikus"),
    "udang" : ImageContent(name: "Udang"),
    "vas" : ImageContent(name: "Vas"),
    "wortel" : ImageContent(name: "Wortel"),
    "xilofon" : ImageContent(name: "Xilofon"),
    "yoyo" : ImageContent(name: "Yoyo"),
    "zebra" : ImageContent(name: "Zebra")
]
