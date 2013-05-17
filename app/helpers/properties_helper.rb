module PropertiesHelper
  def gen_google_maps_url(property, extra_properties=[])
    basic_map = "http://maps.googleapis.com/maps/api/staticmap?center=#{property.latitude},#{property.longitude}&zoom=11&size=600x400&sensor=false"+add_pin('*', property)

    extra_properties.each_with_index do |p, index|
      basic_map += add_pin(index, p)
    end

    basic_map
  end

  def add_pin(char, property)
    "&markers=color:red%7Clabel:#{char}%7C#{property.latitude},#{property.longitude}"
  end
end
