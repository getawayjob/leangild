module ApplicationHelper
  def full_title(page_title)
    base_title = 'Leangild'
    "#{base_title} | #{page_title}"
  end
end
