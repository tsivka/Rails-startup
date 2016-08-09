class BusinessType < ActiveRecord::Base
  def translated_name
    I18n.t(name, :scope => 'businessType')
  end
end
