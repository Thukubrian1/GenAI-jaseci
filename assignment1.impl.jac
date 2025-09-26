impl Calculator.start {
    if not [root-->(`? calculation)] {
        next = root ++> calculation();
    } else {
        next = [root-->(`? calculation)];
    }
    visit next;
}

impl Calculator.process_calculation {
    if [-->] {

        visit [-->];

    } 
    
    else {
        here.operation_type = self.operation;
        
        if self.operation == "add" {


            here.result = self.num1 + self.num2;

            print(f"The sum of {self.num1} and {self.num2} = {here.result}");

        } 
        elif self.operation == "subtract" {

            here.result = self.num1 - self.num2;

            print(f"The subtraction of {self.num1} and {self.num2} = {here.result}");

        } 
        elif self.operation == "multiply" {

            here.result = self.num1 * self.num2;

            print(f"The multiplication of {self.num1} by {self.num2} = {here.result}");

        } 
        elif self.operation == "divide" {

            if self.num2 != 0 {

                here.result = self.num1 / self.num2;

                print(f"The division of {self.num1} by {self.num2} = {here.result}");

            } 
            
            else {
                print("Error: Division by zero is not allowed!");
                here.result = 0.0;
            }

        } 
        else {

            print(f"Error: Unknown operation '{self.operation}'");

            print("Supported operations: add, subtract, multiply, divide");
        }
        
        disengage;
    }
}