//
//  ProductoDetalleView.swift
//  Examen1
//
//  Created by Wilson Perez on 11/03/25.
//

import SwiftUI

struct ProductoDetalleView: View {
    let producto: Producto
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: producto.image)) { image in
                        image.resizable()
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
