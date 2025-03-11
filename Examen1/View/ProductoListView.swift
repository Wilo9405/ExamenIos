

import SwiftUI

struct ProductoListView: View {
    @StateObject var viewModel: ProductoViewModel
    @State private var selectedCategory = "electronics"
    let categories = ["electronics", "jewelery", "men's clothing", "women's clothing"]
    
    var body: some View {
        TabView(selection: $selectedCategory) {
            ForEach(categories, id: \ .self) { category in
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Cargando...")
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)").foregroundColor(.red)
                    } else {
                        List(viewModel.productos) { producto in
                            NavigationLink(destination: ProductoDetalleView(producto: producto)) {
                                HStack {
                                    AsyncImage(url: URL(string: producto.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading) {
                                        Text(producto.title).font(.headline)
                                        Text("\(producto.price, specifier: "%.2f") €").font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                }
                .tabItem {
                    Image(systemName: icon(for: category))
                    Text(category.capitalized)
                }
                .tag(category)
                .onAppear {
                    viewModel.fetchProducts(category: category)
                }
            }
        }
    }
    
    func icon(for category: String) -> String {
        switch category {
        case "electronics": return "desktopcomputer"
        case "jewelery": return "sparkles"
        case "men's clothing": return "person.fill"
        case "women's clothing": return "figure.walk"
        default: return "questionmark"
        }
    }
}
