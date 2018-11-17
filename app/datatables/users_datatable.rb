class UsersDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :check_box_tag, :link_to, :mail_to

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
      full_name: {source: "User.first_name" },
      
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        full_name: record.full_name
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    User.where(school_id: user.school_id).distinct
  end

end
