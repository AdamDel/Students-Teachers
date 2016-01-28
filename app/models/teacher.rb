class Teacher < ActiveRecord::Base
  has_many :students
  validates :email, uniqueness: true
  validate :retirement_after_hire  
  after_save :check_if_retired, if: :retirement_date

  def retirement_after_hire
    if retirement_date && hire_date && retirement_date < hire_date
      errors.add(:retirement_date, 'Retirement Date should be after Hire Date')
    elsif retirement_date && retirement_date > Date.today
      errors.add(:retirement_date, 'Retirement Date cannot be in the future')
    end
  end

  def check_if_retired
    students.all
  end
