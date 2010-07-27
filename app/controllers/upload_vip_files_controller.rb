class UploadVipFilesController < ApplicationController
  def new
  end
  def import
    #FIXME 添加事务处理
    org_ids = params[:org_ids]
    import_rows = 0
    begin
      org_ids.each do |org_id|
        if !params["file_#{org_id}"].blank?
          #导入数据到VipFeeInfo
          rows = FasterCSV.parse(params["file_#{org_id}"],:headers => true)
          is_utf8 = rows[0][2].utf8?
          rows.each do |row|
            #检测中文编码问题
            row = row.map {|v| v.gb2321_to_utf8} unless is_utf8
            import_rows += 1
            vip_fees =  VipFeeInfo.org_id_is(org_id).mth_is(params[:mth]).name_is(row[2])

            if vip_fees.blank?
              vip_fee_info  = VipFeeInfo.create(:org_id => org_id,:mth => params[:mth],:name => row[2],:phone => row[3],:fee => row[5])
            elsif params[:del_if_exist]
              vip_fees.first.update_attributes(:phone => row[3],:fee => row[5])
            end
          end
          #更新VIP客户状态
          VipInfo.update_state(org_id)
        end
      end
      flash[:notice] = "共导入了#{import_rows}条VIP客户信息."
      redirect_to vip_fee_infos_url("search[mth]" => params[:mth])
    rescue
      flash[:error] = "导入出现错误,请检查导入文件格式是否正确."
      redirect_to :back
    end
  end
end
