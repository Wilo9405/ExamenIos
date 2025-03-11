
import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://fakestoreapi.com/products/category/"
    
    func fetchProducts(category: String, completion: @escaping (Result<[Producto], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(category)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let products = try JSONDecoder().decode([Producto].self, from: data)
                DispatchQueue.main.async { completion(.success(products)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }.resume()
    }
}

