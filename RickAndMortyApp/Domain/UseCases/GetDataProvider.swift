//
//  DelectedCharacters.swift
//  TheRickAndMorty
//
//  Created by Nelson Geovanny Pena Agudelo on 15/10/23.
//

import Foundation
import Combine

/// `DataProvider` es una clase de la capa de dominio que gestiona la lógica relacionada con las los personajes  que se deben  almacenar.

class DataProvider {
    
    private let formatter = DateFormatter()
    private let model: DataLayerRepository
    private var cancellables = Set<AnyCancellable>()
    
    /// Una propiedad publicada que emite un array de objetos `SavedCharacters`.
    @Published var characters: [SavedCharacters] = []
    
    /// Inicializa una nueva instancia de `DataProvider` con un modelo de capa de datos personalizado.
    ///
    /// - Parameters:
    ///   - model: El modelo de capa de datos que se utilizará para acceder y gestionar las los personajes .
    init (model: DataLayerRepository) {
        formatter.dateStyle = .medium
        self.model = model
        load()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    // MARK: Private functions
    
    /// Carga  los personajes  desde el modelo de capa de datos y las asigna a la propiedad publicada `Characters`.
    private func load() {
        self.model.$characters
            .map({ characters -> [SavedCharacters] in
                characters.map { SavedCharacters(characterId: $0.characterId ,
                                                 id:  $0.id,
                                                 name:  $0.name,
                                                 species:  $0.species,
                                                 gender: $0.gender,
                                                 originName: $0.originName,
                                                 locationName: $0.locationName,
                                                 image: $0.image,
                                                 created: $0.created,
                                                 status: $0.status) }
            })
            .replaceError(with: [])
            .assign(to: \.characters, on: self)
            .store(in: &cancellables)
    }
    
    // MARK: Public functions
    
    /// Elimina todas los personajes .
    func deleteAllCharacters() {
        model.deleteAllCharacters()
    }
    
    /// Agrega un nuevo personaje con un identificador específico.
    ///
    /// - Parameters:
    ///   - CharacterId: El identificador de el personaje que se va a agregar.
    func addCharacters(characters: [CharacterListPresentableItem]) {
        model.addCharacters(characters: characters)
    }
    
    /// Elimina un personaje con un identificador UUID específico.
    ///
    /// - Parameters:
    ///   - id: El identificador UUID de el personaje que se va a eliminar.
    func deleteCharacter(id: UUID) {
        if let CharacterToDelete = model.characters.filter({ id == $0.id }).first {
            model.delete(CharacterToDelete)
        }
    }
}
