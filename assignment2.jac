"""A Smart Calculator with AI-Powered Help"""

import random;
import from byllm.llm { Model }

# glob llm = Model(model_name="gpt-4o", verbose=False);
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide helpful explanation or alternative approaches for calculator operations"""
def give_calculation_help(num1: float, num2: float, operation: str, result: float) -> str by llm();

"""Suggest mathematical insights or fun facts about the numbers or result"""
def give_math_insight(num1: float, num2: float, operation: str, result: float) -> str by llm();

walker Calculator {
    has num1: float;
    has num2: float;
    has operation: str;
    has show_insights: bool = True;
    
    can start with `root entry;
    can process_calculation with calculation entry;
}

node calculation {
    has result: float = 0.0;
    has operation_type: str = "";
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    root spawn Calculator(10.0, 5.0, "add");
    root spawn Calculator(15.0, 3.0, "subtract");
    root spawn Calculator(8.0, 4.0, "multiply");
    root spawn Calculator(20.0, 4.0, "divide");
    root spawn Calculator(144.0, 0.5, "power");
    root spawn Calculator(16.0, 0.0, "sqrt");
}