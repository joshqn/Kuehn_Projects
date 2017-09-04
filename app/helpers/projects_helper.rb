module ProjectsHelper
  COLORS_ARRAY = ["#FF3B30", "#FF9500", "#4CD964", "#007AFF", "#FFCC00"]
  def random_background_color
    return COLORS_ARRAY.sample
  end
end
