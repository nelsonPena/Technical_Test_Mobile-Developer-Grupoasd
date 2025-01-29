//
//  CharactersRepositoryType.swift
//  TheRickAndMorty
//
//  Created by Nelson Peña Agudelo on 28/01/25.
//

import Foundation
import Combine

protocol CharactersRepositoryType {
    func getCharacters() -> AnyPublisher<Characters.Response, DomainError>
}
