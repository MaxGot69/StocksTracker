import SwiftUI

struct StockCardView: View {
    let symbol: String
    let name: String
    let price: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.system(size: 20, weight: .semibold))
            
            HStack {
                Text(symbol)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Spacer()
                
                Text("$\(String(format: "%.2f", price))")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}

