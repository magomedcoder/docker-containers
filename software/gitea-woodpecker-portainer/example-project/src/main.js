class Calculator {
  add(a, b) {
    return a + b;
  }

  subtract(a, b) {
    return a - b;
  }

  multiply(a, b) {
    return a * b;
  }
}

module.exports = Calculator;

if (require.main === module) {
  const calc = new Calculator();
  console.log(`2 + 3 = ${calc.add(2, 3)}`);
  console.log(`5 - 2 = ${calc.subtract(5, 2)}`);
  console.log(`4 * 3 = ${calc.multiply(4, 3)}`);
}