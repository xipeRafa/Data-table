json.set! :data do
  json.array! @grades do |grade|
    json.partial! 'grades/grade', grade: grade
    json.url  "
              #{link_to 'Show', grade }
              #{link_to 'Edit', edit_grade_path(grade)}
              #{link_to 'Destroy', grade, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end