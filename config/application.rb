# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookingHomestays
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    ActionView::Base.field_error_proc = proc { |html_tag, instance|
      html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe

      form_fields = %w[textarea input select]

      elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(", ")

      elements.each do |e|
        next unless form_fields.include?(e.node_name)

        errors = [instance.error_message].flatten
                                         .uniq
                                         .collect do |error|
          "#{e.attributes['name']
                                .value.scan(/\[(.*?)\]/)
                                .flatten[0]
                                .humanize} #{error}"
        end
        html = %(<div class="field_with_errors">#{html_tag}</div>
          <small class="form-text error-text">&nbsp;#{errors.join(', ')}</small>).html_safe
      end

      html
    }
  end
end
