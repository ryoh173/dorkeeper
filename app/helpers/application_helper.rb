module ApplicationHelper
  def profile_img(user)

    return image_tag(user.avatar, alt: user.name) if user.avatar?
    
    unless user.image_url == nil
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name)
  end
end
