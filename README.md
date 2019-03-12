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

##### 1st approach
After reading the above instructions, I decided that the actual functionalities requested are 3: `deposit()`, `withdraw()`, `print_statement()`, therefore only one class `BankAccount` has been created at first.

The 3 methods interracted as below:

<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/Bank_model.png?raw=true">

##### 2nd approach
After realising that the `print statement()` functionality involves the interface and does not fit with `deposit()` and `withdraw()`, I moved it to a `class Display` and refactored the program as below:

<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/bank%20model%20refactored.png?raw=true">

##### 3rd approach
After taking a self-assesment quiz, I realised that I could extrapolate more from the 2 current classes and avoid the array of hashes, initialilzing transactions objects and storing them in the array. This array of transactions can also be extrapolated and saved into an Account_History class.

<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/Bank%20refactored%204%20classes(4).png?raw=true">

## Instructions for installation

```
- clone locally
- run bundle install
- run rspec #=> confirm that all tests pass
- open irb and interact with the program as shown below
```

## How does it work

- open **irb** from inside the project folder
- require the file `require './lib/bankaccount'`<br>
=> true
- create a bank account `account = BankAccount.new`<br>
=> => #<BankAccount:0x00007fb2ae866b50 @balance=0, @account_history=#<AccountHistory:0x00007fb2ae866b28 @all_transactions=[], @transaction=Transactions>, @display=#<Display:0x00007fb2ae866ad8 @account_history=#<AccountHistory:0x00007fb2ae866b28 @all_transactions=[], @transaction=Transactions>>>
- make a deposit `account.deposit(2000)`<br>
=> [#<Transactions:0x00007fb2ae856228 @date="12/03/2019", @credit=2000, @debit=0, @balance=2000>] 
- try to withdraw more than the available funds `account.withdraw(9000)`<br>
Traceback (most recent call last):<br>
        &nbsp; 3: from /Users/student/.rvm/rubies/ruby-2.5.0/bin/irb:11:in '<main>'<br>
        &nbsp; 2: from (irb):4<br>
        &nbsp;  1: from /Users/student/Desktop/Projects_debora/bank_tech_test/lib/bank.rb:17:in 'withdraw'<br>
**RuntimeError (Insufficient funds)**<br>
- withdraw sufficient funds `account.withdraw(500)`<br>
 => [#<Transactions:0x00007fb2ae84abd0 @date="12/03/2019", @credit=0, @debit=500, @balance=1500>, #<Transactions:0x00007fb2ae856228 @date="12/03/2019", @credit=2000, @debit=0, @balance=2000>] 
- print a statement `account.display.print_statement`<br>
 date || credit || debit || balance<br>
12/03/2019 ||  || 500.00 || 1500.00<br>
12/03/2019 || 2000.00 ||  || 2000.00<br>
 => nil<br>
- make another transaction to see the statement change `account.withdraw(200)`<br>
 => [#<Transactions:0x00007fb2ad886208 @date="12/03/2019", @credit=0, @debit=200, @balance=1300>, #<Transactions:0x00007fb2ae84abd0 @date="12/03/2019", @credit=0, @debit=500, @balance=1500>, #<Transactions:0x00007fb2ae856228 @date="12/03/2019", @credit=2000, @debit=0, @balance=2000>] 
- print the statement and notice the change `account.display.print_statement`<br>
date || credit || debit || balance<br>
12/03/2019 ||  || 200.00 || 1300.00<br>
12/03/2019 ||  || 500.00 || 1500.00<br>
12/03/2019 || 2000.00 ||  || 2000.00<br>
 => nil<br>
<br>
<img src="https://github.com/Debora38/Bank-tech-test/blob/master/docs/Bank%20program%203.png?raw=true">
