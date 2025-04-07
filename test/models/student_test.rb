require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "check if works with valid data" do
    student = Student.new(
      first_name: "Jim",
      last_name: "Hawkins",
      check_in_time: DateTime.now
    )
    assert student.valid?
  end

  test "shouldn't work without a first name" do
    student = Student.new(
      first_name: nil,
      last_name: "Hawkins",
      check_in_time: DateTime.now
    )
    assert_not student.valid?
    assert_includes student.errors[:first_name], "can't be blank"
  end

  test "shouldn't vlid without a last name" do
    student = Student.new(
      first_name: "Jim",
      last_name: nil,
      check_in_time: DateTime.now
    )
    assert_not student.valid?
    assert_includes student.errors[:last_name], "can't be blank"
  end

  test "shouldn't be valid without a check in time" do
    student = Student.new(
      first_name: "Jim",
      last_name: "Hawkins",
      check_in_time: nil
    )
    assert_not student.valid?
    assert_includes student.errors[:check_in_time], "can't be blank"
  end
end
