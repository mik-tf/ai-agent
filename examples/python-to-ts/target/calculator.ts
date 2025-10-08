// target/calculator.ts
export class Calculator {
    /** Add two numbers. */
    add(a: number, b: number): number {
        return a + b;
    }

    /** Subtract b from a. */
    subtract(a: number, b: number): number {
        return a - b;
    }

    /** Multiply two numbers. */
    multiply(a: number, b: number): number {
        return a * b;
    }

    /** Divide a by b. */
    divide(a: number, b: number): number {
        if (b === 0) {
            throw new Error("Cannot divide by zero");
        }
        return a / b;
    }
}

// Example usage
if (typeof require !== 'undefined' && require.main === module) {
    const calc = new Calculator();
    console.log(`Add: ${calc.add(5, 3)}`);
    console.log(`Subtract: ${calc.subtract(5, 3)}`);
    console.log(`Multiply: ${calc.multiply(5, 3)}`);
    console.log(`Divide: ${calc.divide(5, 3)}`);
}