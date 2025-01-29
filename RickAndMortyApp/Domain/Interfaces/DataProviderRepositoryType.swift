//
//  DataProviderType.swift
//  TheRickAndMorty
//
//  Created by Nelson Geovanny Pena Agudelo on 15/10/23.
//

import Foundation
import Combine

protocol DataProviderRepositoryType {
    var savedCharactersPublisher: Published<[CharactersEntity]>.Publisher { get }
    func addCharacters(characters: [CharacterListPresentableItem]) 
    func delete(_ CharactersToDelete: CharactersEntity)
    func deleteAll()
}
