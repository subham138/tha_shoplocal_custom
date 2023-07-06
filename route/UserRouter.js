const express = require('express'),
    UserRouter = express.Router(),
    dateFormat = require("dateformat"),
    bcrypt = require('bcrypt');
const { db_Insert, db_Select, db_Delete } = require('../modules/MasterModule');

UserRouter.post('/group_leader', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        table_name, fields, values, whr, flag, res_dt;
	if (data.group_leader_flag == 'Y') {
		table_name = 'td_group'
		fields = data.id > 0 ? `group_name = '${data.group_name}', leader_name = '${data.user_name}', no_of_people = '${data.no_of_people}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
			`(hotel_id, group_name, leader_name, no_of_people, created_by, created_dt)`
		values = `(${data.hotel_id}, '${data.group_name}', '${data.user_name}', '${data.no_of_people}', '${data.user}', '${datetime}')`
		whr = data.id > 0 ? `id = ${data.id}` : null
		flag = data.id > 0 ? 1 : 0

		var grup_dt = await db_Insert(table_name, fields, values, whr, flag)
	}
    var group_id = data.id > 0 ? data.id : (grup_dt.suc > 0 ? grup_dt.lastId.insertId : 0)

    if (group_id > 0) {
        var select = `COUNT(*) cunt_user, id`,
            table_name = 'td_guest_user',
            whr = `mobile_no = '${data.mobile_no}'`,
            order = null;
        var chk_user = await db_Select(select, table_name, whr, order)

        var password = bcrypt.hashSync(data.password, 10);

        table_name = 'td_guest_user'
        fields = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? `user_name = '${data.user_name}', user_type = '${data.user_type}', mobile_no = '${data.phone_no}', email_id = '${data.email_id}', password = '${password}', group_emp_id = '${group_id}', group_leader_flag = '${data.leader_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, user_name, user_type, mobile_no, email_id, password, group_emp_id, group_leader_flag, email_title, email_body, created_by, created_dt)`
        values = `('${data.hotel_id}', '${data.user_name}', '${data.user_type}', '${data.mobile_no}', '${data.email_id}', '${password}', '${group_id}', '${data.leader_flag}', '${data.email_title}', '${data.email_body}', '${data.user}', '${datetime}')`
        whr = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? `id = ${chk_user.msg[0].id}` : null
        flag = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? 1 : 0
        
        res_dt = await db_Insert(table_name, fields, values, whr, flag)

        var user_id = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? chk_user.msg[0].id : (res_dt.suc > 0 ? res_dt.lastId.insertId : 0)

        var select = `COUNT(*) cunt_user, id`,
            table_name = 'td_lodgging',
            whr = `guest_id = '${user_id}'`,
            order = null;
        var chk_user_log = await db_Select(select, table_name, whr, order)

        if (data.check_in != '') {
            table_name = 'td_lodgging'
            fields = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? `check_in = '${data.check_in}', check_out = '${data.check_out}', room_no = '${data.room_no}', status_flag = '${data.status_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
                `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`
            values = `('${data.hotel_id}', '${user_id}', '${data.check_in}', '${data.check_out}', '${data.room_no}', '${data.status_flag}', '${data.user}', '${datetime}')`
            whr = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? `id = ${chk_user_log.msg[0].id}` : null
            flag = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? 1 : 0

            res_dt = await db_Insert(table_name, fields, values, whr, flag)
        }
        res.send(res_dt) 
    } else {
        res.send(grup_dt)
    }
})

UserRouter.get('/group_leader', async (req, res) => {
    var data = req.query
    var select = 'c.id, c.hotel_id, c.group_name, c.leader_name, c.no_of_people, a.user_name, a.user_type, a.mobile_no, a.email_id, a.group_leader_flag, a.email_title, a.email_body, b.check_in, b.check_out, b.room_no, b.status_flag',
        table_name = 'td_group c, td_guest_user a, td_lodgging b',
        whr = data.id > 0 ? `a.id = ${data.id}` : `c.id=a.group_emp_id AND a.id=b.guest_id AND a.hotel_id = ${data.hotel_id} AND a.user_type = 'G' AND b.check_in <= now() AND b.check_out >= now()`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

UserRouter.post('/group_user', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        table_name, fields, values, whr, flag, res_dt;

    var group_id = data.id > 0 ? data.id : 0

    if (group_id > 0) {
        var select = `COUNT(*) cunt_user, id`,
            table_name = 'td_guest_user',
            whr = `mobile_no = '${data.mobile_no}'`,
            order = null;
        var chk_user = await db_Select(select, table_name, whr, order)

        table_name = 'td_guest_user'
        fields = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? `user_name = '${data.user_name}', user_type = '${data.user_type}', mobile_no = '${data.mobile_no}', email_id = '${data.email_id}', group_emp_id = '${group_id}', group_leader_flag = '${data.leader_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, user_name, user_type, mobile_no, email_id, group_emp_id, group_leader_flag, created_by, created_dt)`
        values = `('${data.hotel_id}', '${data.user_name}', '${data.user_type}', '${data.mobile_no}', '${data.email_id}', '${group_id}', '${data.leader_flag}', '${data.user}', '${datetime}')`
        whr = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? `id = ${chk_user.msg[0].id}` : null
        flag = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? 1 : 0

        res_dt = await db_Insert(table_name, fields, values, whr, flag)

        var user_id = chk_user.suc > 0 && chk_user.msg[0].cunt_user > 0 ? chk_user.msg[0].id : (res_dt.suc > 0 ? res_dt.lastId.insertId : 0)

        var select = `COUNT(*) cunt_user, id`,
            table_name = 'td_lodgging',
            whr = `guest_id = '${user_id}'`,
            order = null;
        var chk_user_log = await db_Select(select, table_name, whr, order)

        if (data.check_in != '') {
            table_name = 'td_lodgging'
            fields = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? `check_in = '${data.check_in}', check_out = '${data.check_out}', room_no = '${data.room_no}', status_flag = '${data.status_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
                `(hotel_id, guest_id, check_in, check_out, room_no, status_flag, created_by, created_dt)`
            values = `('${data.hotel_id}', '${user_id}', '${data.check_in}', '${data.check_out}', '${data.room_no}', '${data.status_flag}', '${data.user}', '${datetime}')`
            whr = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? `id = ${chk_user_log.msg[0].id}` : null
            flag = chk_user_log.suc > 0 && chk_user_log.msg[0].cunt_user > 0 ? 1 : 0

            res_dt = await db_Insert(table_name, fields, values, whr, flag)
        }
        res.send(res_dt)
    } else {
        res.send({ suc: 0, msg: 'Group ID id not defined' })
    }
})

UserRouter.get('/guest_user_dt', async (req, res) => {
    var data = req.query
    var select = 'a.id, a.user_name, a.user_type, a.mobile_no, a.email_id, a.group_emp_id, a.group_leader_flag, a.email_title, a.email_body, b.check_in, b.check_out, b.room_no, b.status_flag',
        table_name = 'td_guest_user a, td_lodgging b',
        whr = data.id > 0 ? `a.id = ${data.id}` : `a.id=b.guest_id AND a.hotel_id = ${data.hotel_id} ${data.group_id > 0 ? 'AND a.group_emp_id =' + data.group_id : ''} AND a.user_type = 'G' AND b.check_in <= now() AND b.check_out >= now() ${data.flag ? 'AND a.group_leader_flag ="' +  data.flag + '"' : ''}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

UserRouter.post('/guest_user_del', async (req, res) => {
    var data = req.body
    var table_name = 'td_guest_user',
        whr = `id = ${data.id}`;
    var res_dt = await db_Delete(table_name, whr)
    res.send(res_dt)
})

UserRouter.get('/sugg_box', async (req, res) => {
    var data = req.query
    var select = 'a.*, b.user_name, b.user_type, b.mobile_no, b.email_id',
        table_name = 'td_suggestion_box a, td_guest_user b',
        whr = data.id > 0 ? `a.user_id=b.id AND id = ${data.id}` : `a.user_id=b.id AND a.hotel_id = ${data.hotel_id}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

UserRouter.post('/sugg_box', async (req, res) => {
    var data = req.body,
        currDate = dateFormat(new Date(), "yyyy-mm-dd"),
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = 'td_suggestion_box',
        fields = data.id > 0 ? `sugg = "${data.sugg}", modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, user_id, sugg_date, sugg, created_by, created_dt)`,
        values = `('${data.hotel_id}', '${data.user_id}', '${currDate}', "${data.sugg}", '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;

    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

UserRouter.post('/sugg_box_del', async (req, res) => {
    var data = req.body
    var table_name = 'td_suggestion_box',
        whr = `id = ${data.id}`;
    var res_dt = await db_Delete(table_name, whr)
    res.send(res_dt)
})

UserRouter.get('/chk_guest_user', async (req, res) => {
    var data = req.query
    var select = 'a.id, a.hotel_id, a.user_name, a.mobile_no, a.email_id, b.check_in, b.check_out, b.room_no',
        table_name = 'td_guest_user a, td_lodgging b',
        whr = `a.id=b.guest_id AND a.id = ${data.user_id} AND b.status_flag = 'A' AND b.check_in <= now() AND b.check_out >= now()`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res_dt['active_flag'] = res_dt.suc > 0 && res_dt.msg.length > 0 ? 1 : 0

    var select = 'count(id) count_id, pay_flag, no_of_pages, pay_flag, addition_flag',
        table_name = 'td_flipbook',
        whr = `guest_id = ${data.user_id}`,
        order = null
    var chk_user = await db_Select(select, table_name, whr, order)
    res_dt['flip_flag'] = chk_user.suc > 0 && chk_user.msg[0].count_id > 0 ? 1 : 0
	res_dt['addition_flag'] = chk_user.suc > 0 ? chk_user.msg[0].addition_flag : 'N'
    res.send(res_dt)
})

UserRouter.get('/get_user_list', async (req, res) => {
    var data = req.query
    var select = `a.id, a.hotel_id, b.restaurant_name, a.user_name, IF(a.user_type = 'V', 'VIP', IF(a.user_type = 'G', 'Group', 'Guest')) user_type, a.mobile_no, a.email_id, c.check_in, c.check_out, a.pref_lang, c.room_no`,
      table_name = "td_guest_user a, td_contacts_custom b, td_lodgging c",
      whr =
        data.hotel_id > 0
          ? `a.hotel_id = b.id AND a.id=c.guest_id AND a.user_type != 'E' AND ${data.flag == 'P' ? (data.frm_dt && data.to_dt ? 'DATE(c.check_in) >= DATE("'+ data.frm_dt + '") AND c.check_out <= DATE("'+ data.to_dt + '")' : 'c.check_in <= now() AND c.check_out <= now()') : (data.frm_dt && data.to_dt ? 'DATE(c.check_in) >= DATE("'+ data.frm_dt + '") AND c.check_out <= DATE("'+ data.to_dt + '")' : 'c.check_in <= now() AND c.check_out >= now()')} AND a.hotel_id = ${data.hotel_id}`
          : `a.hotel_id = b.id AND a.id=c.guest_id AND a.user_type != 'E' AND c.check_in <= now() AND c.check_out >= now()`,
      order = null;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt);
})

UserRouter.get('/get_emer_user_list', async (req, res) => {
    var data = req.query
    var select = `a.id, a.hotel_id, a.user_name, a.user_type, b.room_no, b.check_in, b.check_out`,
    table_name = `td_guest_user a, td_lodgging b`,
    whr = `a.id=b.guest_id AND a.hotel_id = ${data.hotel_id} ${data.flag != 'E' ? 'AND b.check_in <= DATE(now()) AND b.check_out >= DATE(now())' : ''}`,
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt)
})

module.exports = { UserRouter }