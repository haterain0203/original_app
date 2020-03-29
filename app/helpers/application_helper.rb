module ApplicationHelper
  
  def full_title(page_title="")
    base_title = "Atopic Note"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # def convert
  #   case condition.skin_condition
  #   when 1 then
  #     condition.skin_condition = "非常に良い"
  #   when 2 then
  #     condition.skin_condition = "まあまあ良い"
  #   when 3 then
  #     condition.skin_condition = "普通"
  #   when 4 then
  #     condition.skin_condition = "まあまあ悪い"
  #   when 5 then
  #     condition.skin_condition = "非常に悪い"  
  #   else
  #     condition.skin_condition = condition.skin_condition
  #   end
  # end
end
