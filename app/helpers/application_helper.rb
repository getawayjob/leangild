module ApplicationHelper
  def full_title(page_title)
    base_title = 'Leangild'
    "#{base_title} | #{page_title}"
  end

  # link_to_trackable objects, for public activity
  def link_to_trackable(object, object_type)
	if object
		link_to object_type.downcase, object
	else
	  "a #{object_type.downcase} which has been deleted."
  end
 end
end
