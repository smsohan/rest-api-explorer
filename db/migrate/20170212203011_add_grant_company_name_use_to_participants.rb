class AddGrantCompanyNameUseToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :grant_company_name_use, :boolean, default: false
  end
end
