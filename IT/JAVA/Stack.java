import java.util.ArrayList;

abstract class Stack {
    abstract void push(int data);
    abstract int pop();
    abstract void display();
}

class DynamicStack extends Stack {
    ArrayList<Integer> s = new ArrayList<Integer>();

    void push(int data){ s.add(data); }

    int pop(){ 
        if (s.size() <= 0){
            System.out.println("Stack Underflow");
            return -1;
        } else {
            return s.remove(s.size() - 1);
        }
    }

    void display(){
        for(Integer i:s){
            System.out.print(i + " ");
        }
    }
}

class StaticStack extends Stack {
    int size = 100;
    int s[] = new int[size];
    int top = -1;

    void push(int data){
        if(top == size){
            System.out.println("Stack Overflow");
        } else {
            top++;
            s[top] = data;
        }
    }

    int pop(){
        if(top == -1){
            System.out.println("Stack Underflow");
            return -1;
        } else {
            return s[top--];
        }
    }

    void display(){
        for(int i:s){
            System.out.print(i + " ");
        }
    }
}