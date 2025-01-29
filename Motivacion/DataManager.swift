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
                CarouselItem(title: "Apple Academy", description: "Estudiar desarrollo avanzado."),
                CarouselItem(title: "Casa", description: "Tener un lugar para llamar hogar.")
            ]),
            CarouselCategory(title: "Razones", items: [
                CarouselItem(title: "Vida Corta", description: "Vivir cada día con esfuerzo, inteligencia y determinación."),
                CarouselItem(title: "Aprovechar Privilegios", description: "Tengo mucho, y no quiero desaprovecharlo.")
            ]),
            CarouselCategory(title: "Hábitos", items: [
                CarouselItem(title: "Comer Saludable", description: "Mantener una dieta rica en proteína."),
                CarouselItem(title: "Avanzar con Swift", description: "Mejorar mis habilidades de desarrollo en Swift.")
            ]),
            CarouselCategory(title: "Manifiesto", items: [
                CarouselItem(title: "Salta y Mejora", description: "Atrévete a dar el salto y mejora en el proceso."),
                CarouselItem(title: "Come Bien", description: "Disfruta comida rica y nutritiva, sentirse bien importa.")
            ])
        ]
    }
}
