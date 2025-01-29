//
//  CharacterListDetailViewData.swift
//  TheRickAndMorty
//
//  Created by Nelson Geovanny Pena Agudelo on 16/10/23.
//

import Foundation
import SwiftUI

struct CharacterDetailViewData: Hashable, Identifiable {
    let id: UUID
    let detail: CharacterListPresentableItem
    let dataProvider: DataProvider

    init(detail: CharacterListPresentableItem, dataProvider: DataProvider) {
        self.id = UUID()
        self.detail = detail
        self.dataProvider = dataProvider
    }

    static func == (lhs: CharacterDetailViewData, rhs: CharacterDetailViewData) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

