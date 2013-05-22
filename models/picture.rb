class Picture < ActiveRecord::Base
  belongs_to :vision

  def flickr_version
    FlickrConnector.new.get_picture(self.flickr_id)
  end

  def thumb
    url = TokyoProject.cache.get "cached_picture_#{self.id}_tumb"
    if url == "" || url == nil
      url = FlickRaw.url_t(flickr_version) rescue "/images/default_small.jpg"
      TokyoProject.cache.set("cached_picture_#{self.id}_tumb", url, :expires_in => 6000)
    end
    return url
  end

  def medium
    url = TokyoProject.cache.get "cached_picture_#{self.id}_medium"
    if url == "" || url == nil
      url = FlickRaw.url_m(flickr_version) rescue ""
      TokyoProject.cache.set("cached_picture_#{self.id}_medium", url, :expires_in => 6000)
    end
    return url
  end

  def large
    url = TokyoProject.cache.get "cached_picture_#{self.id}_large"
    if url == "" || url == nil
      url = FlickRaw.url_b(flickr_version) rescue ""
      TokyoProject.cache.set("cached_picture_#{self.id}_large", url, :expires_in => 6000)
    end
    return url
  end

  def clear_cache
    key = "cached_picture_#{self.id}"
    ['_tumb', '_medium', '_large'].each{|suffix| TokyoProject.cache.delete(key+suffix)}
  end
end
