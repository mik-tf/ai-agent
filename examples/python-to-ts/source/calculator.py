# source/calculator.py
class Calculator:
    """A simple calculator class."""
    
    def add(self, a: float, b: float) -> float:
        """Add two numbers."""
        return a + b
    
    def subtract(self, a: float, b: float) -> float:
        """Subtract b from a."""
        return a - b
    
    def multiply(self, a: float, b: float) -> float:
        """Multiply two numbers."""
        return a * b
    
    def divide(self, a: float, b: float) -> float:
        """Divide a by b."""
        if b == 0:
            raise ValueError("Cannot divide by zero")
        return a / b

if __name__ == "__main__":
    calc = Calculator()
    print(f"Add: {calc.add(5, 3)}")
    print(f"Subtract: {calc.subtract(5, 3)}")
    print(f"Multiply: {calc.multiply(5, 3)}")
    print(f"Divide: {calc.divide(5, 3)}")