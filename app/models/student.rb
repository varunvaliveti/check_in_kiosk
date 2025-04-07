class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :check_in_time, presence: true
  validates :email, presence: true, uniqueness: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+(\.edu|\.org)\z/i, message: "must be a valid .edu address" }
  validates :major, presence: true

  

  VALID_MAJORS = [
    "Accounting",
 "Business Analytics",
 "Business Information Systems",
 "Business Research",
 "Finance",
 "General Management",
 "Hospitality Business",
 "Human Resource Management",
 "Logistics",
 "Marketing",
 "Marketing Research",
 "Operations and Sourcing Management",
 "Strategic Management",
 "Supply Chain Management",
 "Computer Engineering",
 "Computer Science",
 "Software Engineering",
 "Animal Science",
 "Biosystems Engineering",
 "Community Sustainability",
 "Conservation Law",
 "Environmental Design (MA)",
 "Environmental Economics and Policy",
 "Food Industry Management",
 "Food Science",
 "Forestry",
 "Human Nutrition",
 "Interior Design",
 "Landscape Architecture",
 "Nutritional Sciences",
 "Composition",
 "Jazz Studies",
 "Music",
 "Music Composition",
 "Music Education",
 "Music Performance",
 "Music Theory",
 "Applied Spanish Linguistics",
 "Arabic",
 "Art Education",
 "Art History",
 "Chinese",
 "English",
 "Film Studies",
 "French",
 "German",
 "Hispanic Literatures",
 "Interdisciplinary Humanities",
 "Japanese",
 "Linguistics",
 "Literature in English",
 "Philosophy",
 "Professional Writing",
 "Religious Studies",
 "Russian",
 "Spanish (BA)",
 "Studio Art (BA)",
 "Theatre (MFA)",
 "Womens and Gender Studies",
 "Advertising",
 "Communication",
 "Journalism",
 "Media and Information (BA)",
 "Public Relations",
 "Curriculum, Instruction and Teacher Education",
 "Education",
 "Science Education",
 "Student Affairs Administration",
 "Teaching and Curriculum",
 "Urban Education",
 "Chemical Engineering",
 "Civil Engineering",
 "Computer Engineering",
 "Computer Science",
 "Electrical Engineering",
 "Engineering Mechanics",
 "Environmental Engineering",
 "Materials Science and Engineering",
 "Mechanical Engineering",
 "Biochemistry and Molecular Biology",
 "Biostatistics",
 "Epidemiology",
 "Microbiology",
 "Physiology",
 "Astrophysics",
 "Cell and Molecular Biology",
  ]

  validate do |student|
    
    if  !(VALID_MAJORS.include?(major))
      errors.add :major, :invalid ,message: "invalid major selected"
    end
    
  end

  def self.check_in(student_params)
    student = Student.find_by(email: student_params[:email])
    
    if student
      student.check_in_count += 1
      student.check_in_time = Time.current
      student.update(student_params.except(:email))
      student
    else
      Student.create(student_params.merge(check_in_time: Time.current))
    end
  end
end
