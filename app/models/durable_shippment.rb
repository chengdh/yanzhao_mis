#耐用品出货
class DurableShippment < MaterialInout
  validate :check_storage
end
