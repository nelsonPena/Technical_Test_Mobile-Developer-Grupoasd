//
//  CharacterDetailViewModel.swift
//  TheRickAndMorty
//
//  Created by Nelson Peña Agudelo on 28/01/25.
//

import Foundation
import Combine
import CoreData

/// `CharacterDetailViewModel` es un ViewModel observable que maneja la lógica relacionada con la gestión de la interfaz de usuario para la vista de detalles de los personajes .

class CharacterDetailViewModel: ObservableObject, Hashable, Identifiable {
    
    /// Una propiedad publicada que indica si se debe mostrar un indicador de carga.
    @Published var showLoadingSpinner: Bool = false
    
    
    let id = UUID()
    private let getCharactersListType: GetCharactersListType
    private let dataProvider: DataProvider
    private let errorMapper: CharactersPresentableErrorMapper
    
    /// El objeto `CharacterListPresentableItem` que representa los detalles de el personaje
    let characterDetailPresentable: CharacterListPresentableItem
    
    private var cancellables = Set<AnyCancellable>()
    
    /// Inicializa una nueva instancia de `CharacterDetailViewModel`.
    ///
    /// - Parameters:
    ///   - GetCharactersListType: Un objeto que implementa `GetCharactersListType` .
    ///   - dataProvider: Un objeto `DataProvider` que gestiona las los personajes en cache.
    ///   - CharacterDetailPresentable: El objeto `CharacterListPresentableItem` que representa los detalles de el personaje.
    ///   - errorMapper: Un mapeador que se utiliza para transformar errores en mensajes de error legibles.
    init(getCharactersListType: GetCharactersListType,
         dataProvider: DataProvider,
         characterDetailPresentable: CharacterListPresentableItem,
         errorMapper: CharactersPresentableErrorMapper) {
        self.getCharactersListType = getCharactersListType
        self.dataProvider = dataProvider
        self.characterDetailPresentable = characterDetailPresentable
        self.errorMapper = errorMapper
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    static func == (lhs: CharacterDetailViewModel, rhs: CharacterDetailViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
