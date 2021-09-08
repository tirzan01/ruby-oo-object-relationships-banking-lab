class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount || @status == 'complete'
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
    @status = 'complete'
    @sender.balance -= amount
    @receiver.balance += amount
  end

  def reverse_transfer
    return unless @status == 'complete'
    @status = 'reversed'
    @sender.balance += amount
    @receiver.balance -= amount
  end

end
