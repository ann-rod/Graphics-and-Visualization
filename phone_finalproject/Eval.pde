class Eval{
  String exp;
  
  Eval(String exp){
    this.exp = exp;
    
  }
  
  int ev(String exp){
    char[] tokens = exp.toCharArray();
    Stack<Integer> values = new Stack<Integer>();
    Stack<Character> ops = new Stack<Character>();
    
    for (int i = 0; i < tokens.length; i++){
      // Current token is whitespace
      if (tokens[i] == ' '){
        continue;
      }
      // Current token is a numberpush it to stck
      if(tokens[i] >= '0' && tokens[i] <= '9'){
       StringBuffer sbuf = new StringBuffer();
       while (i < tokens.length && tokens[i] >= '0' && tokens[i] <= '9')
       sbuf.append(tokens[i++]);
       values.push(Integer.parseInt(sbuf.toString()));
                  i--;
            }
 
            // Current token is an operator.
            else if (tokens[i] == '+' || tokens[i] == '-' || tokens[i] == '*' || tokens[i] == '/'){
                while (!ops.empty() &&
                       hasPrecedence(tokens[i],
                                    ops.peek()))
                  values.push(applyOp(ops.pop(),
                                   values.pop(),
                                 values.pop()));
 
                ops.push(tokens[i]);
              }
            }
            while (!ops.empty()) values.push(applyOp(ops.pop(),values.pop(), values.pop()));
 
        // Top of 'values' contains
        // result, return it
        return values.pop();
    
  }
  boolean hasPrecedence(char op1, char op2){
    if((op1 == '*' || op1 == '/') &&
    (op2 == '+' || op2 == '-')){
      return false;
      
    }
    else{
    return true;
    }
    
    
  }
  
  int applyOp(char op, int b, int a){
    switch (op)
        {
        case '+':
            return a + b;
        case '-':
            return a - b;
        case '*':
            return a * b;
        case '/':
            if (b == 0)
                throw new
                UnsupportedOperationException(
                      "Cannot divide by zero");
            return a / b;
        }
        return 0;
    
    
  }
  
  void display(){
    
    
  }
  
  
  
  
  
}
