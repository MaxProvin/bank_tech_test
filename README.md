# Bank tech test

## Usage
### Installation (via command line)
- `git clone https://github.com/MaxProvin/bank_tech_test.git`
- `bundle`

### Tests
- `rspec`

### Interacting with code via commmand line
```
2.3.0 :001 > require './lib/account.rb'
 => true
2.3.0 :002 > require './lib/log.rb'
 => true
2.3.0 :003 > require './lib/statement.rb'
 => true
 2.3.0 :009 > a = Account.new('Max')
 => #<Account:0x007fc64b0dd040 @owner="Max", @balance=0, @transactions=#<Log:0x007fc64b0dd018 @display=[]>>
2.3.0 :011 > a.deposit(1000)
 => [{:date=>#<DateTime: 2016-11-30T09:48:18+00:00 ((2457723j,35298s,51234000n),+0s,2299161j)>, :transaction=>1000, :balance=>1000}]
2.3.0 :012 > a.deposit(500)
 => [{:date=>#<DateTime: 2016-11-30T09:48:18+00:00 ((2457723j,35298s,51234000n),+0s,2299161j)>, :transaction=>1000, :balance=>1000}, {:date=>#<D.............]
2.3.0 :013 > a.withdraw(234)
 => [{:date=>#<DateTime: 2016-11-30T09:48:18+00:00 ((2457723j,35298s,51234000n),+0s,2299161j)>, :transaction=>1000, :balance=>1000}, .......]
 2.3.0 :014 > a.print_statement
date       || credit || debit   || balance
30/11/2016 ||        ||234.00   ||1266.00
30/11/2016 ||500.00  ||         ||1500.00
30/11/2016 ||1000.00 ||         ||1000.00
 => nil
2.3.0 :015 > exit
```

## Specification

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```
