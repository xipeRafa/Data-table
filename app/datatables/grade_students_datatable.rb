class GradeStudentsDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to, :student_path, :classroom_path


  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def grade
    @grade ||= options[:grade]
  end

  def user
    @user ||= options[:user]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      full_name: {source: "Student.first_name" },
      subject: {source: "Classroom.subject" },
      data: {source: "Student.studentdata"}
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        full_name: link_to(record.full_name, student_path(record.id)),
        subject: link_to("#{record.classroom.subject} (#{record.classroom.term.upcase})", classroom_path(record.classroom.id)),
        data: record.studentdatum.count,
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    Student.includes(:classroom).references(:classroom).where("students.classroom_id IN (?) AND classrooms.grade_id =?", (user.school.classrooms.pluck(:id)), grade)
    # insert query here
    # User.all
  end

end
