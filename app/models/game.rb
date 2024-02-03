class Game < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["active", "created_at", "description", "done", "hatarido", "hidden", "id", "link_epic", "link_hun", "link_other", "link_steam", "name", "okes", "slug", "stipi", "stipiusername", "updated_at", "uploaded_at", "user_id"]
      end
end
