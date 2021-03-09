class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = 'pending'

    def valid?
     # binding.pry
      true if sender.valid? == true && receiver.valid? == true
    end 

    def execute_transaction
      #binding.pry
      if self.valid? && sender.balance > amount && self.status == 'pending'
        receiver.balance += amount
        sender.balance -= amount
        self.status = 'complete'
      else
        self.status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end 

    end 

    def reverse_transfer
      if self.execute_transaction != 'rejected'
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      end 
    end 

  end

end
