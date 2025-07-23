import Foundation

// То, что приходит от API (только цена и инфо)
struct StockResponse: Codable {
    let c: Double
    let h: Double
    let l: Double
    let o: Double
    let pc: Double
    let t: Int
}

