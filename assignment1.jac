"""A Simple Calculator"""

walker Calculator {
    has num1: float;
    has num2: float;
    has operation: str;
    
    can start with `root entry;
    can process_calculation with calculation entry;
}

node calculation {
    has result: float = 0.0;
    has operation_type: str = "";
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    root spawn Calculator(10, 5, "add");
    root spawn Calculator(15, 3, "subtract");
    root spawn Calculator(8, 4, "multiply");
    root spawn Calculator(20, 4, "divide");
}