class StudentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to, :student_path, :edit_student_path, :classroom_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def school
    @school ||= options[:school]
  end

  def query_params
      @query ||= options[:query]
  end


  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      full_name: {source: "Student.first_name" },
      # grade: {source: "Classroom.grade" },
      #isactive: {source: "Student.isactive" }
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        full_name: link_to(record.full_name, student_path(record.id)),
        # full_name: record.full_name,
        # grade: record.grade.name,
        classroom: link_to("#{record.classroom.subject} (#{record.classroom.term.upcase})", classroom_path(record.classroom.id)),
        # is_active: record.isactive,
        edit: link_to("Edit", edit_student_path(record.id)),
        grade: record.grade.name,
        status: record.status,
        studentdata: record.studentdatum.count
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
      if query_params.present?
            student_ids = Student.search(query_params).pluck(:id)
            Student.includes(:classroom).references(:classroom).where("students.id IN (?) AND classrooms.school_id =?", (student_ids),  school)
      else
            Student.includes(:classroom).references(:classroom).where("classrooms.school_id =?", school)
      end
    # Student.all.distinct
    # insert query here
    # User.all
  end

end
