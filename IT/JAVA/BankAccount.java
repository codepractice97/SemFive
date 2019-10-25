import java.util.Scanner;
import java.util.ArrayList;

class BankAccount {
    
    int acc_no;
    float balance;

    public BankAccount(int acc_no, float balance){
        this.acc_no = acc_no;
        this.balance = balance;
    }

    float deposit(float amount){
        balance += amount;
        return amount;
    }

    float withdraw(float amount){
        if (balance - amount >= 0){
            balance -= amount;
            return balance;
        } else {
            System.out.println("Insufficient Balance");
            return 0;
        }
    }

    int getAccountNumber() { return acc_no; }

    float getBalance() { return balance; }

    // tax_percent in percent/100 form
    float taxDeduction(float tax_percent){
        float tax = balance * tax_percent;
        return withdraw(tax);
    }

}

class Bank {

    ArrayList<BankAccount> bankAccounts = new ArrayList<BankAccount>();
    static int last_acc_no = 0;

    void addAccount(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter balance for new account");
        float balance = Float.parseFloat(sc.nextLine());
        BankAccount ba = new BankAccount(last_acc_no++, balance);
        bankAccounts.add(ba);
    }

    float getTotalBalance(){
        float sum = 0.0f;
        for(BankAccount bankAccount:bankAccounts)
            sum += bankAccount.getBalance();
        return sum;
    }

    int getMaxBalanceAccount(){
        int max_acc_no = bankAccounts.get(0).getAccountNumber();
        float max_bal = bankAccounts.get(0).getBalance();
        for(BankAccount bankAccount:bankAccounts){
            if (bankAccount.getBalance() > max_bal){
                max_acc_no = bankAccount.getAccountNumber();
                max_bal = bankAccount.getBalance();
            }
        }
        return max_acc_no;
    }

    int getMinBalanceAccount(){
        int min_acc_no = bankAccounts.get(0).getAccountNumber();
        float min_bal = bankAccounts.get(0).getBalance();
        for(BankAccount bankAccount:bankAccounts){
            if (bankAccount.getBalance() < min_bal){
                min_acc_no = bankAccount.getAccountNumber();
                min_bal = bankAccount.getBalance();
            }
        }
        return min_acc_no;
    }

    boolean accountExists(int acc_no){
        for (BankAccount bankAccount:bankAccounts){
            if (bankAccount.getAccountNumber() == acc_no)
                return true;
        }
        return false;
    }

    int minBalanceAccountCount(float min_bal){
        int count = 0;
        for (BankAccount bankAccount:bankAccounts){
            if (bankAccount.getBalance() >= min_bal)
                count++;
        }
        return count;
    }

}