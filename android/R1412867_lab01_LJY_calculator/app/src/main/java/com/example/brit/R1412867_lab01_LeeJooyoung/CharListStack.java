package com.example.brit.R1412867_lab01_LeeJooyoung;

class NodeC{
    char data;
    NodeC nextNode;

    public NodeC(char data){
        this.data = data;
        this.nextNode = null;
    }
}
public class CharListStack {
    NodeC top;

    public CharListStack(){
        this.top = null;
    }

    public boolean empty(){
        return (top == null);
    }

    public void push(char item){
        NodeC newNode = new NodeC(item);
        newNode.nextNode = top;
        top = newNode;
    }

    public char pop(){
        char item = peek();
        top = top.nextNode;
        return item;
    }

    public char peek(){
        if(empty()) throw new ArrayIndexOutOfBoundsException();
        return top.data;
    }
}

