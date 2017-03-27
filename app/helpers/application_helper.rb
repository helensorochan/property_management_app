module ApplicationHelper
  def javascript_controller_specific_tag
    file_name = "partials/#{params[:controller]}/#{params[:action]}"
    file_extension = "#{Rails.root}/app/assets/javascripts/#{file_name}.js"
    javascript_include_tag(file_name) if File.exists?(file_extension)
  end
end
