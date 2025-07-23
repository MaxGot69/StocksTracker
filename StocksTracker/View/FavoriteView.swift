import SwiftUI
import CoreData

struct FavoriteView: View {
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(
        entity: FavoriteStock.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteStock.dateAdded, ascending: false)]
    ) var favorites: FetchedResults<FavoriteStock>

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.self) { stock in
                    StockCardView(
                        symbol: stock.symbol ?? "-",
                        name: (stock.name?.isEmpty == false ? stock.name : stock.symbol) ?? "-",

                        price: stock.price
                    )

                    .padding(.vertical, 4)
                }
                .onDelete(perform: deleteStocks)
            }
            .navigationTitle("Избранное")
        }
    }

    private func deleteStocks(at offsets: IndexSet) {
        for index in offsets {
            let stock = favorites[index]
            viewContext.delete(stock)
        }

        do {
            try viewContext.save()
        } catch {
            print("Ошибка при удалении: \(error)")
        }
    }
}


