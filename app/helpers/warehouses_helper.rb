module WarehousesHelper
   #选择耐用品仓库
  def warehouses_for_select(type)
    Warehouse.all(:conditions => {:is_active => true,:warehouse_type => type },:order => "name ASC").collect { |warehouse| [warehouse.name, warehouse.id] }
  end
  def all_warehouses_for_select()
    Warehouse.all(:conditions => {:is_active => true },:order => "name ASC").collect { |warehouse| [warehouse.name, warehouse.id] }
  end
  def warehouse_types_for_select
    [["耐用品仓库","DurableWarehouse"],["易耗品仓库","ConsumerWarehouse"]]
  end


end
