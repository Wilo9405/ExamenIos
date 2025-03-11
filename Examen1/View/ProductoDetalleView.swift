
import SwiftUI

struct ProductoDetalleView: View {
    let producto: Producto
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: producto.image)) { image in
                        image.resizable()
                            .frame(width: 200, height: 200)
                            
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                    Text(producto.title)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    
                    Text("\(producto.price, specifier: "%.2f") €")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                    
                    Text(producto.description)
                        .padding()
                }
            }
            .navigationTitle("Detalle")
        }
    }
