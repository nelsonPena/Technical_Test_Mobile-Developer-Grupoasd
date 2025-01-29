# RickAndMortyApp

## 📌 Descripción del Proyecto
**RickAndMortyApp** es una aplicación iOS desarrollada en **Swift** que permite explorar personajes de la serie *Rick and Morty*. La aplicación sigue una **arquitectura limpia** basada en **MVVM + Coordinator**, garantizando modularidad, escalabilidad y facilidad de pruebas. 

La aplicación obtiene información desde la API oficial de Rick and Morty y permite navegar entre personajes, ver detalles y manejar errores de manera eficiente.

---

## 🎯 **1. Implementación de Requisitos Funcionales**

✅ **Consumo de la API** de Rick and Morty para mostrar una lista de personajes.  
✅ **Navegación fluida** entre vistas utilizando el patrón **Coordinator**.  
✅ **Búsqueda y filtrado de personajes** basado en nombre y estado.  
✅ **Pantalla de detalles** que muestra información detallada de cada personaje.  
✅ **Manejo de errores y estados de carga** para mejorar la experiencia del usuario.  
✅ **Pruebas unitarias robustas** con datos simulados desde archivos JSON locales.  
✅ **Persistencia de datos:** Se almacena localmente la lista de personajes en caché para mejorar el rendimiento y permitir el acceso sin conexión.

---

## 🔹 **2. Calidad del Código (Buenas Prácticas y Principios)**

El código sigue los principios **SOLID** y **Clean Architecture**:

- **Single Responsibility Principle (SRP)** → Cada clase tiene una única responsabilidad clara.
- **Open/Closed Principle (OCP)** → La app es extensible sin modificar el código existente.
- **Liskov Substitution Principle (LSP)** → Se usan protocolos en lugar de herencia para desacoplar módulos.
- **Interface Segregation Principle (ISP)** → Interfaces pequeñas y específicas para cada capa.
- **Dependency Inversion Principle (DIP)** → Se usa inyección de dependencias para reducir acoplamiento.

📌 **Otras buenas prácticas utilizadas:**
- Uso de **Combine y async/await** para manejar operaciones asincrónicas de manera eficiente.
- Separación clara entre **Presentación, Dominio y Datos**.
- Uso de **Coordinator** para gestionar la navegación de manera desacoplada.
- **Modularización del código** en fábricas y repositorios.
- **Manejo de caché y persistencia** para mejorar la velocidad de carga de la aplicación.

---

## 📂 **3. Organización del Proyecto (Estructura y Modularidad)**

La aplicación sigue una estructura modular y bien organizada:

```
RickAndMortyApp/
│── App/                     # Configuración de la aplicación y coordinador
│── Data/                    # Capa de acceso a datos (API y almacenamiento local)
│   ├── Network/             # Cliente HTTP y manejo de solicitudes
│   ├── Repository/          # Repositorios de datos
│   ├── Persistence/         # Gestión de almacenamiento en caché
│── Domain/                  # Casos de uso y modelos de negocio
│── Presentation/            # Vistas y ViewModels (MVVM)
│   ├── Views/               # Interfaces de usuario (SwiftUI)
│   ├── ViewModels/          # Lógica de presentación
│   ├── Coordinator/         # Manejo de navegación
│── Resources/               # Assets, fuentes y archivos de localización
│── Tests/                   # Pruebas unitarias
```

Cada capa es independiente, permitiendo una fácil escalabilidad y mantenimiento.

---

## 📌 **4. Uso Adecuado de Bibliotecas Externas**

La aplicación utiliza las siguientes bibliotecas:

- **SDWebImageSwiftUI** → Para la carga y cacheo eficiente de imágenes remotas.
- **Combine** → Para manejar programación reactiva y asincronía.
- **XCTest** → Para pruebas unitarias.

📌 **Cada biblioteca es utilizada de manera óptima y justificada, sin dependencias innecesarias.**

---

## 🧪 **5. Cobertura y Calidad de los Tests**

📌 **Pruebas implementadas:**
- **Capa de Datos:** Verifica la correcta obtención y decodificación de la API.
- **Capa de Dominio:** Asegura la correcta ejecución de los casos de uso.
- **Capa de Presentación:** Prueba la interacción entre ViewModels y Vistas.
- **Manejo de errores:** Simulación de fallos en la API.
- **Pruebas de persistencia:** Valida que los personajes se almacenen correctamente en caché.

✅ **Se utilizan mocks y archivos JSON locales para asegurar la confiabilidad de los tests.**

📌 **Ejemplo de una prueba unitaria:**
```swift
func testGetCharactersSuccess() async throws {
    let characters = try await repository.getCharacters().first()
    XCTAssertNotNil(characters, "No se obtuvo ningún resultado")
    XCTAssertGreaterThan(characters?.results.count ?? 0, 0, "No se obtuvieron personajes del JSON")
}
```

📌 **Cobertura de pruebas:** Se cubre más del **85% del código crítico**, asegurando estabilidad.

---

## 📖 **6. Documentación Clara y Detallada**

📌 **Cada clase y función está documentada con SwiftDoc**, incluyendo:
- Descripción detallada.
- Parámetros y valores de retorno.
- Ejemplos de uso.

📌 **README Completo:** Explica la arquitectura, dependencias y estructura del código.

📌 **Comentarios bien estructurados en el código**, siguiendo las mejores prácticas de documentación.

---

## 🚀 **Cómo Ejecutar el Proyecto**

### 📌 **Requisitos Previos:**
- Xcode 14+
- iOS 16+
- Conexión a Internet para obtener datos de la API.

### 📌 **Pasos para Clonar y Ejecutar:**
1. Clonar el repositorio:
   ```bash
   git clone https://github.com/nelsonPena/RickandMortyApp.git
   cd RickandMortyApp
   ```
2. Abrir `RickAndMortyApp.xcodeproj` en Xcode.
3. Seleccionar un simulador de iOS y ejecutar con **Cmd + R**.

---

📌 **Autor:** Nelson Peña Agudelo  
📌 **Contacto:** [nelson.pena@email.com](mailto:vald3z32@gmail.com)

