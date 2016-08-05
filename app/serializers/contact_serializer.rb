class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :works_at
  has_one :user
end
