
import Foundation

import Foundation

class ProductoViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchProducts(category: String) {
        isLoading = true
        errorMessage = nil
        
        APIService.shared.fetchProducts(category: category) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let productos):
                    self.productos = productos
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
