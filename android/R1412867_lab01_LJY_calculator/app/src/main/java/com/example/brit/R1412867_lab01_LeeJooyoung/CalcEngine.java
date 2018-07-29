package com.example.brit.R1412867_lab01_LeeJooyoung;

public class CalcEngine {
    String Expression = "";
    CharListStack operator_list;
    DoubleListStack operand_list;
    public CalcEngine(String Expression){
        this.Expression = Expression;
        operand_list = new DoubleListStack();
        operator_list = new CharListStack();
    }
    public void calcStack(){
        char ch = '\0', opt = '\0';
        StringBuilder tmpExp = new StringBuilder();
        double opd1, opd2, res;
        boolean flag = false;
        for(int i = 0; i < Expression.length(); i++){
            ch = Expression.charAt(i);
            if(ch == ' '){
                continue;
            }
            else if(ch >= '0' && ch <= '9'){
                tmpExp.append(ch);
                if(i+1!=Expression.length()){
                    if(Expression.charAt(i+1)=='+' || Expression.charAt(i+1)=='-' || Expression.charAt(i+1)=='/' || Expression.charAt(i+1)=='*' || Expression.charAt(i+1)=='='){
                        System.out.println("!!");
                        if(flag){
                            flag = false;
                            operand_list.push(-Double.parseDouble(tmpExp.toString()));
                            tmpExp.setLength(0);
                        }
                        else{
                            operand_list.push(Double.parseDouble(tmpExp.toString()));
                            tmpExp.setLength(0);
                        }
                    }
                }
                else{
                    if(flag){
                        flag = false;
                        operand_list.push(-Double.parseDouble(tmpExp.toString()));
                    }
                    else{
                        operand_list.push(Double.parseDouble(tmpExp.toString()));
                    }
                }
            }
            else if(ch == '+' || ch == '-' || ch == '/' || ch == '*'){
                if(ch == '-'){
                    flag = true;
                    ch = '+';
                }
                if(operator_list.top == null){
                    operator_list.push(ch);
                }
                else{
                    opt = operator_list.pop();
                    if(operatorCheck(opt, ch)){
                        opd2 = operand_list.pop();
                        opd1 = operand_list.pop();
                        res = arithmatic(opd1, opd2, opt);
                        operand_list.push(res);
                        operator_list.push(ch);
                    }
                    else{
                        operator_list.push(opt);
                        operator_list.push(ch);
                    }
                }
            }

            }


        while(operator_list.top != null){
            opd1 = operand_list.pop();
            opd2 = operand_list.pop();
            opt = (Character)operator_list.pop();
            res = arithmatic(opd1, opd2, opt);
            operand_list.push(res);
        }
    }
    public boolean operatorCheck(char opt1, char opt2){
        if(opt1 == '*' || opt1 == '/'){
            if(opt2 == '+' || opt2 == '-')
                return true;
            else
                return false;
        }
        else
            return false;
    }
    public double arithmatic(double opd1, double opd2, char opt){
        if(opt == '+')
            return opd1 + opd2;
        else if(opt == '-')
            return opd1 - opd2;
        else if(opt == '*')
            return opd1 * opd2;
        else
            return opd1 / opd2;
    }
    public String result(){
        calcStack();
        return Double.toString(operand_list.pop());
    }
}


