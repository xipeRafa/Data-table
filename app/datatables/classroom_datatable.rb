class ClassroomDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to, :edit_classroom_path, :classroom_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def user
    @user ||= options[:user]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {

      subject: {source: "Classroom.subject" },
      grade: {source: "Classroom.grade_id"},
      user: {source: "Classroom.user"},
      archived: {source: "Classroom.archived" }
      # subject: {source: "Classroom.subject" },
      # student: {source: "Classroom.students" }
      # term: {source: "Classroom.term" },
      # school: {source: "School.name" },
      # teacher: {source: "User.first_name" }
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        subject: link_to("#{record.subject} (#{record.term.upcase})", classroom_path(record.id)),
        grade: record.grade.name,
        teacher: record.user.full_name,
        students: record.students.count,
        archived: record.archived ? 'Archived' : 'Active'
        # subject: link_to(record.subject + " (" + record.term.upcase() + ")", classroom_path(record.id)),
        # school: link_to(record.school.name, show_school_path(record.school.id)),
        # school: record.school.name,
        # teacher: record.user.full_name,
        # student: record.student.count,
        # actions: link_to("Edit", edit_classroom_path(record.id)), 
        # show: link_to("Show", classroom_path(record.id)),
        # delete: link_to("Delete", classroom_path(record.id), method: :delete, data: { confirm: 'Are you sure?' })

      
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
      if user.admin?
         Classroom.where(school_id: user.school_id).distinct
      elsif user.teacher?
           Classroom.where(user_id: user.id, :archived => false).distinct
      else
           Classroom.distinct
      end
    # insert query here
    # User.all
    # 
  end

end

