const express = require('express'),
    ConcRouter = express.Router(),
    dateFormat = require("dateformat"),
    bcrypt = require('bcrypt');
const { db_Insert, db_Select, db_Delete } = require('../modules/MasterModule');
const { sendUserEmail } = require('../modules/EmailModule');

const http = require('https'),
    fs = require('fs')

const saveAvatar = (data, img_path) => {
    return new Promise(async (resolve, reject) => {
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        var table_name = 'td_pc_avatar',
            fields = data.id > 0 ? `avt_name = '${data.avt_name}', img_path = '${img_path ? img_path : data.img_path}',
            modified_by = '${data.user}', modified_dt = '${datetime}'` :
                `(hotel_id, avt_name, img_path, created_by, created_dt)`,
            values = `('${data.hotel_id}', '${data.avt_name}', '${img_path ? img_path : data.img_path}', 
            '${data.user}', '${datetime}')`,
            whr = data.id > 0 ? `id = ${data.id}` : null,
            flag = data.id > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
}

ConcRouter.get('/pc_avatar', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_pc_avatar',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.get('/pc_voice', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_pc_voice',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id}${data.srv_res_id ? ` AND srv_res_id=0` : ''}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.post('/pc_voice', async (req, res) => {
    var data = req.body
    console.log(data);
    var url = data.voice_path
    if (url != '') {
        var urlList = url.split('/')
        var fileName = `audio/${urlList[urlList.length - 1]}`
        const file = fs.createWriteStream(`uploads/${fileName}`);

        http.get(url, (result) => {
            result.pipe(file)
            file.on('finish', async () => {
                file.close()
                console.log('Download Completed');
                let res_dt = await saveVoice(data, fileName)
                res.send(res_dt)
            })
        })
    } else {
        var res_dt = await saveVoice(data, null)
        res.send(res_dt)
    }
})

const saveVoice = async (data, voice_path) => {
    return new Promise(async (resolve, reject) => {
        if (data.id > 0) {
            var dt = await db_Insert(chk_table_name, chk_fields, chk_values, chk_whr, chk_flag)
        }
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        var table_name = 'td_pc_voice',
            fields = data.id > 0 ? `${voice_path ? 'sound_path ="' + voice_path + '"' : ''}${data.active_flag == 'V' ? ', sound_flag = "N"' : (data.active_flag == 'T' ? ', msg_active_flag = "N"' : '')},
            msg_text = '${data.msg_text}', voice_id = '${data.voice_id}', voice_speed = ${data.voice_speed}, use_premium = ${data.use_premium}, voice_path = '${data.voice_path}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
                `(hotel_id, srv_res_flag, srv_res_id${voice_path ? ', sound_path' : ''}, voice_id, voice_speed, use_premium, voice_path
                ${data.active_flag == 'V' ? 'sound_flag' : (data.active_flag == 'T' ? 'msg_active_flag' : '')}, msg_text, created_by, created_dt)`,
            values = `('${data.hotel_id}', '${data.srv_res_flag}', '${data.srv_res_id}'${voice_path ? ',"' + voice_path + '"' : ''}, 
            '${data.voice_id}', ${data.voice_speed}, ${data.use_premium}, '${data.voice_path}'${data.active_flag == 'T' || data.active_flag == 'V' ? ', N' : ''}, '${data.msg_text}', 
            '${data.user}', '${datetime}')`,
            whr = data.id > 0 ? `id = ${data.id}` : null,
            flag = data.id > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
}

ConcRouter.get('/emp_dtls', async (req, res) => {
    var data = req.query
    // console.log(data);
    var select = '*',
        table_name = 'md_employee',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id} ${data.manager_flag ? 'AND manager_flag = "' + data.manager_flag + '"' : ''} ${data.dept_id ? 'AND emp_dept_id = ' + data.dept_id : ''}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.post('/emp_dtls', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        table_name, fields, values, whr, flag, res_dt, res_dt_user;
    var v = "",
        v1 = "";
    // console.log(data.dept_list);
    for (let dt of data.dept_list) {
        if (dt.id > 0) {
            v = dt.id;
            if (v1 != "") {
                v1 = v + "," + v1;
            } else {
                v1 = v;
            }
        }
    }
    console.log(v1);
    table_name = 'md_employee'
    whr = `mobile_no = '${data.phone_no}' AND emp_dept_id NOT IN(${v1})`
    await db_Delete(table_name, whr)
    for (let dt of data.dept_list) {
        select = 'id'
        table_name = 'md_employee'
        whr = `mobile_no = '${data.phone_no}' AND emp_dept_id = '${dt.id}'`
        order = null
        let chk_dt = await db_Select(select, table_name, whr, order)

        table_name = 'md_employee'
        fields = chk_dt.suc > 0 && chk_dt.msg.length > 0 ? `emp_name = '${data.emp_name}', email_id = '${data.email}', manager_flag = '${data.manager_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, emp_name, emp_dept_id, mobile_no, email_id, manager_flag, created_by, created_dt)`
        values = `('${data.hotel_id}', '${data.emp_name}', '${dt.id}', '${data.phone_no}', 
        '${data.email}', '${data.manager_flag}', '${data.user}', '${datetime}')`
        whr = chk_dt.suc > 0 && chk_dt.msg.length > 0 ? `id = ${chk_dt.msg[0].id}` : null
        flag = chk_dt.suc > 0 && chk_dt.msg.length > 0 ? 1 : 0
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }

    select = 'id, mobile_no, user_name'
    table_name = 'td_guest_user'
    whr = `mobile_no = '${data.phone_no}'`
    order = null
    let chk_dt = await db_Select(select, table_name, whr, order)
    console.log(chk_dt);
    console.log('len', chk_dt.msg.length);
    if (chk_dt.suc > 0 && chk_dt.msg.length == 0) {
        var password = bcrypt.hashSync(data.password, 10);
        var table_name = 'td_guest_user',
            fields = '(hotel_id, user_name, user_type, mobile_no, email_id, password, group_leader_flag, dept_id, created_by, created_dt)',
            values = `('${data.hotel_id}', '${data.emp_name}', '${data.user_type}', '${data.phone_no}', '${data.email}', '${password}', 'Y', ${data.dept_id}, '${data.user}', '${datetime}')`,
            whr = null,
            flag = 0
        res_dt_user = await db_Insert(table_name, fields, values, whr, flag)
    }

    var emp_id = res_dt_user.suc > 0 ? res_dt_user.lastId.insertId : 0

    if (emp_id > 0) {
        if (data.msg_type.length > 0) {
            for (let msg of data.msg_type) {
                for (let day of data.day_dt) {
                    select = `count(id) cnt_id, id`
                    table_name = 'td_emp_schedule'
                    whr = `hotel_id = ${data.hotel_id} AND msg_type = '${msg.id}' AND emp_id = '${emp_id}' AND day_dt = '${day.code}'`
                    let dt = await db_Select(select, table_name, whr, null)
                    table_name = 'td_emp_schedule'
                    fields = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? `date_on_off = '${day.off_on ? 'Y' : 'N'}', start_time = '${day.start > 0 ? day.start : "00:00:00"}', end_time = '${day.end > 0 ? day.end : "00:00:00"}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
                        '(hotel_id, msg_type, emp_id, emp_code, day_dt, date_on_off, start_time, end_time, created_by, created_dt)'
                    values = `('${data.hotel_id}', '${msg.id}', '${emp_id}', '${data.phone_no}', '${day.code}', '${day.off_on ? 'Y' : 'N'}', '${day.start > 0 ? day.start : "00:00:00"}', '${day.end > 0 ? day.end : "00:00:00"}', '${data.user}', '${datetime}')`
                    whr = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? `id = ${dt.msg[0].id}` : null
                    flag = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? 1 : 0
                    res_dt = await db_Insert(table_name, fields, values, whr, flag)
                }
            }
        }
        table_name = 'td_guest_user_email'
        fields = data.id > 0 ? `email_body = '${data.email_body}', email_title = '${data.email_title}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, user_id, email_body, email_title, created_by, created_dt)`
        values = `('${data.hotel_id}', '${emp_id}', '${data.email_body}', '${data.email_title}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null
        flag = data.id > 0 ? 1 : 0
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }

    res.send(res_dt)
})

ConcRouter.get('/chk_emp_dept', async (req, res) => {
    var data = req.query
    var select = 'b.id, b.dept_name',
        table_name = 'md_employee a, md_department b',
        whr = `a.emp_dept_id=b.id AND a.hotel_id = ${data.hotel_id} AND a.mobile_no = '${data.mobile_no}'`,
        order = null;
    var chk_dt = await db_Select(select, table_name, whr, order)
    chk_dt = { suc: chk_dt.suc, msg: chk_dt.msg.length > 0 ? chk_dt.msg : 'Fresh User' }
    res.send(chk_dt)
})

// ConcRouter.post('/emp_dtls', async (req, res) => {
//     var data = req.body,
//         datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
//     var table_name = 'md_employee',
//         fields = data.id > 0 ? `emp_id = '${data.emp_id}', emp_name = '${data.emp_name}', emp_dept_id = '${data.dept_id}', 
//         mobile_no = '${data.phone_no}', email_id = '${data.email}', manager_flag = '${data.manager_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
//             `(hotel_id, emp_id, emp_name, emp_dept_id, mobile_no, email_id, manager_flag, created_by, created_dt)`,
//         values = `('${data.hotel_id}', '${data.emp_id}', '${data.emp_name}', '${data.dept_id}', '${data.phone_no}', 
//         '${data.email}', '${data.manager_flag}', '${data.user}', '${datetime}')`,
//         whr = data.id > 0 ? `id = ${data.id}` : null,
//         flag = data.id > 0 ? 1 : 0;
//     var res_dt = await db_Insert(table_name, fields, values, whr, flag)
//     res.send(res_dt)
// })

ConcRouter.get('/emp_dtls_last_id', async (req, res) => {
    var data = req.query
    var select = '(MAX(id) + 1) max_id',
        table_name = 'md_employee',
        whr = `hotel_id = ${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.post('/emp_dtls_del', async (req, res) => {
    var data = req.body
    var dt = {
        Monday: 1,
        Tuesday: 2,
        Wednesday: 3,
        Thursday: 4,
        Friday: 5,
        Saturday: 6,
        Sunday: 7,
    };
    var now_date = dateFormat(new Date(), "dddd"),
        currDate = dt[now_date];

    var select = 'COUNT(id) cnt_id',
        table_name = 'td_emp_schedule',
        whr = `emp_code = ${data.id} AND date_on_off = 'Y' AND day_dt >= '${currDate}'`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if (res_dt.suc > 0) {
        if (res_dt.msg[0].cnt_id > 0) {
            res_dt = { suc: 2, msg: 'Manager is already in roster' }
        } else {
            table_name = 'md_employee'
            whr = `id = ${data.id}`
            res_dt = await db_Delete(table_name, whr)
        }
        // res_dt = suc: res_dt.msg[0].cnt_id
    }
    res.send(res_dt)
})

ConcRouter.post('/dept_user_dtls', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), res_dt;
    // console.log(data);
    if (data.id == 0) {
        var table_name = 'td_guest_user',
            fields = '(hotel_id, user_name, user_type, mobile_no, email_id, group_leader_flag, dept_id, created_by, created_dt)',
            values = `('${data.hotel_id}', '${data.emp_name}', '${data.user_type}', '${data.phone_no}', '${data.email}', '${data.group_leader_flag}', ${data.dept_id}, '${data.user}', '${datetime}')`,
            whr = null,
            flag = 0
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }
    var emp_id = data.id > 0 ? data.id : (res_dt.suc > 0 ? res_dt.lastId.insertId : 0)
    if (emp_id > 0) {
        if (data.msg_type.length > 0) {
            for (let msg of data.msg_type) {
                for (let day of data.day_dt) {
                    select = `count(id) cnt_id, id`
                    table_name = 'td_emp_schedule'
                    whr = `hotel_id = ${data.hotel_id} AND msg_type = '${msg.id}' AND emp_id = '${emp_id}' AND day_dt = '${day.code}'`
                    let dt = await db_Select(select, table_name, whr, null)
                    table_name = 'td_emp_schedule'
                    fields = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? `date_on_off = '${day.off_on ? 'Y' : 'N'}', start_time = '${day.start > 0 ? day.start : "00:00:00"}', end_time = '${day.end > 0 ? day.end : "00:00:00"}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
                        '(hotel_id, msg_type, emp_id, emp_code, day_dt, date_on_off, start_time, end_time, created_by, created_dt)'
                    values = `('${data.hotel_id}', '${msg.id}', '${emp_id}', '${data.emp_id}', '${day.code}', '${day.off_on ? 'Y' : 'N'}', '${day.start > 0 ? day.start : "00:00:00"}', '${day.end > 0 ? day.end : "00:00:00"}', '${data.user}', '${datetime}')`
                    whr = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? `id = ${dt.msg[0].id}` : null
                    flag = dt.suc > 0 && dt.msg[0].cnt_id > 0 ? 1 : 0
                    res_dt = await db_Insert(table_name, fields, values, whr, flag)
                }
            }
        }
    }
    res.send(res_dt)
})

ConcRouter.get('/dept_user_dtls', async (req, res) => {
    var data = req.query
    var select = 'b.id, a.hotel_id, b.user_name, b.user_type, c.dept_name, b.dept_id, a.emp_code',
        table_name = 'td_emp_schedule a, td_guest_user b, md_department c',
        whr = `a.emp_id=b.id AND b.dept_id=c.id ${data.hotel_id > 0 ? 'AND a.hotel_id =' + data.hotel_id : ''} ${data.id > 0 ? 'AND b.id =' + data.id : ''}`,
        order = 'GROUP BY a.emp_id'
    var res_dt = await db_Select(select, table_name, whr, order)
    if (res_dt.suc > 0 && res_dt.msg.length > 0) {
        for (let dt of res_dt.msg) {
            select = 'DISTINCT msg_type'
            table_name = 'td_emp_schedule'
            whr = `hotel_id = ${data.hotel_id} AND emp_id = ${dt.id}`
            order = null
            let msg_list = await db_Select(select, table_name, whr, order)
            dt['msg_type'] = msg_list.suc > 0 && msg_list.msg.length > 0 ? msg_list.msg : null;
        }
        if (data.id > 0) {
            select = 'id, day_dt, date_on_off, start_time, end_time, approve_flag status'
            table_name = 'td_emp_schedule'
            whr = `${data.hotel_id > 0 ? 'hotel_id = ' + data.hotel_id + ' AND ' : ''} emp_id = ${data.id}`
            order = 'GROUP BY day_dt, emp_id order BY emp_id,day_dt'
            let day_list = await db_Select(select, table_name, whr, order)
            res_dt.msg[0]['day_dt'] = day_list.suc > 0 && day_list.msg.length > 0 ? day_list.msg : null;
        }
    }
    res.send(res_dt)
})



ConcRouter.post('/dept_user_send_email', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = 'td_guest_user_email',
        fields = data.id > 0 ? `email_body = '${data.email_title}', email_title = '${data.email_title}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, user_id, email_body, email_title, created_by, created_dt)`,
        values = `('${data.hotel_id}', '${data.user_id}', '${data.email_body}', '${data.email_title}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    if (res_dt.suc > 0) {
        var password = bcrypt.hashSync(data.password, 10);
        table_name = 'td_guest_user'
        fields = `password = '${password}', modified_by = '${data.user}', modified_dt = '${datetime}'`
        values = null
        whr = `id = ${data.user_id}`
        flag = 1;
        var res_dt_pass = await db_Insert(table_name, fields, values, whr, flag)
        if (res_dt_pass.suc > 0) {
            await sendUserEmail(data.email_id, data.email_body, data.email_title)
        }
    }
    res.send(res_dt)
})

ConcRouter.get('/chk_dept_dtls', async (req, res) => {
    var data = req.query
    var select = 'COUNT(id) chk_user, id, user_name, email_id',
        table_name = 'td_guest_user',
        whr = `mobile_no = '${data.phone_no}'`
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt);
})

ConcRouter.post('/dept_user_schedule_update', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name, fields, values, whr, flag, res_dt;
    for (let day of data.day_dt) {
        select = `count(id) cnt_id, id`
        table_name = 'td_emp_schedule'
        whr = `hotel_id = ${data.hotel_id} AND msg_type = '${data.msg_type}' AND emp_id = '${data.emp_id}' AND day_dt = '${day.code}'`
        let dt = await db_Select(select, table_name, whr, null)
        table_name = 'td_emp_schedule'
        fields = dt.msg[0].cnt_id > 0 ? `date_on_off = '${day.active_flag ? 'Y' : 'N'}', start_time = '${day.start > 0 ? day.start : "00:00:00"}', end_time = '${day.end > 0 ? day.end : "00:00:00"}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            '(hotel_id, msg_type, emp_id, emp_code, day_dt, date_on_off, start_time, end_time, created_by, created_dt)'
        values = `('${data.hotel_id}', '${data.msg_type}', '${data.emp_id}', '${data.emp_code}', '${day.code}', '${day.active_flag ? 'Y' : 'N'}', '${day.start > 0 ? day.start : "00:00:00"}', '${day.end > 0 ? day.end : "00:00:00"}', '${data.user}', '${datetime}')`
        whr = dt.msg[0].cnt_id > 0 ? `id = ${dt.msg[0].id}` : null
        flag = dt.msg[0].cnt_id > 0 ? 1 : 0
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }
    res.send(res_dt)
})

ConcRouter.post('/dept_schedule_update', async (req, res) => {
    var data = req.body,
      	datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
	var table_name = 'td_emp_schedule',
        fields = `approve_flag = "${data.status ? 'A' : 'U'}", modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = '${data.id}'`,
        flag = 1;
	var res_dt = await db_Insert(table_name, fields, values, whr, flag);
	res.send(res_dt)
})

// ConcRouter.post('/dept_send_email', async (req, res) => {
//     var data = req.body
//     var table_name = '',
//         fields,
//         values,
//         whr,
//         flag;
// })

ConcRouter.post('/send_user_email', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var select =
        "id, hotel_id, emp_id, emp_name, emp_dept_id, mobile_no, email_id",
      table_name = "md_employee",
      whr = `hotel_id = '${data.hotel_id}' AND emp_dept_id = '${data.dept_id}' AND manager_flag != 'Y'`,
      order = null;
    var res_dt = await db_Select(select, table_name, whr, order)

    if(res_dt.suc > 0 && res_dt.msg.length > 0){
        for(let dt of res_dt.msg){
            let password = await GenPassword();
            let email_body = data.body
            email_body = email_body.split("#user_name").join(dt.emp_name);
            email_body = email_body.split('#url').join('https://https://custom.shoplocal-lagunabeach.com/#/')
            email_body = email_body.split("#user_id").join(dt.mobile_no);
            email_body = email_body.split("#password").join(password);

            let pwd = bcrypt.hashSync(password, 10);
            var table_name = "td_guest_user",
              fields =
                "(hotel_id, user_name, user_type, mobile_no, email_id, group_leader_flag, dept_id, password, created_by, created_dt)",
              values = `('${dt.hotel_id}', '${dt.emp_name}', 'E', '${dt.mobile_no}', '${dt.email_id}', 'N', ${data.dept_id}, '${pwd}', '${data.user}', '${datetime}')`,
              whr = null,
              flag = 0;
              let user_dt = await db_Insert(table_name, fields, values, whr, flag)
              if (user_dt.suc > 0){
                var table_name = "td_guest_user_email",
                  fields = `(hotel_id, user_id, email_body, email_title, created_by, created_dt)`,
                  values = `('${dt.hotel_id}', '${user_dt.lastId.insertId}', '${email_body}', '${data.title}', '${data.user}', '${datetime}')`,
                  whr = null,
                  flag = 0;
                var res_dt = await db_Insert(table_name, fields, values, whr, flag);
              }
                
        }
    }
    res.send(res_dt)
})

const GenPassword = () => {
    return new Promise((resolve, reject) => {
var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
      'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
      'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  var a = alpha[Math.floor(Math.random() * 62)];
  var b = alpha[Math.floor(Math.random() * 62)];
  var c = alpha[Math.floor(Math.random() * 62)];
  var d = alpha[Math.floor(Math.random() * 62)];
  var e = alpha[Math.floor(Math.random() * 62)];
  var sum = a + b + c + d + e;
  resolve(sum)
    })
  
}

ConcRouter.post('/revoke_dept', async (req, res) => {
    var data = req.body,
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
	var table_name = "md_employee",
      fields = `active_flag = '${data.flag ? 'N' : 'Y'}', modified_by = '${data.user}', modified_dt = '${datetime}'`,
      values = null,
      whr = `id = '${data.id}'`,
      flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    table_name = "td_guest_user"
	fields = `active_flag = '${data.flag ? 'N' : 'Y'}', modified_by = '${data.user}', modified_dt = '${datetime}'`
	values = null
	whr = `mobile_no = '${data.mobile_no}'`
	flag = 1;
    res_dt = await db_Insert(table_name, fields, values, whr, flag);
    res.send(res_dt);
})

ConcRouter.post('/dept_login', async (req, res) => {
    var data = req.body,
        msg_dt;
	var dt = {
        Monday: 1,
        Tuesday: 2,
        Wednesday: 3,
        Thursday: 4,
        Friday: 5,
        Saturday: 6,
        Sunday: 7,
    };
    var now_date = dateFormat(new Date(), "dddd"),
        currDate = dt[now_date];
    var select = '*',
        table_name = 'td_guest_user',
        whr = `email_id = '${data.email_id}' AND active_flag = 'Y'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    if (res_dt.suc > 0 && res_dt.msg.length > 0) {
        if (await bcrypt.compare(data.password, res_dt.msg[0].password)) {
			if (res_dt.msg[0].user_type == 'E' && res_dt.msg[0].group_leader_flag == 'Y') {
                select = 'DISTINCT msg_type, emp_code'
                table_name = 'td_emp_schedule'
                whr = `emp_id = ${res_dt.msg[0].id}`
                order = null
                let sheduleDt = await db_Select(select, table_name, whr, order)
				select = "IF(COUNT(id) > 0, 'Y', 'N') active_flag";
                table_name = "td_emp_schedule";
                whr = `emp_id = ${res_dt.msg[0].id} AND day_dt = ${currDate} AND approve_flag = 'A' AND date_on_off = 'N'`;
                order = null;
                let activeDt = await db_Select(select, table_name, whr, order);
                msg_dt = { suc: 1, msg: 'Successfully Logged in', user_dt: res_dt.msg[0], user_schedule: sheduleDt.suc && sheduleDt.msg.length > 0 > 0 ? sheduleDt.msg[0] : null, active_flag: activeDt.suc > 0 ? activeDt.msg[0].active_flag : 'N' }
            } else {
                msg_dt = { suc: 1, msg: 'Successfully Logged in', user_dt: res_dt.msg[0] }
            }
            // msg_dt = { suc: 1, msg: 'Successfully Logged in', user_dt: res_dt.msg[0] }
			if (res_dt.msg[0].user_type != 'E') {
                select = 'b.*'
                table_name = 'td_guest_user a, td_lodgging b'
                whr = `a.id=b.guest_id AND a.id = ${res_dt.msg[0].id}`
                order = null
                var res_dtls = await db_Select(select, table_name, whr, order)
                if (res_dtls.suc > 0 && res_dtls.msg.length > 0) {
                    msg_dt['lodgging_dt'] = res_dtls.msg[0]
                } else {
                    msg_dt['lodgging_dt'] = null
                }
            }
        } else {
            msg_dt = { suc: 0, msg: 'Please Check Your userID or Password' }
        }
    } else {
        msg_dt = { suc: 0, msg: 'No user found or user has been revoked' }
    }
    res.send(msg_dt)
})



ConcRouter.post('/emp_user', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "md_employee",
        fields = data.id > 0 ? `emp_name = '${data.emp_name}', email_id = '${data.email}', manager_flag = '${data.manager_flag}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, emp_name, emp_dept_id, mobile_no, email_id, manager_flag, created_by, created_dt)`,
        values = `('${data.hotel_id}', '${data.emp_name}', '${data.dept_id}', '${data.phone_no}', 
        '${data.email}', '${data.manager_flag}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    res.send(res_dt)
})

ConcRouter.get('/emp_user', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_guest_user',
        whr = `hotel_id = '${data.hotel_id}' AND user_type = 'E' AND group_leader_flag = 'N'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.get('/emp_user_schedule', async (req, res) => {
    var data = req.query
    var select = 'a.*, b.mobile_no, b.active_flag',
        table_name = 'td_emp_schedule a, td_guest_user b',
        whr = `a.emp_id=b.id AND a.hotel_id = '${data.hotel_id}' AND a.emp_id = '${data.emp_id}' AND a.msg_type = 'E'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.get('/emp_sche_list', async (req, res) => {
    var data = req.query
    var dt = {
        Monday: 1,
        Tuesday: 2,
        Wednesday: 3,
        Thursday: 4,
        Friday: 5,
        Saturday: 6,
        Sunday: 7,
    };
    var now_date = dateFormat(new Date(), "dddd"),
        currDate = dt[now_date];
    
    var select = 'a.*',
        table_name = 'td_guest_user a, td_emp_schedule b',
        whr = `a.id=b.emp_id AND a.hotel_id = '${data.hotel_id}' AND a.user_type = 'E' AND a.group_leader_flag = 'N' AND a.active_flag = 'Y' AND b.day_dt = ${currDate} AND b.date_on_off = 'N' AND b.approve_flag = 'A'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

ConcRouter.get('/test_file_save', async (req, res) => {
    var url = 'https://customapi.shoplocal-lagunabeach.com/1_R_1_voice_mysong.mp3'
    var urlList = url.split('/')
    var fileName = urlList[urlList.length - 1]
    const file = fs.createWriteStream(fileName);

    const request = http.get(url, (result) => {
        result.pipe(file)
        file.on('finish', () => {
            file.close()
            console.log('Download Completed');
            res.send('Download Completed')
        })
    })
})

module.exports = { ConcRouter, saveAvatar, saveVoice }