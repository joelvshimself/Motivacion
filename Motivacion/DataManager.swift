import Foundation

struct DataManager {
    static let fileName = "categories.json"  // Nombre del archivo JSON
    
    // 📌 Obtener la URL del archivo JSON en el dispositivo
    static func getFileURL() -> URL? {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentDirectory.appendingPathComponent(fileName)
    }
    
    // 📌 Guardar categorías en el archivo JSON
    static func saveCategories(_ categories: [CarouselCategory]) {
        guard let url = getFileURL() else { return }
        
        do {
            let data = try JSONEncoder().encode(categories)  // Convertir a JSON
            try data.write(to: url)  // Escribir en el archivo
        } catch {
            print("❌ Error guardando las categorías: \(error)")
        }
    }
    
    // 📌 Cargar categorías desde el archivo JSON
    static func loadCategories() -> [CarouselCategory] {
        guard let url = getFileURL(),
              FileManager.default.fileExists(atPath: url.path) else {
            return getDefaultCategories()  // Si no hay archivo, cargar datos iniciales
        }
        
        do {
            let data = try Data(contentsOf: url)  // Leer datos del archivo
            return try JSONDecoder().decode([CarouselCategory].self, from: data)  // Convertir JSON a objetos
        } catch {
            print("❌ Error cargando las categorías: \(error)")
            return getDefaultCategories()  // Si hay error, usar datos iniciales
        }
    }
    
    // 📌 Datos predeterminados si no existe el JSON
    static func getDefaultCategories() -> [CarouselCategory] {
        return [
            CarouselCategory(title: "Metas", items: [
            ]),
            CarouselCategory(title: "Razones", items: [
            ]),
            CarouselCategory(title: "Hábitos", items: [
            ]),
            CarouselCategory(title: "Manifiesto", items: [
            ])
        ]
    }
}
