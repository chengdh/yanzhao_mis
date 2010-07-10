class UploadVipFilesController < ApplicationController
  def new
  end
  def import
    #FIXME 添加事务处理
    org_ids = params[:org_ids]
    org_ids.each do |org_id|
      if !params["file_#{org_id}"].blank?
        #导入数据到VipFeeInfo
        FasterCSV.parse(params["file_#{org_id}"]).each_with_index do |row,index|
          if index > 0   #导出的表格带有表头,需要跳过
            vip_fees =  VipFeeInfo.org_id_is(org_id).mth_is(params[:mth]).name_is(row[2])
            if vip_fees.blank?
              vip_fee_info  = VipFeeInfo.create(:org_id => org_id,:mth => params[:mth],:name => row[2],:phone => row[3],:fee => row[5])
            elsif params[:del_if_exist]
              vip_fees.first.update_attributes(:phone => row[3],:fee => row[5])
            end
          end
        end
        #更新VIP客户状态
        VipInfo.update_state(org_id)
      end
    end
    render :text => "finish" 
  end
end
