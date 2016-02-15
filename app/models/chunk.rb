class Chunk < ActiveRecord::Base
  belongs_to :subject
  has_many :recall_tests

  # Define how far apart each test is in days.
  @@TEST_SPACING_DAYS = [1, 1, 1, 2, 2, 4, 7]

  # Return the next test date. If the test sequence number is less than 0
  # it means that all tests were successfully passed and no new tests will be
  # set. In this case nil will be returned.
  def set_next_test_date
    if more_tests?
      next_date = Date.today() + @@TEST_SPACING_DAYS[test_sequence_number]
      update(next_test_date: next_date, \
      test_sequence_number: test_sequence_number.to_i + 1)
    else
      update(next_test_date: nil) unless next_test_date.nil?
    end
  end

  private
  # Return whether there are any more tests to be done
  def more_tests?
    test_sequence_number >= 0 && \
    test_sequence_number < @@TEST_SPACING_DAYS.length
  end
end
