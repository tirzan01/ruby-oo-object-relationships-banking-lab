class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    self.class.all << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def self.all
    @@all
  end

  def valid?
    @status == 'open' && @balance > 0
  end

  def close_account
    @status = 'closed'
  end

end
