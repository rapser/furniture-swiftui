//
//  ProductDetailView.swift
//  furniture
//
//  Created by miguel tomairo on 11/03/25.
//

import SwiftUI

struct ProductDetailView2: View {
    @State private var quantity = 1
    @State private var selectedColorIndex = 0
    
    let colorOptions = [
        Color(hex: "F7C4C4"), // Rosa claro
        Color(hex: "F27E36"), // Naranja
        Color(hex: "6C7DD1"), // Azul
        Color(hex: "6BC9A3")  // Verde menta
    ]
    
    var body: some View {
        ZStack {
            // Fondo dividido: verde arriba, blanco abajo
            VStack(spacing: 0) {
                // Parte superior verde
                Color(hex: "C8E4D6")
                
                // Parte inferior blanca
                Color.white
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Barra superior con botones
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .foregroundColor(.black)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Título y marca
                VStack(alignment: .leading, spacing: 4) {
                    Text("Kursi Baper")
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("IKEA")
                        .font(.system(size: 18))
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
                .padding(.top, 20)
                
                // Sección central con precio y silla
                HStack(alignment: .bottom) {
                    
                    Spacer()
                    
                    // Imagen del producto con fondo circular
                    ZStack {
                        // Círculo indicador debajo de la silla
                        Ellipse()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 180, height: 40)
                            .offset(y: 75)
                            .blur(radius: 2)
                        
                        // Imagen de la silla (simplificada, sin overlay)
                        Image("chair_image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                            .foregroundColor(Color(hex: "D7A196")) // Color rosa de la silla
                        
                        // Indicador de rotación 3D
                        Circle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "rotate.3d")
                                    .foregroundColor(.black.opacity(0.6))
                                    .font(.system(size: 14))
                            )
                            .offset(y: 90)
                    }
                    .padding(.trailing, 25)
                    .background(.clear)
                }
                .frame(height: 240)
                
                // Contenedor blanco con el resto del contenido
                VStack(spacing: 15) {
                    // Selector de colores
                    HStack(spacing: 8) {
                        ForEach(0..<4) { index in
                            Circle()
                                .fill(colorOptions[index])
                                .frame(width: 30, height: 20)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                        .padding(2)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(index == selectedColorIndex ? Color.black : Color.clear, lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedColorIndex = index
                                }
                        }
                    }
                    .padding(8)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Calificación con estrellas
                    HStack {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(hex: "F0CD69"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 5)
                    
                    // Descripción
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Comfortable chaor ergonomic shape doesn't make you tired sitting on this chair for a long period of time. Pokokmya bagus banget adnjeferhjgg dfer5ffv and the time you spend aasw lorem ipsum is an language and rtsaa iys asns...")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .lineLimit(4)
                        
                        Button(action: {}) {
                            Text("Read More")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    // Selector de cantidad (centrado)
                    HStack(spacing: 20) {
                        Button(action: {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        }) {
                            Text("−")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                        }
                        
                        Text("\(quantity)")
                            .font(.system(size: 18))
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Text("+")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 15)
                    
                    // Botones horizontales en la parte inferior
                    HStack(spacing: 15) {
                        // Botón de AR
                        Button(action: {}) {
                            Text("View in AR")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        
                        // Botón Add to cart
                        Button(action: {}) {
                            Text("Add to cart")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 25)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
                
            }
            
            // Sección de precio (a la izquierda de la silla)
            VStack(alignment: .center, spacing: 5) { // Alineación centrada
                Text("Price")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center) // Centrar texto
                
                Text("$27.76")
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.center) // Centrar texto
            }
            .frame(width: 120, height: 170)
            .background(.white)
            .cornerRadius(30, corners: [.topRight])
            .frame(maxWidth: 200, alignment: .leading)
            .position(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 2 - 145)
        }
    }
}

#Preview {
    ProductDetailView2()
}
