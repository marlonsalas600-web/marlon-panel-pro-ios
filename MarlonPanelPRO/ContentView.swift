import SwiftUI

@main
struct MarlonPanelPROApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @AppStorage("demoActivated") private var activated = false
    @AppStorage("general") private var general = 180.0
    @AppStorage("redDot") private var redDot = 175.0
    @AppStorage("scope2x") private var scope2x = 165.0
    @AppStorage("scope4x") private var scope4x = 150.0
    @AppStorage("sniper") private var sniper = 90.0
    @State private var code = ""
    private let gold = Color(red: 0.86, green: 0.69, blue: 0.33)

    var body: some View {
        ZStack {
            Color(red: 0.05, green: 0.05, blue: 0.06).ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("MARLON PANEL PRO 亗")
                        .font(.system(size: 27, weight: .black, design: .rounded))
                        .foregroundStyle(gold)
                    Text("BLACK & GOLD • iOS").font(.caption).foregroundStyle(.gray)
                    if activated {
                        Text("PERFIL DE SENSIBILIDAD").font(.headline).foregroundStyle(gold)
                        slider("General", value: $general)
                        slider("Punto rojo", value: $redDot)
                        slider("Mira 2X", value: $scope2x)
                        slider("Mira 4X", value: $scope4x)
                        slider("Francotirador", value: $sniper)
                        Text("Practica arrastres cortos, cambia de 5 en 5 y prueba cada ajuste durante varias partidas.")
                            .foregroundStyle(.white)
                        Button("Cerrar sesión") { activated = false }
                            .buttonStyle(.borderedProminent).tint(gold).foregroundStyle(.black)
                    } else {
                        Text("ACTIVAR LICENCIA").font(.headline).foregroundStyle(gold)
                        TextField("Código de activación", text: $code)
                            .textInputAutocapitalization(.characters)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        Text("DEMO: MARLON-DEMO. Clave de prueba solamente; no es una licencia comercial segura.")
                            .font(.caption).foregroundStyle(.gray)
                        Button("Activar demo") {
                            if code.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() == "MARLON-DEMO" {
                                activated = true
                            }
                        }
                        .buttonStyle(.borderedProminent).tint(gold).foregroundStyle(.black)
                    }
                    Text("Los valores son orientativos. Esta app no modifica Free Fire ni garantiza tiros a la cabeza.")
                        .font(.caption).foregroundStyle(.gray)
                }.padding(24)
            }
        }.preferredColorScheme(.dark)
    }

    private func slider(_ title: String, value: Binding<Double>) -> some View {
        VStack(alignment: .leading) {
            HStack { Text(title).foregroundStyle(.white); Spacer(); Text("\(Int(value.wrappedValue))").foregroundStyle(gold) }
            Slider(value: value, in: 0...200, step: 1).tint(gold)
        }
    }
}
