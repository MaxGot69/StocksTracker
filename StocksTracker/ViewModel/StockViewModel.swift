//Хранение текущей цены и ошибок.
//Получение данных о цене акции.
//Добавление и получение избранных акций через CoreData.

import Foundation
import CoreData

class StockViewModel: ObservableObject {
    @Published var stock: Stock? = nil
    @Published var errorMessage: String? = nil
    @Published var symbol: String = "" // Для поиска тикера
    @Published var favorites: [String] = []
    @Published var isLoading: Bool = false
    private let companyNames: [String: String] = [
        "AAPL": "Apple Inc.",
        "AMZN": "Amazon.com, Inc.",
        "GOOGL": "Alphabet Inc.",
        "MSFT": "Microsoft Corporation",
        "TSLA": "Tesla, Inc.",
        "META": "Meta Platforms Inc.",
        "NFLX": "Netflix, Inc.",
        "NVDA": "NVIDIA Corporation"
    ]

    
    
    // Метод для добавления акции в избранное
    func addFavoriteStock( context: NSManagedObjectContext) {
        guard let stock = stock else {return}
        // Проверка существует ли уже такая акция в базе
        let fetchRequest: NSFetchRequest<FavoriteStock> = FavoriteStock.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "symbol == %@", stock.symbol)
        
        do {
            let existingStocks = try context.fetch(fetchRequest)
            
            // Если акция не существует, то создаем новую запись
            if existingStocks.isEmpty {
                let favoriteStock = FavoriteStock(context: context)
                
                let symbol = self.stock?.symbol ?? ""
                favoriteStock.symbol = symbol

                let stockName: String
                if let companyName = companyNames[symbol] {
                    stockName = companyName
                } else {
                    stockName = "Название неизвестно"
                }

                favoriteStock.name = stockName
                favoriteStock.price = self.stock?.price ?? 0
                favoriteStock.dateAdded = Date()

                try context.save()
            }



        } catch {
            print("Ошибка при добавлении акции в избранное: \(error.localizedDescription)")
        }
    }

    
    // Метод для получения избранных акций
    func fetchFavoriteStocks(from context: NSManagedObjectContext) -> [FavoriteStock]? {
        let fetchRequest: NSFetchRequest<FavoriteStock> = FavoriteStock.fetchRequest()
        
        do {
            let favoriteStocks = try context.fetch(fetchRequest)
            return favoriteStocks
        } catch {
            print("Ошибка при получении избранных акций: \(error.localizedDescription)")
            return nil
        }
    }
    
    //Метод удаления
    func removeFromFavorites(ticker: String){
        favorites.removeAll{$0 == ticker}
    }
    
    func getCompanyName(for symbol: String) -> String {
        return companyNames[symbol.uppercased()] ?? "Название неизвестно"
    }

    
    // Метод для получения данных
    func fetchPrice() {
        isLoading = true
        APIClient.shared.fetchStockPrice(for: symbol) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let stock):
                    self.stock = stock // Присваиваем цену акции
                    self.errorMessage = nil // Очищаем ошибку
                case .failure(let error):
                    self.errorMessage = error.localizedDescription // Выводим ошибку
                    self.stock = nil // Очищаем цену
                }
            }
        }
    }
}

