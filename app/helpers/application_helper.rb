module ApplicationHelper

  def nil?(t)
    if t.empty?
      " - "
    else
      "#{t}"
    end
  end


  #Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Sisdun"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
