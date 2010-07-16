// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var com = {};
com.yanzhao = {};
//选择用户
com.yanzhao.UserSelector = Class.create();
com.yanzhao.UserSelector.prototype = {
initialize : function(){},
             //传入orgs数组和容器元素
             //orgs 机构数组
             //el_wrapper 用户列表容器
             //el_select_display 已选择用户显示容器
             set_param : function(orgs,el_wrapper,el_select_disp){
               this.orgs = orgs;
               this.el_wrapper = el_wrapper; 
               this.el_select_disp = el_select_disp;
             },
             //选择/不选择某个org的全部人员
select_all : function(org,select){
               var css_selector = '#' +org + ' input[type=checkbox]';
               var users = $$(css_selector);
               users.each(function(user_el){
                   user_el.checked = select;
                   },this);
             },
             //选择给定的机构
select_org : function(org_id){
               this.orgs.each(function(the_org){$(the_org).hide();});
               $(org_id).show();
             },
             //显示第一个机构的人员信息
show_first_org : function(){
                   if(this.orgs.size() > 0)
                     $(this.orgs.first()).show();
                 },
                 //得到已选择的用户数组,返回{user_id,username}类型的数组
selected_users :function(){
                  var css_selector = '#' +this.el_wrapper + ' input[type=checkbox]';
                  var users = $$(css_selector);
                  var ret = $A();
                  users.each(function(el_user){
                      if(el_user.checked){
                      var the_user = {id : el_user.id,username : el_user.value};
                      ret.push(the_user); 
                      }
                      },this);
                  return ret;
                },
                //更新选择显示
update_select_display :function(users){
                         users.each(function(the_user){
                             //    disp +="<div class='radius-box float-left user_wrap'>"+the_user.user_name + "</div>"; 
                             var user_div = this.create_user_display(the_user); 
                             //判断用户是否已存在
                             if($('selected_' + the_user.id))
                             return;
                             $(this.el_select_disp).insert(user_div);
                             },this);
                       },
                       //创建界面上显示的用户信息
create_user_display : function(user_obj){
                        var user_div = new Element('div');
                        user_div.addClassName('radius-box float-left user_wrap');
                        user_div.id='selected_' + user_obj.id;
                        user_div.update(user_obj.username);
                        var hidden_user = new Element('input',{type : 'hidden',name : "select_user[]",value : user_obj.id});
                        user_div.insert(hidden_user);

                        var btn_delete = new Element('span');
                        btn_delete.addClassName('delete');
                        btn_delete.update('删');
                        btn_delete.observe('click',function(){user_div.remove();});
                        user_div.insert(btn_delete);
                        return user_div;

                      }

};

/*nested form helper*/
com.yanzhao.nestedFormHelper = {};
/*删除方法*/
com.yanzhao.nestedFormHelper.remove_fields = function(link){
  $(link).previous("input[type=hidden]").value = "1";  
  $(link).up().up(".fields").hide();   
  //重新计算合计
  material_selector.cal_sum();
}
/* 添加方法*/
com.yanzhao.nestedFormHelper.add_fields = function(link, association, content,content_wrap){
  var new_id = new Date().getTime();  
  var regexp = new RegExp("new_" + association, "g");  
  if(content_wrap.blank())
    $(link).up().insert({ bottom : content.replace(regexp, new_id)});  
  else
    $(content_wrap).insert({ bottom : content.replace(regexp, new_id)});  
};  
/*结算表的Form监听器,用于自动计算*/
com.yanzhao.settlement_form_observer  =  function(){
  var form = $('setttlement_form');
  //得到相关的费用
  var start_fee = parseFloat($F('settlement_start_fee'));
  var start_carrying_fee =  parseFloat($F('settlement_start_carrying_fee'));
  var start_net_income =  start_fee - start_carrying_fee;
  $('settlement_start_net_income').value = start_net_income;
  var start_radio =  parseFloat($F('settlement_start_radio'));
  var start_push_money = Math.round(start_net_income*start_radio/100);
  $('settlement_start_push_money').value = start_push_money;
  //计算返程费用
  var back_fee = parseFloat($F('settlement_back_fee'));
  var back_carrying_fee =  parseFloat($F('settlement_back_carrying_fee'));
  var back_net_income =  back_fee - back_carrying_fee;
  $('settlement_back_net_income').value = back_net_income;
  var back_radio =  parseFloat($F('settlement_back_radio'));
  var back_push_money = Math.round(back_net_income*back_radio/100);
  $('settlement_back_push_money').value = back_push_money;
  $('settlement_total_push_money').value = start_push_money + back_push_money;
  //计算应补合计
  var subsidies = $$("input[name*='subsidies']");
  var sum_subsidy = 0.0;
  subsidies.each(function(el){ 
      if(el.id.include('value'))
      sum_subsidy += parseFloat(el.value);
      });

  $('settlement_total_subsidy').value = sum_subsidy;
  //计算应扣合计
  var deductions = $$("input[name*='deductions']");
  var sum_deduction = 0;
  deductions.each(function(el){ 
      if(el.id.include('value'))
      sum_deduction += parseFloat(el.value);
      });

  $('settlement_total_deduction').value = sum_deduction;
  var act_push_money = start_push_money + back_push_money + sum_subsidy - sum_deduction;
  $('settlement_act_push_money').value = act_push_money;
};

