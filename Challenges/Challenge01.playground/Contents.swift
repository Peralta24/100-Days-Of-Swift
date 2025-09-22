// Reto de Lógica: El Cierre de la Caja de la Cafetería (Versión Final Pulida)

struct Bebida {
    let nombre: String
    let precio: Double
    var inventario: Int
    let esDeTemporada: Bool
    
    mutating func vender(cantidad: Int) {
        inventario -= cantidad
    }
    
    func calcularGanancias(cantidadVendida: Int) -> Double {
        return precio * Double(cantidadVendida)
    }
    
    // Método que imprime su propio resumen
    func imprimirReporte(ganancias: Double) {
        let tipoBebida = esDeTemporada ? "De Temporada ☀️" : "Regular ☕️"
        
        print("""
        Bebida: \(nombre) (\(tipoBebida))
        \t- Inventario Restante: \(inventario) vasos
        \t- Ganancias del Día: $\(ganancias)
        """)
    }
}

// --- CREACIÓN DE INSTANCIAS ---
var americano = Bebida(nombre: "Americano", precio: 50.50, inventario: 15, esDeTemporada: false)
var latte = Bebida(nombre: "Latte", precio: 65.00, inventario: 20, esDeTemporada: false)
var pumpkinLatte = Bebida(nombre: "Pumpkin Spice Latte", precio: 80.25, inventario: 12, esDeTemporada: true)

// --- SIMULACIÓN DE VENTAS ---
let ventasAmericano = 3
let ventasLatte = 8
let ventasPumpkin = 12

americano.vender(cantidad: ventasAmericano)
latte.vender(cantidad: ventasLatte)
pumpkinLatte.vender(cantidad: ventasPumpkin)

// --- CÁLCULO DE GANANCIAS ---
let gananciasAmericano = americano.calcularGanancias(cantidadVendida: ventasAmericano)
let gananciasLatte = latte.calcularGanancias(cantidadVendida: ventasLatte)
let gananciasPumpkin = pumpkinLatte.calcularGanancias(cantidadVendida: ventasPumpkin)

// --- REPORTE FINAL ---
print("\n--- CIERRE DE CAJA DE 'EL RINCÓN SWIFTY' ---")
americano.imprimirReporte(ganancias: gananciasAmericano)
latte.imprimirReporte(ganancias: gananciasLatte)
pumpkinLatte.imprimirReporte(ganancias: gananciasPumpkin)
