import SwiftUI

struct ContentView: View {
    @State private var categories: [CarouselCategory] = DataManager.loadCategories()
    @State private var showingAddNoteView = false  // Estado para mostrar la vista de agregar nota

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(categories) { category in
                        VStack(alignment: .leading) {
                            Text(category.title)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                                .padding(.leading, 20)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(category.items) { item in
                                        CarouselItemView(item: item)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .frame(height: 260)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Mis Notas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNoteView = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showingAddNoteView) {
                AddNoteView(categories: $categories)  // Pasamos las categorías
            }
        }
    }
}


// Vista para cada ítem en los carruseles
struct CarouselItemView: View {
    let item: CarouselItem

    var body: some View {
        ZStack {
            // Fondo con color fijo
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)  // Usamos un color por defecto
                .shadow(color: Color.blue.opacity(0.6), radius: 10, x: 0, y: 8)

            // Contenido del ítem
            VStack(alignment: .center, spacing: 10) {
                Text(item.title)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text(item.description)
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            .padding(20)
        }
        .frame(width: 220, height: 250)
    }
}

// Previsualización
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
