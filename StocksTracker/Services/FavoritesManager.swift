
import Foundation

class FavoritesManager: ObservableObject {
    private let key = "favoritesStocks"
    
    @Published var favorites: [String] = []
    
    init() {
        loadFavorites()
    }
    
    func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: key) as? [String] {
            favorites = saved
        }
    }
    func isFavorite(symbol:String) -> Bool {
        favorites.contains(symbol)
    }
    func toggleFavorite(symbol: String){
        if isFavorite(symbol: symbol){
            favorites.removeAll{$0 == symbol}
                
            }else{
                favorites.append(symbol)
            }
            UserDefaults.standard.set(favorites, forKey: key)
        }
    }

