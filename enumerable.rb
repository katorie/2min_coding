class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

portfolio = Portfolio.new
portfolio.add_account(Account.new('katorie', 10000))
portfolio.add_account(Account.new('kararie', 20000))

pp portfolio.any? {|account| account.balance < 10000 }
pp portfolio.all? {|account| account.balance >= 10000 }