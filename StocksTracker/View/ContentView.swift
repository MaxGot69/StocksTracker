import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var viewModel: StockViewModel
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Поле ввода тикера
                TextField("Введите тикер (например: AAPL)", text: $viewModel.symbol)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Кнопка поиска
                Button("Показать цену") {
                    viewModel.fetchPrice()
                }
                .buttonStyle(.borderedProminent)
                
                // Если данные пришли — показываем карточку
                if let stock = viewModel.stock, stock.price.isFinite {
                    VStack(spacing: 12) {
                        StockCardView(
                            symbol: stock.symbol,
                            name: viewModel.getCompanyName(for: stock.symbol),
                            price: stock.price
                        )
                        
                        Button("Добавить в избранное") {
                            viewModel.addFavoriteStock(context: viewContext)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.horizontal)
                }
                // Ошибка, если есть
                else if let error = viewModel.errorMessage {
                    Text("Ошибка: \(error)")
                        .foregroundColor(.red)
                }
                // Лоадер
                else if viewModel.isLoading {
                    ProgressView("Загружается...")
                }
                
                Spacer()
            }

            .navigationTitle("Поиск акций")
        }
    }
}

