require 'date'
class Student < ActiveRecord::Base
  belongs_to :teacher
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  before_validation :check_age
  #after_save :add_to_teacher, if: :teacher
  def name
    name = self.first_name+' '+self.last_name
  end

  def age
    ((Date.today.jd - birthday.jd)/365).to_i if birthday
  end

  def check_age
    age > 3 if age
  end
  def add_to_teacher
    self.teacher.last_student = Date.today
    self.teacher.save
  end
end

