#监听org的创建,为每个新创建的org设置默认的vip config
class OrgObserver < ActiveRecord::Observer
  def after_save(org)
    configs = VipConfig.org_id_is(org)
    if configs.blank?
      VipConfig.levels.keys.each do |level|
        the_range = VipConfig.system_level_range(level)
        the_config = VipConfig.new(:org => org,:name => level,:fee_from => the_range.begin,:fee_to => the_range.end)
        the_config.save
      end
    end
  end
end
