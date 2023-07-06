const express = require('express'),
    AppApiRouter = express.Router(),
    dateFormat = require('dateformat');

const { SendEmailPreReg } = require('../modules/EmailModule');
const { db_Insert, db_Select } = require('../modules/MasterModule');

AppApiRouter.get('/chk_user_state', async (req, res) => {
    var data = req.query
    var select = 'COUNT(id) chk_user, phone_no, email_id, user_name', 
        table_name = 'td_guest_user', 
        whr = data.flag == 'P' ? `phone_no = '${data.value}'` : `email_id = '${data.value}'`, 
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res_dt = res_dt.suc > 0 ? (res_dt.msg[0].chk_user > 0 ? {suc:2, msg:'User already exist', dt: {phone_no: res_dt.msg[0].phone_no, email: res_dt.msg[0].email_id, name: res_dt.msg[0].user_name}} : {suc:1, msg:'Fresh user', dt: {phone_no: null, email: null, name: null}}) : res_dt
    res.send(res_dt)
})

AppApiRouter.post('/pre_reg', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var select = 'id', 
        table_name = 'td_guest_user', 
        whr = `phone_no = '${data.mobile_no}'`, 
        order = null;
    var chk_dt = await db_Select(select, table_name, whr, order)
    var id = chk_dt.suc > 0 && chk_dt.msg.length > 0 ? chk_dt.msg[0].id : 0

    if(id == 0){
        var table_name = 'td_guest_user', 
            fields = `(hotel_id, user_name, user_type ${data.user_type == 'G' ? ', group_emp_id' : ''}, mobile_no, email_id, created_by, created_dt)`, 
            values = `(${data.hotel_id}, '${data.user_name}', '${data.user_type}' ${data.user_type == 'G' ? ', ' + data.group_id : ''}, '${data.mobile_no}', '${data.email_id}', '${data.user}', '${datetime}')`, 
            whr = null, 
            flag = 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        var guest_id = res_dt.suc > 0 ? res_dt.lastId.insertId : 0
        if(guest_id > 0){
            if(data.user_type == 'G'){
                var select = 'a.id, a.group_name, c.check_in, c.check_out, c.room_no', 
                table_name = 'td_group a, td_guest_user b, td_lodgging c', 
                whr = `a.id=b.group_emp_id AND b.id=c.guest_id AND a.id = '${data.group_id}' AND b.user_type = 'G' AND b.group_leader_flag = 'Y'`, 
                order = null;
                var guest_dt = await db_Select(select, table_name, whr, order)
                
                var table_name = 'td_lodgging', 
                    fields = `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`, 
                    values = `(${data.hotel_id}, '${guest_id}', '${guest_dt.suc > 0 && guest_dt.msg.length > 0 ? dateFormat(guest_dt.msg[0].check_in, "yyyy-mm-dd HH:MM:ss") : datetime}', '${guest_dt.suc > 0 && guest_dt.msg.length > 0 ? dateFormat(guest_dt.msg[0].check_out, "yyyy-mm-dd HH:MM:ss") : datetime}', '${data.room_no ? data.room_no : 0}', 'A', '${data.user}', '${datetime}')`, 
                    whr = null, 
                    flag = 0;
                var res_dt = await db_Insert(table_name, fields, values, whr, flag)
                res.send(res_dt)
            }else{                
                var table_name = 'td_lodgging', 
                    fields = `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`, 
                    values = `(${data.hotel_id}, '${guest_id}', '${data.check_in}', '${data.check_out}', '${data.room_no ? data.room_no : 0}', 'A', '${data.user}', '${datetime}')`, 
                    whr = null, 
                    flag = 0;
                var res_dt = await db_Insert(table_name, fields, values, whr, flag)
                res.send(res_dt)
            }
        }else{
            res.send(res_dt)
        }
    }else{
        var table_name = 'td_lodgging', 
            fields = `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`, 
            values = `(${data.hotel_id}, '${id}', '${data.check_in}', '${data.check_out}', 0, 'A', '${data.user}', '${datetime}')`, 
            whr = null, 
            flag = 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        res.send(res_dt)
    }
})

