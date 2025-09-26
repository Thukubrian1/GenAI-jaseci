impl Calculator.start {
    if not [root --> (`?calculation)] {
        next = root ++> calculation();
    } else {
        next = [root --> (`?calculation)];
    }
    visit next;
}

impl Calculator.process_calculation {
    if [-->] {
        visit [-->];
    } else {
        here.operation_type = self.operation;
        
        if self.operation == "add" {

            here.result = self.num1 + self.num2;

            print(f"{self.num1} + {self.num2} = {here.result}");

            if self.show_insights {
                print(give_math_insight(self.num1, self.num2, "addition", here.result));

            }
        } 
        
        elif self.operation == "subtract" {

            here.result = self.num1 - self.num2;

            print(f"{self.num1} - {self.num2} = {here.result}");

            if self.show_insights {

                print(give_math_insight(self.num1, self.num2, "subtraction", here.result));
            }

        } 
        elif self.operation == "multiply" {

            here.result = self.num1 * self.num2;

            print(f"{self.num1} × {self.num2} = {here.result}");

            if self.show_insights {

                print(give_math_insight(self.num1, self.num2, "multiplication", here.result));

            }
        } 
        elif self.operation == "divide" {

            if self.num2 != 0 {

                here.result = self.num1 / self.num2;

                print(f"{self.num1} ÷ {self.num2} = {here.result}");

                if self.show_insights {

                    print(give_math_insight(self.num1, self.num2, "division", here.result));

                }
            } 
            else {

                print("Error: Division by zero is not allowed!");

                print(give_calculation_help(self.num1, self.num2, "divide", 0.0));

                here.result = 0.0;
            }
        } elif self.operation == "power" {

            here.result = self.num1 ** self.num2;

            print(f"{self.num1} ^ {self.num2} = {here.result}");

            if self.show_insights {

                print(give_math_insight(self.num1, self.num2, "exponentiation", here.result));
                
            }
        } 
        
        elif self.operation == "sqrt" {

            if self.num1 >= 0 {

                here.result = self.num1 ** 0.5;

                print(f"√{self.num1} = {here.result}");

                if self.show_insights {

                    print(give_math_insight(self.num1, 0.5, "square root", here.result));

                }
            } 
            else {

                print("Error: Square root of negative number is not supported!");

                print(give_calculation_help(self.num1, 0.0, "sqrt", 0.0));

                here.result = 0.0;
            }
        } 
        else {

            print(f"Error: Unknown operation '{self.operation}'");

            print("Supported operations: add, subtract, multiply, divide, power, sqrt");
            
            print(give_calculation_help(self.num1, self.num2, self.operation, 0.0));
        }
        
        disengage;
    }
}