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
