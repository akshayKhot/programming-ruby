class Account
  attr_accessor :details, :holder

  def initialize(details, holder)
    @details = details
    @holder = holder
  end
end