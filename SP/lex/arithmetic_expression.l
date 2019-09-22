%{
char stack[100];
int top = -1;
int valid = 1;
int operatorC, operandC = 0;

void push(char ch){
	if (top == 100)
		printf("Stack Overflow");
	else {
		top++;
		stack[top] = ch;
	}
}

char pop() {
	if (top == -1){
		printf("Stack Underflow");
		exit(1);
	} else {
		char ch = stack[top];
		top--;
		return ch;
	}
}
%}

%%
"(" {
	top++;
	stack[top] = '(';
}
")" {
	if (stack[top] != '('){
		printf("Bracket does not match\n");
		valid = 0;
		return 0;
	} else top--;
}
["+"|\-|"/"|"*"] {
	operatorC++;
}
[0-9]+(\.[0-9]+)? {
	operandC++;
}
%%

int main() {
	yylex();
	if (valid == 1 && top == -1 && (operandC - operatorC) == 1) {
		printf("Valid Expression\n");
	} else 	printf("Invalid Expression\n");
	return 0;
}
