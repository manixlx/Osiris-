import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
            
            CreatePostView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Publicar")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Mapa")
                }
            
            AlertsView()
                .tabItem {
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Alertas")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Configuración")
                }
        }
    }
}


struct HomeView: View {
    var body: some View {
        VStack {
            
            Spacer()
                .frame(height: 40)
            
            Image("osiris")
                .resizable()
                .scaledToFit()
                .frame(width: 450, height: 250)
                .padding(.bottom, 20)
            Text("Bienvenido a Osiris")
                .font(.largeTitle)
                .padding()
            
            Text("Aquí puedes acceder a las diferentes funcionalidades de la app.")
                .padding()
            
            Spacer()
        }
    }
}

struct CreatePostView: View {
    @State private var postContent: String = ""
    
    var body: some View {
        VStack {
            Text("Crear una Publicación")
                .font(.title)
                .padding()
            
            TextEditor(text: $postContent)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .padding()
            
            Button(action: {
                
            }) {
                Text("Publicar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}


struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30.0, longitudeDelta: 30.0)
    )
    
    var body: some View {
        VStack {
            Text("Mapa de EE.UU. y México")
                .font(.title)
                .padding()
            
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 300)
        }
    }
}


struct AlertsView: View {
    var body: some View {
        VStack {
            Text("Alertas de Sequía y Huracanes")
                .font(.title)
                .padding()
            
            List {
                Text("Sequía: Nivel Alto en el oeste de EE.UU.")
                Text("Huracán: Categoría 4 en el Golfo de México.")
            }
        }
    }
}


struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var accountName = "Manuel Riveros"
    
    var body: some View {
        VStack {
            Text("Configuración y Administración")
                .font(.title)
                .padding()
            
            Toggle(isOn: $notificationsEnabled) {
                Text("Habilitar Notificaciones")
            }
            .padding()
            
            HStack {
                Text("Nombre de la cuenta:")
                TextField("Nombre", text: $accountName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            Button(action: {
                // Acción para guardar los cambios
            }) {
                Text("Guardar Cambios")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
