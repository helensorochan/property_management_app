class Attachment < ActiveRecord::Base

  ALLOWED_CONTENT_TYPES = %w(image/jpeg image/png)

  belongs_to :imageable, polymorphic: true

  has_attached_file :file,
                    path: :generate_path,
                    url: :generate_url,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    hash_secret: 'longSecretString'

  validates_attachment_content_type :file, content_type: ALLOWED_CONTENT_TYPES

  private

  def generate_path
    ":rails_root/public/attachment/#{imageable_type.downcase}/:style/:id.:hash.:extension"
  end

  def generate_url
    "/attachment/#{imageable_type.downcase}/:style/:id.:hash.:extension"
  end
end
