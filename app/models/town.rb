class Town < Tokenable
  field :area, type: String
  field :name, type: String

  index({ name: 1 })
end
