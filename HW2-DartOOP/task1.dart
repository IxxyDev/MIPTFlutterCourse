import 'dart:math';
void main() {
  final z1 = ComplexNumber(5, -6);
  final z2 = ComplexNumber(-3, 2);

  print((z1 - z2).toString()); // 8 - 8i
  print((z1 * z2).toString()); // -3 + 28i

}

class ComplexNumber {
    final double real;
    final double imaginary;

    const ComplexNumber(this.real, this.imaginary);

    double get length => sqrt(real * real + imaginary * imaginary);

    ComplexNumber operator +(ComplexNumber z) {
      return ComplexNumber(real + z.real, imaginary + z.imaginary);
    }

    bool operator >(ComplexNumber z) {
      return length > z.length;
    }

    ComplexNumber operator *(ComplexNumber z) {
      return ComplexNumber(real * z.real - imaginary * z.imaginary, real * z.imaginary + imaginary * z.real);
    }

    ComplexNumber operator -(ComplexNumber z) {
      return ComplexNumber(real - z.real, imaginary - z.imaginary);
    }
  
    @override
    String toString() {
      return '$real ${imaginary >= 0 ? '+' : ''} ${imaginary}i';
    }
}