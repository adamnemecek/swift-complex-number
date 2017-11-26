import Foundation

precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left
    assignment: false
}

infix operator ^ : PowerPrecedence

prefix operator ∠
infix operator ∠ : AdditionPrecedence

extension Complex {

    public static func + (lhs: Complex, rhs: Complex) -> Complex { return lhs.add(rhs) }
    public static func + (lhs: Double,  rhs: Complex) -> Complex { return Complex(real: lhs).add(rhs) }
    public static func + (lhs: Complex, rhs: Double ) -> Complex { return lhs.add(Complex(real: rhs)) }

    public static func - (lhs: Complex, rhs: Complex) -> Complex { return lhs.subtract(rhs) }
    public static func - (lhs: Double,  rhs: Complex) -> Complex { return Complex(real: lhs).subtract(rhs) }
    public static func - (lhs: Complex, rhs: Double ) -> Complex { return lhs.subtract(Complex(real: rhs)) }

    public static func * (lhs: Complex, rhs: Complex) -> Complex { return lhs.multiply(rhs) }
    public static func * (lhs: Double,  rhs: Complex) -> Complex { return rhs.multiply(lhs) }
    public static func * (lhs: Complex, rhs: Double ) -> Complex { return lhs.multiply(rhs) }

    public static func / (lhs: Complex, rhs: Complex) -> Complex { return lhs.divide(rhs) }
    public static func / (lhs: Double,  rhs: Complex) -> Complex { return Complex(real: lhs).divide(rhs) }
    public static func / (lhs: Complex, rhs: Double ) -> Complex { return lhs.divide(rhs) }

    public static func ^ (lhs: Complex, n: Double) -> Complex { return lhs.power(n) }
    public static func ^ (lhs: Complex, n: Int) -> Complex { return lhs.power(n) }

    public static func += (lhs: inout Complex, rhs: Complex) { lhs.addInPlace(rhs) }
    public static func += (lhs: inout Complex, rhs: Double) { lhs.addInPlace(Complex(real: rhs)) }
    public static func -= (lhs: inout Complex, rhs: Complex) { lhs.subtractInPlace(rhs) }
    public static func -= (lhs: inout Complex, rhs: Double) { lhs.subtractInPlace(Complex(real: rhs)) }
    public static func *= (lhs: inout Complex, rhs: Complex) { lhs.multiplyInPlace(rhs) }
    public static func *= (lhs: inout Complex, rhs: Double) { lhs.multiplyInPlace(rhs) }
    public static func /= (lhs: inout Complex, rhs: Complex) { lhs.divideInPlace(rhs) }
    public static func /= (lhs: inout Complex, rhs: Double) { lhs.divideInPlace(rhs) }
}

public prefix func ∠ (arg: Double) -> Complex { return cos(arg) + sin(arg) * 𝒊 }
public func ∠ (radius: Double, arg: Double) -> Complex { return ∠arg * radius }
