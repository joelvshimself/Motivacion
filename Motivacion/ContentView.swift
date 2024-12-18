import SwiftUI

// Modelo general para los ítems en cada carrusel
struct CarouselItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
}

// Categorías
struct CarouselCategory: Identifiable {
    let id = UUID()
    let title: String
    let items: [CarouselItem]
}

// Vista Principal
struct ContentView: View {
    // Datos de ejemplo para las categorías y sus carruseles
    let categories: [CarouselCategory] = [
        CarouselCategory(
            title: "Metas",
            items: [
                CarouselItem(title: "Apple Academy", description: "Estudiar desarrollo avanzado.", color: .blue),
                CarouselItem(title: "Casa", description: "Tener un lugar para llamar hogar.", color: .green),
                CarouselItem(title: "Llegar a mi Mejor Versión", description: "Superarme en todos los aspectos.", color: .purple),
                CarouselItem(title: "Estabilidad Financiera", description: "Lograr una base económica sólida.", color: .yellow),
                CarouselItem(title: "Libertad Financiera", description: "Tener el dinero para vivir sin preocupaciones.", color: .cyan),
                CarouselItem(title: "Viajar Mucho", description: "Conocer el mundo y explorar nuevas culturas.", color: .pink),
                CarouselItem(title: "Seguridad", description: "Sentirme protegido y cuidar a los míos.", color: .red),
                CarouselItem(title: "Comida Saludable", description: "Llevar una alimentación que me beneficie.", color: .teal),
                CarouselItem(title: "Balance", description: "Encontrar armonía en mi vida personal y profesional.", color: .mint),
                CarouselItem(title: "Calidad de Vida", description: "Vivir con comodidad y bienestar.", color: .brown),
                CarouselItem(title: "Plenitud", description: "Alcanzar una vida llena de satisfacción.", color: .indigo),
                CarouselItem(title: "Comprarle un Porsche a mis Papás", description: "Agradecerles con algo especial.", color: .orange),
                CarouselItem(title: "Regresarles Todo", description: "Retribuirles por todo lo que me dieron.", color: .blue),
                CarouselItem(title: "Buena Educación para Mis Hijos", description: "Asegurarles un futuro brillante.", color: .green),
                CarouselItem(title: "Viajar con María <3", description: "Compartir aventuras inolvidables juntos.", color: .pink),
                CarouselItem(title: "Regalarle a la Familia en Navidad", description: "Sorprenderlos con detalles en fechas especiales.", color: .red),

            ]
        ),
        CarouselCategory(
            title: "Razones",
            items: [
                CarouselItem(title: "Vida Corta", description: "Vivir cada día con esfuerzo, inteligencia y determinación.", color: .red),
                CarouselItem(title: "Aprovechar Privilegios", description: "Tengo mucho, y no quiero desaprovecharlo.", color: .blue),
                CarouselItem(title: "Convertirme en Alguien", description: "Esforzarme por mejorar y alcanzar mi potencial.", color: .orange),
                CarouselItem(title: "Orgullo Familiar", description: "Hacer que mi familia se sienta orgullosa de mí.", color: .green),
                CarouselItem(title: "La Vida es para el Vivo", description: "Aprovechar cada oportunidad con astucia.", color: .yellow),
                CarouselItem(title: "Fortaleza Interior", description: "No soy débil, soy más complejo y fuerte que eso.", color: .purple),
                CarouselItem(title: "Llamado a Algo Grande", description: "Responder al potencial que siento dentro de mí.", color: .cyan),
                CarouselItem(title: "Mejor Versión", description: "Estoy lejos de mi mejor versión, y voy por ella.", color: .pink),
                CarouselItem(title: "Privilegios de Vida", description: "Tuve todo lo necesario; no hay excusas para no progresar.", color: .brown),
                CarouselItem(title: "Ganas Nocturnas", description: "Las ansias de superarme no me dejan dormir.", color: .indigo),
                CarouselItem(title: "Estado de México Bufa", description: "Probar que mi entorno no define mi éxito.", color: .gray),
                CarouselItem(title: "Mexicanos Chingones", description: "Demostrar que el esfuerzo mexicano triunfa.", color: .gray),
                CarouselItem(title: "Amor por la Música", description: "Reguetón mexa, phonk, hardstyle y música clásica me inspiran.", color: .teal),
                CarouselItem(title: "Tomarlo en Serio", description: "¿Qué pasaría si verdaderamente lo doy todo?", color: .cyan),
                CarouselItem(title: "Regalo para Mí", description: "Sobresalir sería el mayor regalo de mí para mí.", color: .red),
                CarouselItem(title: "Nunca Mediocre", description: "No quiero ser mediocre; siempre aspiro a más.", color: .yellow),
                CarouselItem(title: "Victoria en Monterrey", description: "Demostrar que llegar a MTY no me venció.", color: .orange),
                CarouselItem(title: "Familia Unida", description: "Todos queremos vernos arriba y superados.", color: .yellow),
                CarouselItem(title: "Alterar el Status Quo", description: "Cumplir con mi obsesión de cambiar las reglas.", color: .orange),

            ]
        ),
        CarouselCategory(
            title: "Hábitos",
            items: [
                CarouselItem(title: "Comer Saludable", description: "Mantener una dieta rica en proteína.", color: .teal),
                CarouselItem(title: "Avanzar con Swift", description: "Mejorar mis habilidades de desarrollo en Swift.", color: .blue),
                CarouselItem(title: "Continuar en el Gym", description: "Mantenerme constante en el gimnasio.", color: .red),
                CarouselItem(title: "Hacer Leetcode", description: "Practicar problemas para mejorar mi lógica y habilidades técnicas.", color: .purple),
                CarouselItem(title: "Sacar Clientes para Neza", description: "Expandir y hacer crecer el negocio.", color: .orange),

            ]
        ),
        CarouselCategory(
            title: "Manifiesto",
            items: [
                CarouselItem(title: "Salta y Mejora", description: "Atrévete a dar el salto y mejora en el proceso.", color: .blue),
                CarouselItem(title: "Come Bien", description: "Disfruta comida rica y nutritiva, sentirse bien importa.", color: .green),
                CarouselItem(title: "GYMMMMMMM", description: "Mantente constante en el gimnasio y mejora tu físico.", color: .red),
                CarouselItem(title: "Breaks Creativos", description: "Tómate pausas para explorar nuevas ideas.", color: .yellow),
                CarouselItem(title: "Pregúntame", description: "No dudes en buscar ayuda o consejo.", color: .purple),
                CarouselItem(title: "No Desesperes", description: "Mantén la calma y sigue adelante, todo llega.", color: .cyan),
                CarouselItem(title: "Respira y Divide", description: "Si algo te abruma, respira, reduce problemas y avanza.", color: .teal),
                CarouselItem(title: "Abraza y Apóyate", description: "Busca apoyo en alguien cercano, somos humanos.", color: .pink),
                CarouselItem(title: "Recuerda Ser Humano", description: "Permítete sentir y ser vulnerable.", color: .brown),
                CarouselItem(title: "Valora Acciones", description: "Agradece y aprecia los gestos de los demás.", color: .orange),
                CarouselItem(title: "Conócete", description: "Identifica en qué eres bueno y dónde puedes mejorar.", color: .indigo),
                CarouselItem(title: "Tryhardea", description: "Esfuérzate al máximo para alcanzar tus metas.", color: .red),
                CarouselItem(title: "Toma Café", description: "Disfruta del café como una pausa renovadora.", color: .black),
                CarouselItem(title: "Agradece", description: "Valora cada día y la oportunidad de crecer.", color: .mint),
                CarouselItem(title: "Desarrollarte", description: "Esfuérzate y cuida todos los aspectos de tu vida.", color: .blue),
                CarouselItem(title: "Confía en Ti", description: "Cree en tus capacidades para lograr grandes cosas.", color: .green),
                CarouselItem(title: "Usa Tu Idea", description: "Ejecuta tu mejor idea y confía en que surgirán más.", color: .cyan),
                CarouselItem(title: "Sin Miedo", description: "Enfrenta los retos con valentía y determinación.", color: .purple),
                CarouselItem(title: "Somos Nuestros Hábitos", description: "Las acciones y las personas a tu alrededor te definen.", color: .gray),
                CarouselItem(title: "Controla Tu Reacción", description: "El mundo exterior te afecta según tú lo permitas.", color: .red),

            ]
        )
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(categories) { category in
                    VStack(alignment: .leading) {
                        // Título de la categoría
                        Text(category.title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.leading, 20)

                        // Carrusel de la categoría
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
    }
}

// Vista para cada ítem en los carruseles
struct CarouselItemView: View {
    let item: CarouselItem

    var body: some View {
        ZStack {
            // Fondo Degradado con esquinas redondeadas
            RoundedRectangle(cornerRadius: 25)
                .fill(item.color.gradient)
                .shadow(color: item.color.opacity(0.6), radius: 10, x: 0, y: 8)

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
