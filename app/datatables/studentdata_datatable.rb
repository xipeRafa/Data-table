class StudentdataDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to, :student_path, :classroom_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def student
    @student ||= options[:student]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      title: {source: "Studentdatum.title"},
      text: {source: "Studentdatum.text"},
      classroom: {source: "Classroom.subject"},
      term: {source: "Classroom.term"},
      created_at: {source: "Studentdatum.created_at"},
      
      # title: {source: "Studentdatum.title"},
      # text: {source: "Studentdatum.text"},
      # classroom: {source: "Classroom.subject"},
      # teacher: {source: "User.first_name" },
      # date: {source: "Studentdatum.created_at"}
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        title: record.title,
        text: record.text,
        classroom: link_to("#{record.classroom.subject} (#{record.classroom.term.upcase}) #{record.classroom.user.full_name}", classroom_path(record.classroom.id)),
        created_at: record.created_at
        # title: record.title,
        # text: record.text,
        # classroom: record.classroom.subject,
        # teacher: record.user.full_name,
        # date: record.created_at
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    # before 
    # Studentdatum.all.includes(:student).references(:student).distinct
    # now
    Studentdatum.where(student_id: params[:id]).includes(:student).references(:student).distinct
  end

end
