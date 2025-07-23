

import SwiftUI


struct MainView: View {
    @StateObject var viewModel = StockViewModel()
    @StateObject var favoritesManager = FavoritesManager()

    var body: some View {
        TabView {
            ContentView(viewModel: viewModel)
            
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
                }

            FavoriteView()
                .tabItem {
                    Label("Избранное", systemImage: "star.fill")
                }
        }

    }
}