AppApiRouter.post('/pre_reg_email', async (req, res) => {
    var data = req.body
    var res_dt = await SendEmailPreReg(data.email, data.user_name, data.reg_url)
    res.send(res_dt)
})

AppApiRouter.get("/check_app_user", async (req, res) => {
  var data = req.query,
    result;
  var select = "*",
    table_name = "td_guest_user",
    whr = `mobile_no = '${data.mobile_no}'`,
    order = null;
  var chk_dt = await db_Select(select, table_name, whr, order);

  if (chk_dt.suc > 0 && chk_dt.msg.length > 0) {
    if(chk_dt.msg[0].user_type != 'E'){
      var select = "*",
        table_name = "td_lodgging",
        whr = `hotel_id = ${data.hotel_id} AND guest_id = '${
          chk_dt.msg[0].id
        }' AND check_in <= '${dateFormat(
          new Date(),
          "yyyy-mm-dd HH:MM:ss"
        )}' AND check_out >= '${dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")}'`,
        order = null;
      var chk_act_dt = await db_Select(select, table_name, whr, order);
  
      if (chk_act_dt.suc > 0 && chk_act_dt.msg.length > 0) {
        chk_dt.msg[0]["check_in"] = chk_act_dt.msg[0].check_in;
        chk_dt.msg[0]["check_out"] = chk_act_dt.msg[0].check_out;
        chk_dt.msg[0]["room_no"] = chk_act_dt.msg[0].room_no;
      }
  
      result =
        chk_act_dt.suc > 0 && chk_act_dt.msg.length > 0
          ? { suc: 3, msg: "Active User", dt: chk_dt.msg[0] }
          : { suc: 2, msg: "User Exist", dt: chk_dt.msg[0] };
          res.send(result)
    }else{
      result = { suc: 3, msg: "Employee User", dt: chk_dt.msg[0] };
      res.send(result)
    }
  } else {
    if (chk_dt.suc > 0) result = { suc: 1, msg: "Fresh User" };
    else result = chk_dt
    res.send(result)
  }
});

AppApiRouter.get('/get_group_list', async (req, res) => {
    var data = req.query
    var select = 'a.id, a.group_name name', 
        table_name = 'td_group a', 
        whr = `hotel_id = ${data.hotel_id}`, 
        order = null;
    var guest_dt = await db_Select(select, table_name, whr, order)
    res.send(guest_dt)
})

