# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = "")
    base_title = t ".title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def avatar_member(member)
    if member.avatar.attached?
      image_tag member.avatar, class: "avatar-default-member", id: "img_member_prev"
    else
      image_tag "defaultavatar.jpeg", class: "avatar-default-member", id: "img_member_prev"
    end
  end

  def avatar_admin(admin)
    if admin.avatar.attached?
      image_tag admin.avatar, class: "avatar-default", id: "img_prev"
    else
      image_tag "defaultavatar.jpeg", class: "avatar-default", id: "img_prev"
    end
  end

  def format_time(time)
    time.strftime("%m/%d/%Y")
  end

  def load_limit_image(object)
    return object.room_images.limit(1)[0].image.url if object.room_images.present?

    "location_2.png"
  end
end
