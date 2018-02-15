# Application controller helper
module ApplicationHelper
  # Change title on each page to base + additional
  def full_title(page_title = '')
    base_title = 'Witaj na blogu!'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
