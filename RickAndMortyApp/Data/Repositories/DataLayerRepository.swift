//
//  DataLayer.swift
//  TheRickAndMorty
//
//  Created by Nelson Peña Agudelo on 28/01/25.
//

import Foundation
import Combine

/// `DataLayerRepository` es un repositorio de capa de datos que gestiona la interacción con los datos de personajes en la capa de persistencia.

class DataLayerRepository {
        
    private let dataProvider: DataProviderRepositoryType
    private var cancellables = Set<AnyCancellable>()
    
    /// Una matriz de personajes presentados como entidades de la capa de persistencia.
    @Published var characters: [CharactersEntity] = []
    
    /// Inicializa una nueva instancia de `DataLayerRepository` con un proveedor de datos de capa de persistencia.
    ///
    /// - Parameters:
    ///   - provider: El proveedor de datos de capa de persistencia que se utilizará para interactuar con los datos de los personajes  a eliminar.
    init(provider: DataProviderRepositoryType) {
        self.dataProvider = provider
        setup()
    }
    
    // MARK: Private functions
    private func setup() {
        self.dataProvider.savedCharactersPublisher
            .assign(to: \.characters, on: self)
            .store(in: &cancellables)
    }
    
    // MARK: Public functions
    
    /// Agrega listado de personajes en cache.
    ///
    /// - Parameters:
    ///   - characters: listado de registros a crear
    func addCharacters(characters: [CharacterListPresentableItem]) {
        dataProvider.addCharacters(characters: characters)
    }
    
    /// Elimina un personajesde la lista de los personajes  a eliminar.
    ///
    /// - Parameters:
    ///   - Character: La entidad de personaje a eliminar que se va a eliminar de la lista.
    func delete(_ character: CharactersEntity) {
        dataProvider.delete(character)
    }
    
    /// Elimina todas los personajes.
    func deleteAllCharacters() {
        dataProvider.deleteAll()
    }
}
