
Schooldistrict.create!([
  {name: "Pima", state: "AZ", city: "Tucson", zip: 83000},
  {name: "Glendale Unified", state: "CA", city: "Glendale", zip: 91020}
])
School.create!([
  {name: "Pima school", schooldistrict_id: 1, user_id: 2},
  {name: "Glendale University", schooldistrict_id: 2, user_id: 3}
])
User.create!([
  {email: "superadmin@website.com", password: "Test123!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: "superadmin", first_name: "Admin", last_name: "Ruben", schooldistrict_id: 0, school_id: 0, payment_gateway_customer_identifier: nil},
  {email: "admin@website.com", password: "Test123!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: "admin", first_name: "admin", last_name: "Johnson", schooldistrict_id: 1, school_id: 1, payment_gateway_customer_identifier: nil},
  {email: "principal2@website.com", password: "Test123!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: "admin", first_name: "admin", last_name: "Edward", schooldistrict_id: 1, school_id: 2, payment_gateway_customer_identifier: nil},
  {email: "teacher@website.com", password: "Test123!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: "teacher", first_name: "Teacher", last_name: "Sonjohn", schooldistrict_id: 1, school_id: 1, payment_gateway_customer_identifier: nil},
  {email: "teacher2@website.com", password: "Test123!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: "teacher", first_name: "Teacher", last_name: "Martinez", schooldistrict_id: 1, school_id: 2, payment_gateway_customer_identifier: nil},
])
Grade.create!([
  {name: "Pre-K", school_id: 1},
  {name: "Kindergarten", school_id: 1},
  {name: "1st Grade", school_id: 1},
  {name: "2nd Grade", school_id: 1},
  {name: "3rd Grade", school_id: 1},
  {name: "4th Grade", school_id: 1},
  {name: "5th Grade", school_id: 1},
  {name: "6th Grade", school_id: 1},
  {name: "7th Grade", school_id: 1},
  {name: "8th Grade", school_id: 1},
  {name: "9th Grade", school_id: 1},
  {name: "10th Grade", school_id: 1},
  {name: "11th Grade", school_id: 1},
  {name: "12th Grade", school_id: 1}
])
Classroom.create!([
  {subject: "Algorithms", school_id: 1, user_id: 4, student_id: nil, term: "winter", grade_id: 8, archived: false},
  {subject: "History", school_id: 1, user_id: 4, student_id: nil, term: "spring", grade_id: 11, archived: false},
  {subject: "History", school_id: 1, user_id: 5, student_id: nil, term: "fall", grade_id: 9, archived: false},
  {subject: "Biology", school_id: 1, user_id: 5, student_id: nil, term: "winter", grade_id: 9, archived: false},
  {subject: "Physics", school_id: 1, user_id: 4, student_id: nil, term: "fall", grade_id: 13, archived: true}
])
Student.create!([
  {first_name: "Ruben", last_name: "NumberOne", classroom_id: 5, studentdata_id: nil, isactive: true, middlename: "Sr."},
  {first_name: "Martin", last_name: "Antonio", classroom_id: 2, studentdata_id: nil, isactive: true, middlename: "Mc"},
  {first_name: "Student", last_name: "NumberOne", classroom_id: 3, studentdata_id: nil, isactive: true, middlename: "Sr."},
  {first_name: "Alexander", last_name: "Someguy", classroom_id: 1, studentdata_id: nil, isactive: true, middlename: "Sr."},
  {first_name: "Memo", last_name: "Xipe", classroom_id: 5, studentdata_id: nil, isactive: true, middlename: "Sr."},
  {first_name: "Student", last_name: "Second", classroom_id: 5, studentdata_id: nil, isactive: true, middlename: "Martines"},
  {first_name: "Joseph", last_name: "Chambers", classroom_id: 1, studentdata_id: nil, isactive: true, middlename: "M"}
])
Studentdatum.create!([
  {title: "asdasd", text: "asdasd", student_id: 7, user_id: 4, classroom_id: 1},
  {title: "asdas", text: "asdas", student_id: 2, user_id: 4, classroom_id: 2},
  {title: "Student 1", text: "This is data for student One", student_id: 5, user_id: 4, classroom_id: 5},
  {title: "Ruben", text: "Has some data", student_id: 1, user_id: 4, classroom_id: 5}
])


Plan.create!([
  {"name"=>"Teacher", "frequency"=>"month", "symbol"=>"$", "amount"=>10, "currency"=>"usd", "features"=>"Unlimited Students\r\nTrack Data\r\nEmail support\r\nSort Data\r\n"},
  {"name"=>"Admin", "frequency"=>"month", "symbol"=>"$", "amount"=>30, "currency"=>"usd", "features"=>"Add and Edit students\r\nQuickly View Data\r\nPriority email support\r\nQuickly search students\r\n"}
  ])
