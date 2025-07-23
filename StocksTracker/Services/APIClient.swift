import Foundation

// Класс для работы с API
class APIClient {
    static let shared = APIClient()  // Один экземпляр класса для всего проекта
    
    private let baseURL = "https://finnhub.io/api/v1/quote"  // Базовый URL Finhub API
    private let apiKey = "d1v64upr01qj71gjmmu0d1v64upr01qj71gjmmug"
    
    // Метод получения данных о текущей цене акции
    func fetchStockPrice(for symbol: String, completion: @escaping (Result<Stock, Error>) -> Void) {
        let urlString = "\(baseURL)?symbol=\(symbol)&token=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        print("🔗 Запрос отправлен по URL: \(urlString)")

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No Data"])))
                return
            }

            do {
                let response = try JSONDecoder().decode(StockResponse.self, from: data)

                // Тут мы создаём свою модель со всеми полями
                let stock = Stock(
                    symbol: symbol.uppercased(),
                    name: "Название неизвестно", // Пока заглушка
                    price: response.c,
                    c: response.c,
                    h: response.h,
                    l: response.l,
                    o: response.o,
                    pc: response.pc,
                    t: response.t
                )

                completion(.success(stock))
            } catch {
                print("❌ Ошибка при декодировании: \(error)")
                completion(.failure(error))
            }
        }

        task.resume()
    }

}

