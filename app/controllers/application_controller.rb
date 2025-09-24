class ApplicationController < ActionController::Base
  helper_method :sortable

  private

  def sortable(column, title = nil)
    title ||= column.titleize

    # Determine the current sort column and direction
    is_sorted_column = (column == @sort_column)
    css_class = is_sorted_column ? "sorted-#{@direction}" : nil
    direction = (is_sorted_column && @direction == "asc") ? "desc" : "asc"

    # Adding a sort indicator symbol
    indicator = is_sorted_column ? (@direction == "asc" ? " &#9650;".html_safe : " &#9660;".html_safe) : ""
    view_context.link_to(title.html_safe + indicator, { sort_by: column, direction: direction }, { class: css_class })
  end
end
