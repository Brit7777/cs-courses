package com.example.brit.R1412867_lab01_LeeJooyoung;

class NodeD{
    double data;
    NodeD nextNode;

    public NodeD(double data){
        this.data = data;
        this.nextNode = null;
    }
}
public class DoubleListStack {
    NodeD top;

    public DoubleListStack(){
        this.top = null;
    }

    public boolean empty(){
        return (top == null);
    }

    public void push(double item){
        NodeD newNode = new NodeD(item);
        newNode.nextNode = top;
        top = newNode;
    }

    public double pop(){
        double item = peek();
        top = top.nextNode;
        return item;
    }

    public double peek(){
        if(empty()) throw new ArrayIndexOutOfBoundsException();
        return top.data;
    }
}

