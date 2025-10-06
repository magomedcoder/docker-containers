const Calculator = require('../src/main');

describe('Calculator', () => {
  let calc;

  beforeEach(() => {
    calc = new Calculator();
  });

  test('should add two numbers correctly', () => {
    expect(calc.add(2, 3)).toBe(5);
    expect(calc.add(-1, 1)).toBe(0);
    expect(calc.add(0, 0)).toBe(0);
  });

  test('should subtract two numbers correctly', () => {
    expect(calc.subtract(5, 3)).toBe(2);
    expect(calc.subtract(3, 5)).toBe(-2);
    expect(calc.subtract(0, 0)).toBe(0);
  });

  test('should multiply two numbers correctly', () => {
    expect(calc.multiply(2, 3)).toBe(6);
    expect(calc.multiply(-2, 3)).toBe(-6);
    expect(calc.multiply(0, 5)).toBe(0);
  });
});