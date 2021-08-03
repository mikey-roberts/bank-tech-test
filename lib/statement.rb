class Statement
  STATEMENT_HEADER = "date || credit || debit || balance"
  attr_reader :transaction_history
 
  # Heading text for summary STDout
  def print_header
    puts STATEMENT_HEADER
  end

  # Array iteration for summary STDout
  def print_body(transaction_history)
    transaction_history.reverse.each { |transaction| puts transaction }
  end
end