/*选择物品的处理*/
com.yanzhao.MaterialSelector = Class.create();
com.yanzhao.MaterialSelector.prototype = {
initialize : function(){},
  //target_el 选择物品后用于更新物品信息的容器
  //结构如下: <tr><td><input class='material_name' /></td></tr>
set_target_el : function(target_el){
               this.target_el = target_el;
             },
             //设置当前可选择的物品数组
set_material_array : function(materials){
                       this.storage_materials = materials;
                     },
             //在界面中选择物品
select_material : function(material_id){
                    this.storage_materials.each(function(s_m){
                        if(s_m.material.id == material_id)
                          this.selected_material = s_m;
                        }
                        ,this);
                    return this.selected_material;
                  },
                  //确认选择,在物品选择窗口上按确定按钮
                  //error_span 未选择任何商品时显示错误信息
perform_select : function(err_span){
                   if(typeof(this.selected_material) == 'undefined' || !this.selected_material)
                     $(err_span).update('当前未选择任何物品.');
                   else
                   {
                     this.update_target_el();
                     this.storage_materials = null;
                     this.selected_material = null;
                     return true;
                   }
                   return  false;
                 },
                 //根据选择物品更新出入库单据上的明细列表
update_target_el : function() {
                     el_id = this.target_el.select('.material_id').first();
                     el_name = this.target_el.select('.material_name').first();
                     el_unit = this.target_el.select('.material_unit').first();
                     el_price = this.target_el.select('.material_price').first();
                     el_qty = this.target_el.select('.material_qty').first();
                     el_total = this.target_el.select('.material_total').first();
                     el_id.value = this.selected_material.material.id;
                     el_name.value = this.selected_material.material.name;
                     el_unit.value = this.selected_material.material.unit;
                     el_price.value = this.selected_material.avg_price;
                     //以下注册监听事件
                     el_price.observe('change',this.cal_line_amt.bindAsEventListener(this,el_price,el_qty,el_total));
                     el_qty.observe('change',this.cal_line_amt.bindAsEventListener(this,el_price,el_qty,el_total));

                     //先计算
                     this.cal_line_amt(null,el_price,el_qty,el_total);
                    
                   },
                   //计算每行合计
cal_line_amt : function(evt,el_price,el_qty,el_total) {
                 var line_amt = parseFloat(el_price.value) * parseFloat(el_qty.value);
                 el_total.value = line_amt;
                 this.cal_sum();

               },
               //计算合计
cal_sum : function() {

            var sum = 0;
            var line_totals = $('line_fields_wrap').select('.material_total');
            line_totals.each(function(line_amt){
                //判断是否是被删除的数据
                if(line_amt.up().up().style['display'] != 'none')
                sum += parseFloat(line_amt.value);
                }
                );
            $('sum_field').value = sum;
          }


};
