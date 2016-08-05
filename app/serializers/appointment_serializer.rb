class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :what, :where, :when
  has_one :user
end
