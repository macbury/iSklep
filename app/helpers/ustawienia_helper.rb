module UstawieniaHelper
  
  def config_text_field(key,value)
    text_field key, value, :value => CONFIG[key][value]
  end
  
  def config_text_area(key,value)
    text_area key, value, :value => CONFIG[key][value], :style => 'height: 80px'
  end
  
  def config_select(key,value,array)
    select key, value, array, :selected => CONFIG[key][value]
  end
end
