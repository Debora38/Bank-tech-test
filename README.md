# Bank : example of Tech test
[![Build Status](https://travis-ci.com/Debora38/Bank-tech-test.svg?branch=master)](https://travis-ci.com/Debora38/Bank-tech-test)
## Specification

#### Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

#### Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012<br>
And a deposit of 2000 on 13-01-2012<br>
And a withdrawal of 500 on 14-01-2012<br>
When she prints her bank statement<br>
<br>
Then she would see:<br>

date || credit || debit || balance<br>
14/01/2012 || || 500.00 || 2500.00<br>
13/01/2012 || 2000.00 || || 3000.00<br>
10/01/2012 || 1000.00 || || 1000.00<br>

## My approach

After reading the above instructions, I decided that the actual functionalities requested are 3: `deposit()`, `withdraw()`, `print_statement()`, therefore only one class `BankAccount` has been created.

The 3 methods interract as below:

<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/Bank_model.png?raw=true">

## Instructions for installation

```
- clone locally
- run bundle install
- run rspec #=> confirm that all tests pass
- open irb and interact with the program as shown below
```

## How does it work

- open **irb** from inside the project folder
- require the file `require './lib/bank'`<br>
=> true
- create a bank account `account = BankAccount.new`<br>
=> #<BankAccount:0x00007fd2b8117820 @balance=0, @transactions=[]> 
- make a deposit `account.deposit(2000)`<br>
=> [{:date=>"11/03/2019", :credit=>"2000.00", :debit=>"", :balance=>"2000.00"}] 
- try to withdraw more than the available funds `account.withdraw(9000)`<br>
Traceback (most recent call last):<br>
        &nbsp; 3: from /Users/student/.rvm/rubies/ruby-2.5.0/bin/irb:11:in '<main>'<br>
        &nbsp; 2: from (irb):4<br>
        &nbsp;  1: from /Users/student/Desktop/Projects_debora/bank_tech_test/lib/bank.rb:17:in 'withdraw'<br>
**RuntimeError (Insufficient funds)**<br>
- withdraw sufficient funds `account.withdraw(500)`<br>
=> [{:date=>"11/03/2019", :credit=>"", :debit=>"500.00", :balance=>"1500.00"}, {:date=>"11/03/2019", :credit=>"2000.00", :debit=>"", :balance=>"2000.00"}] 
- print a statement `account.print_statement`<br>
 => "date || credit || debit || balance\n11/03/2019 ||  || 500.00 || 1500.00\n11/03/2019 || 2000.00 ||  || 2000.00\n" 
- make another transaction to see the statement change `account.withdraw(200)`<br>
 => [{:date=>"11/03/2019", :credit=>"", :debit=>"200.00", :balance=>"1300.00"}, {:date=>"11/03/2019", :credit=>"", :debit=>"500.00", :balance=>"1500.00"}, {:date=>"11/03/2019", :credit=>"2000.00", :debit=>"", :balance=>"2000.00"}] 
- print the statement and notice the change `account.print_statement`<br>
 => "date || credit || debit || balance\n11/03/2019 ||  || 200.00 || 1300.00\n11/03/2019 ||  || 500.00 || 1500.00\n11/03/2019 || 2000.00 ||  || 2000.00\n"
<br>
<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/Bank.png?raw=true">
