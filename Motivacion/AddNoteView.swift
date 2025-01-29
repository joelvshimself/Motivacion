import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode  // Para cerrar la vista después de guardar
    @State private var title: String = ""  // Estado para el título
    @State private var description: String = ""  // Estado para la descripción
    @State private var selectedCategory: String = "Metas"  // Categoría por defecto
    
    @Binding var categories: [CarouselCategory]  // Recibimos la lista de categorías para actualizarla

    let categoryNames = ["Metas", "Razones", "Hábitos", "Manifiesto"]  // Lista de categorías disponibles

    var body: some View {
        NavigationView {
            Form {
                // Campo de texto para el título
                Section(header: Text("Título")) {
                    TextField("Escribe el título de tu nota", text: $title)
                }

                // Área de texto para la descripción
                Section(header: Text("Descripción")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                }

                // Picker para seleccionar la categoría
                Section(header: Text("Categoría")) {
                    Picker("Selecciona una categoría", selection: $selectedCategory) {
                        ForEach(categoryNames, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                // Botón para guardar la nota
                Section {
                    Button(action: saveNote) {
                        Text("Guardar Nota")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Nueva Nota")
            .navigationBarItems(trailing: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    // 📌 Función para guardar la nota
    func saveNote() {
        guard !title.isEmpty, !description.isEmpty else { return }  // Evita guardar notas vacías

        // Crear la nueva nota
        let newNote = CarouselItem(title: title, description: description)

        // Buscar la categoría seleccionada y agregar la nota
        if let index = categories.firstIndex(where: { $0.title == selectedCategory }) {
            categories[index].items.append(newNote)
        }

        // Guardar los cambios en JSON
        DataManager.saveCategories(categories)

        // Cerrar la vista después de guardar
        presentationMode.wrappedValue.dismiss()
    }
}
