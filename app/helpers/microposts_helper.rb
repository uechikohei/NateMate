module MicropostsHelper

  def exif_valid?(model)
    return true if model.exif_is_valid == true && model.latitude.present? && model.longitude.present? \
                                               && model.latitude != 0.0 && model.longitude != 0.0

    false
  end

  def address_valid?(model)
    return true if model.address && model.latitude.present? && model.longitude.present? \
                                 && model.latitude != 0.0 && model.longitude != 0.0

    false
  end


  private
  # 画像のExifから緯度経度を取得
  def get_exif(model)
    require 'exifr/jpeg'
    @exif = if Rails.env.production?
              EXIFR::JPEG.new(open(model.picture.url))
            else
              EXIFR::JPEG.new(Rails.root.to_s + "/public/#{model.picture.url}")
            end
    @lat = @exif.gps_latitude.to_f
    @lng = @exif.gps_longitude.to_f

  rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG
  end
end
