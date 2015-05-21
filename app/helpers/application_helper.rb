module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "IncluStaff LLC."  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{page_title} | #{base_title}"                 # String interpolation
    end
  end
  
  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  
end