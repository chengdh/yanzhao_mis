#贵宾客户数据导入监听器
class VipFeeInfoObserver < ActiveRecord::Observer
  def after_save(record)
    observe_func(record)
  end
  private
  def observe_func(record)
    #以下创建或更新vip_info信息
    vips = VipInfo.org_id_is(record.org_id).name_is(record.name)
    if vips.blank?
      vip_info = VipInfo.create(:org_id => record.org_id,:name => record.name,:phone => record.phone,:cur_fee => record.fee,:last_import_mth => record.mth,:level => VipConfig::VIP_NORMAL)
    else
      vip_info = vips.first
      if vip_info.last_import_mth <= record.mth
        vip_info.update_attributes(:phone => record.phone,:cur_fee => record.fee,:last_import_mth => record.mth)
      end
    end
  end
end