AppApiRouter.get('/get_act_user_dtls', async (req, res) => {
  var data = req.query
  var select = "*",
    table_name = "td_guest_user",
    whr = data.mobile_no > 0 ? `mobile_no = '${data.mobile_no}'` : (data.id > 0 ? `id = ${data.id}` : ''),
    order = null;
  var chk_dt = await db_Select(select, table_name, whr, order);

  if(chk_dt.suc > 0 && chk_dt.msg.length > 0){
    if(chk_dt.msg[0].user_type != 'E'){
      var select = 'a.id, a.hotel_id, b.restaurant_name hotel_name, a.user_name, a.user_type, a.mobile_no, a.email_id, c.id lodg_id, c.check_in, c.check_out, c.room_no, a.group_emp_id, a.pref_lang', 
        table_name = 'td_guest_user a, td_contacts_custom b, td_lodgging c', 
        whr = `a.hotel_id=b.id AND a.id=c.guest_id AND a.mobile_no = '${data.mobile_no > 0 ? data.mobile_no : chk_dt.msg[0].mobile_no}' AND DATE(c.check_in) <= '${dateFormat(new Date(), "yyyy-mm-dd" )}' AND DATE(c.check_out) >= '${dateFormat(new Date(), "yyyy-mm-dd")}'`, 
        order = null;
      var res_dt = await db_Select(select, table_name, whr, order)
      if(res_dt.suc > 0 && res_dt.msg.length > 0){
        if(res_dt.msg[0].user_type == 'G'){
          var select = 'id gr_id, group_name, leader_name', 
            table_name = 'td_group', 
            whr = `id = '${res_dt.msg[0].group_emp_id}'`, 
            order = null;
          var gr_dt = await db_Select(select, table_name, whr, order)
          gr_dt.suc > 0 && gr_dt.msg.length > 0 ? res_dt.msg[0]['gr_dt'] = gr_dt.msg[0] : ''
          res.send(res_dt)
        }else{
          res.send(res_dt)
        }
      }else{
		var select = 'a.id, a.hotel_id, b.restaurant_name hotel_name, a.user_name, a.user_type, a.mobile_no, a.email_id, a.group_emp_id, a.pref_lang, "" lodg_id, "" check_in, "" check_out, "" room_no', 
			table_name = 'td_guest_user a, td_contacts_custom b', 
			whr = `a.hotel_id=b.id AND a.mobile_no = '${data.mobile_no > 0 ? data.mobile_no : chk_dt.msg[0].mobile_no}'`, 
			order = null;
      	var res_dt = await db_Select(select, table_name, whr, order)
        res.send(res_dt)
      }
    }else{
      var select = 'a.id, a.hotel_id, b.restaurant_name hotel_name, a.user_name, a.user_type, a.mobile_no, a.email_id, a.group_emp_id, c.dept_name, a.pref_lang', 
        table_name = 'td_guest_user a, td_contacts_custom b, md_department c', 
        whr = `a.hotel_id=b.id AND a.dept_id=c.id AND a.mobile_no = '${data.mobile_no > 0 ? data.mobile_no : chk_dt.msg[0].mobile_no}'`, 
        order = null;
      var res_dt = await db_Select(select, table_name, whr, order)
      res.send(res_dt)
    }
  }else{
    res.send(chk_dt)
  }
})

AppApiRouter.get('/user_prev_stay', async (req, res) => {
  var data = req.query
  var select = 'a.id, b.id lodg_id', 
    table_name = 'td_guest_user a, td_lodgging b', 
    whr = `a.id=b.guest_id AND mobile_no = '${data.mobile_no}' AND check_in <= date(now()) AND check_out >= date(now())`, 
    order = null;
  var guest_dt = await db_Select(select, table_name, whr, order)

  if(guest_dt.suc > 0 && guest_dt.msg.length > 0){
    var select = 'a.id, a.hotel_id, b.restaurant_name hotel_name, a.check_in, a.check_out, a.room_no', 
      table_name = 'td_lodgging a, td_contacts_custom b', 
      whr = `a.hotel_id=b.id AND a.guest_id = '${guest_dt.msg[0].id}' AND a.id != '${guest_dt.msg[0].lodg_id}'`, 
      order = null;
    var rest_dt = await db_Select(select, table_name, whr, order)
    res.send(rest_dt)
  }else{
    res.send({suc:guest_dt.suc > 0 ? 1 : 0, msg: guest_dt.suc > 0 ? 'No data found' : guest_dt.msg})
  }
})

AppApiRouter.post('/update_app_user', async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = 'td_guest_user', 
    fields = `mobile_no = '${data.mobile_no}'${data.email_id ? ', email_id = "' + data.email_id + '"' : ''}, pref_lang = '${data.pref_lang}', modified_by = '${data.user}', modified_dt = '${datetime}'`, 
    values = null, 
    whr = `id = '${data.id}'`, 
    flag = 1;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag)
  res.send(res_dt)
})

AppApiRouter.post('/update_app_room', async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = 'td_lodgging',
    fields = data.id > 0 ? `room_no = '${data.room_no}', modified_by = '${data.user}', modified_dt = '${datetime}'` : `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`,
    values = `(${data.hotel_id}, ${data.user_id}, '${data.check_in}', '${data.check_out}', '${data.room_no}', 'A', '${data.user}', '${datetime}')`, 
    whr = data.id > 0 ? `id = '${data.id}'` : null,
    flag = data.id > 0 ? 1 : 0;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag)
  res.send(res_dt)
})

module.exports = {AppApiRouter}