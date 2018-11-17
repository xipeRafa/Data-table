class ClassroomStudentsDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to, :edit_student_path, :classroom_path,
   :student_path, :new_studentdatum_path, :toggle_student_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def classroom
    @classroom ||= options[:classroom]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      full_name: {source: "Student.first_name" },
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
        # is_active: record.isactive,
        edit: link_to("Edit", edit_student_path(record.id)),
        status: record.status,
        studentdata: record.studentdatum.where(user_id: record.classroom.user_id).count,
        actions: link_to("Add data", new_studentdatum_path, class: 'btn btn-success')+
        " "+ link_to("Toggle status", toggle_student_path(record.id), class: 'btn btn-info', method: :put)+
        " "+ link_to("Drop", new_studentdatum_path, class: 'btn btn-danger')
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    Student.includes(:classroom)
    .where(classroom_id: classroom)
    .references(:classroom)
    # insert query here
    # User.all
  end

end
