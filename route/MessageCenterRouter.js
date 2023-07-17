const db = require("../core/db");
const { db_Insert, db_Select } = require("../modules/MasterModule");
const { Check_Data } = require("../modules/MenuSetupModule");
const { MultipleUser, singleUser } = require("./PushNotificationRouter");

const express = require("express"),
  MessageCenterRouter = express.Router(),
  dateFormat = require("dateformat");

MessageCenterRouter.get("/message_center", async (req, res) => {
  var data = req.query;
  var select = "*",
    table_name = "td_notification",
    whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id} ${data.flag ? 'AND message_center_type = "' + data.flag + '"' : ''}`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  if (data.id > 0) {
    if (res_dt.msg[0].message_center_type == 'V' && res_dt.msg[0].audience == 4) {
      select = "a.id noti_id, a.guest_user_id id, b.user_name"
      table_name = "td_notification_audience a, td_guest_user b"
      whr = `a.guest_user_id=b.id`
      order = null;
      let user_dt = await db_Select(select, table_name, whr, order)
      res_dt.msg[0]['audience_dt'] = user_dt.suc > 0 ? user_dt.msg : []
    }
  }
  res.send(res_dt);
});

MessageCenterRouter.get("/dir_msg_center", async (req, res) => {
  var data = req.query;
  var select, table_name, whr, order, res_dt, result = {}, res_dtls, len_cnt = 0;

  select = "DISTINCT DATE(send_at) send_at"
  table_name = "td_notification_dtls"
  whr = `hotel_id = ${data.hotel_id}`
  order = 'ORDER BY send_at DESC'
  res_dt = await db_Select(select, table_name, whr, order);
  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let dt of res_dt.msg) {
      select = "b.*, date(a.send_at) send_dt, time(a.send_at) send_time"
      table_name = "td_notification_dtls a, td_notification b"
      whr = `a.msg_id=b.id AND date(a.send_at) = '${dateFormat(dt.send_at, "yyyy-mm-dd")}' AND b.hotel_id = ${data.hotel_id} ${data.flag ? 'AND b.message_center_type = "' + data.flag + '"' : ''}`
      order = null
      res_dt = await db_Select(select, table_name, whr, order);
      len_cnt = len_cnt + (res_dt.suc > 0 ? res_dt.msg.length : 0)
      if (res_dt.suc > 0 && res_dt.msg.length > 0) {
        result[dateFormat(dt.send_at, "yyyy-mm-dd")] = res_dt.suc > 0 ? res_dt.msg : null
      }

    }
  }
  // console.log(Object.keys(result).length, len_cnt);
  res_dtls = { suc: Object.keys(result).length > 0 ? 1 : 0, msg: result, tot_msg: len_cnt }
  res.send(res_dtls);
});

// MessageCenterRouter.post('/message_center', async (req, res) => {
//     var data = req.body,
//         datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
//     var table_name = 'td_notification',
//         fields = data.id > 0 ? `audience = '${data.audience}', language = '${data.language}',
//         img_name = '${data.img_name}', img_path = '${data.img_path}', msg_title = '${data.msg_title}',
//         msg_subtitle = '${data.msg_subtitle}', msg_body = '${data.msg_body}', dept_link = '${data.dept_link}',
//         time_period_msg = '${data.time_period_msg ? 'Y' : 'N'}', msg_snt_frm_time = '${data.msg_snt_frm_time}',
//         msg_snt_to_time = '${data.msg_snt_to_time}', msg_snt_type = '${data.msg_snt_type}', msg_snt_dt = '${data.msg_snt_dt}',
//         msg_snt_day = '${data.msg_snt_day}', msg_snt_time = '${data.msg_snt_time}', msg_lifetime = '${data.msg_lifetime}',
//         modified_by = '${data.user}', modified_dt = '${datetime}'` :
//             `(hotel_id, message_center_type, audience, language, img_name, img_path, msg_title, msg_subtitle,
//                 msg_body, dept_link, time_period_msg, msg_snt_frm_time, msg_snt_to_time, msg_snt_type, msg_snt_dt,
//                 msg_snt_day, msg_snt_time, msg_lifetime, created_by, created_dt)`,
//         values = `('${data.hotel_id}', '${data.message_center_type}', '${data.audience}', '${data.language}',
//         '${data.img_name}', '${data.img_path}', '${data.msg_title}', '${data.msg_subtitle}', '${data.msg_body}',
//         '${data.dept_link}', '${data.time_period_msg ? 'Y' : 'N'}', '${data.msg_snt_frm_time}', '${data.msg_snt_to_time}',
//         '${data.msg_snt_type}', '${data.msg_snt_dt}', '${data.msg_snt_day}', '${data.msg_snt_time}',
//         '${data.msg_lifetime}', '${data.user}', '${datetime}')`,
//         whr = data.id > 0 ? `id = ${data.id}` : null,
//         flag = data.id > 0 ? 1 : 0;
//     var res_dt = await db_Insert(table_name, fields, values, whr, flag)
//     res.send(res_dt)
// })

const save_message = (data, img_path) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_notification",
      fields =
        data.id > 0
          ? `audience = '${data.audience}', language = '${data.language}', 
        img_path = '${img_path ? img_path : data.img_path}', msg_title = '${data.msg_title}', 
        msg_subtitle = '${data.msg_subtitle}', msg_body = '${data.msg_body}', dept_bitly = '${data.dept_bitly}', dept_link = '${data.dept_link}', 
        time_period_msg = '${data.time_period_msg}', msg_snt_frm_time = '${data.msg_snt_frm_time ? data.msg_snt_frm_time : "00:00:00"}', 
        msg_snt_to_time = '${data.msg_snt_to_time ? data.msg_snt_to_time : "00:00:00"}', msg_snt_type = ${data.msg_snt_type ? '"' + data.msg_snt_type + '"' : null}, msg_snt_dt = ${data.msg_snt_dt ? '"' + data.msg_snt_dt + '"' : null}, 
        msg_snt_day = '${data.msg_snt_day}', msg_snt_time = '${data.msg_snt_time ? data.msg_snt_time : "00:00:00"}', msg_lifetime = ${data.msg_lifetime ? '"' + data.msg_lifetime + '"' : null}, 
        modified_by = '${data.user}', modified_dt = '${datetime}'`
          : `(hotel_id, message_center_type, audience, language, img_path, msg_title, msg_subtitle, 
                msg_body, dept_bitly, dept_link, time_period_msg, msg_snt_frm_time, msg_snt_to_time, msg_snt_type, msg_snt_dt,
                msg_snt_day, msg_snt_time, msg_lifetime, created_by, created_dt)`,
      values = `('${data.hotel_id}', '${data.message_center_type}', '${data.audience}', '${data.language}', 
        '${img_path ? img_path : data.img_path}', '${data.msg_title}', '${data.msg_subtitle}', '${data.msg_body}', 
        '${data.dept_bitly}', '${data.dept_link}', '${data.time_period_msg}', '${data.msg_snt_frm_time ? data.msg_snt_frm_time : "00:00:00"}', '${data.msg_snt_to_time ? data.msg_snt_to_time : "00:00:00"}', 
        ${data.msg_snt_type ? '"' + data.msg_snt_type + '"' : null}, ${data.msg_snt_dt ? '"' + data.msg_snt_dt + '"' : null}, '${data.msg_snt_day}', '${data.msg_snt_time ? data.msg_snt_time : "00:00:00"}', 
        ${data.msg_lifetime ? '"' + data.msg_lifetime + '"' : null}, '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    var notificationID;
    if (((data.message_center_type == 'V' && data.audience == 4) || data.audience == '1S') && data.user_dt.length > 0) {
		notificationID = data.id > 0 ? data.id : res_dt.lastId.insertId;
      let i = 0, x = '';
      for (let dt of JSON.parse(data.user_dt)) {
        if (i == 0) {
          x = dt.id
        } else {
          x = x + ', ' + dt.id
        }
        i++;
      }
      var sql = `DELETE FROM td_notification_audience WHERE notification_id = "${notificationID}" AND guest_user_id NOT IN(${x})`;
      db.query(sql, (err, lastId) => {
        if (err) {
          console.log(err);
        } else {
          console.log("Deleted Date-Time");
        }
      });
      for (let dt of JSON.parse(data.user_dt)) {
        var chk_dt = await Check_Data(
          (db_name = "td_notification_audience"),
          (whr = `WHERE hotel_id = "${data.hotel_id}" AND notification_id = "${notificationID}" AND guest_user_id = '${dt.id}'`)
        );
        console.log(chk_dt);
        if (chk_dt == 0) {
          let table_name = "td_notification_audience",
            fields = `(notification_id, guest_user_id, created_by, created_dt)`,
            values = `('${notificationID}', '${dt.id}', '${data.user}', '${datetime}')`,
            whr = null,
            flag = 0;
          res_dt = await db_Insert(table_name, fields, values, whr, flag)
        }
      }
      resolve(res_dt);
    } else if (data.message_center_type == 'G') {
		notificationID = data.id > 0 ? data.id : res_dt.lastId.insertId;
      var chk_dt = await Check_Data(
        (db_name = "td_notification_audience"),
        (whr = `WHERE hotel_id = "${data.hotel_id}" AND notification_id = "${notificationID}" AND guest_user_id = '${JSON.parse(data.user_dt)}'`)
      );
      if (chk_dt == 0) {
        let table_name = "td_notification_audience",
          fields = `(notification_id, guest_user_id, created_by, created_dt)`,
          values = `('${notificationID}', '${JSON.parse(data.user_dt)}', '${data.user}', '${datetime}')`,
          whr = null,
          flag = 0;
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
      }
      resolve(res_dt)
    } else {
      resolve(res_dt)
    }
  });
};

const postMessage = (hotel_id, msg_id, user, io) => {
  var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  return new Promise(async (resolve, reject) => {
    var table_name = "td_notification_dtls",
      fields = `(hotel_id, msg_id, send_by, send_at)`,
      values = `('${hotel_id}', '${msg_id}', '${user}', '${datetime}')`,
      whr = null,
      flag = 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
	  
	var select = '*', 
      table_name = `td_notification a`, 
      whr = `a.id = ${msg_id}`,
      order = null;
    var msg_dt = await db_Select(select, table_name, whr, order)
    // console.log(msg_dt);
    if(msg_dt.suc > 0 && msg_dt.msg.length > 0){
      // console.log(msg_dt.msg[0].message_center_type);
      switch (msg_dt.msg[0].message_center_type) {
        case 'H':
          await sendHotelMessage(msg_id)
          break;
        case 'E':
          await sendEmergencyMessage(msg_id)
          break;
        case 'V':
          await sendVipMessage(msg_id)
          break;
        case 'G':
          await sendGroupMessage(msg_id)
          break;
        case 'M':
          await sendEmployeeMessage(msg_id)
          break;     
        default:
          break;
      }
    }

    var notificationID = res_dt.lastId.insertId;

    select = "message_center_type msg_type"
    table_name = "td_notification_dtls a, td_notification b"
    whr = `a.msg_id=b.id AND a.id = ${notificationID}`
    order = null
    var res_dt_msg_type = await db_Select(select, table_name, whr, order);

    select = "COUNT(a.id) tot_msg, b.message_center_type msg_type"
    table_name = "td_notification_dtls a, td_notification b"
    whr = `a.msg_id=b.id AND b.hotel_id = ${hotel_id} AND b.message_center_type = '${res_dt_msg_type.suc > 0 ? res_dt_msg_type.msg[0].msg_type : ""}'`
    order = null
    var res_dt_msg = await db_Select(select, table_name, whr, order);
    io.emit('hotel_msg', res_dt_msg)
    resolve(res_dt);
  });
};

MessageCenterRouter.post("/post_message", async (req, res) => {
  var data = req.body;
  var res_dt = await postMessage(data.hotel_id, data.msg_id, data.user, req.io);
  // req.io.emit('hotel_msg', res_dt.msgDtls)
  res.send(res_dt);
});

// ONCE MESSAGE
setInterval(async () => {
  var now_time = dateFormat(new Date(), "HH:MM:ss");
  var select =
    "id, hotel_id, audience, img_path, msg_title, msg_subtitle, msg_body, dept_link, time_period_msg, message_center_type, extended_flag, msg_snt_frm_time, msg_snt_to_time",
    table_name = "td_notification",
    //   whr = `msg_snt_type = 'O' AND msg_snt_frm_time <= TIME(NOW()) AND msg_snt_to_time >= TIME(NOW()) AND msg_snt_dt = DATE(NOW()) AND DATE_FORMAT(msg_snt_time, '%H:%i') = DATE_FORMAT(NOW(), '%H:%i')`,
    whr = `msg_snt_type = 'O' AND msg_snt_dt = DATE(NOW()) AND DATE_FORMAT(msg_snt_time, '%H:%i') = DATE_FORMAT(NOW(), '%H:%i')`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let dt of res_dt.msg) {
      switch (dt.message_center_type) {
        case 'H':
          await sendHotelMessage(dt.id)
          break;
        case 'E':
          await sendEmergencyMessage(dt.id)
          break;
        case 'V':
          await sendVipMessage(dt.id)
          break;
        case 'G':
          await sendGroupMessage(dt.id)
          break;
        case 'M':
          await sendEmployeeMessage(dt.id)
          break;     
        default:
          break;
      }
      // if (dt.message_center_type == "E" && dt.extended_flag == "Y") {
      //   console.log("Message Send FROM ONCE TYPE extended");
      // } else {
      //   if (dt.msg_snt_frm_time <= now_time && dt.msg_snt_to_time >= now_time) {
      //     console.log("Message Send FROM ONCE TYPE Not extended");
      //   }
      // }
    }
  }
}, 100000);

// DAILY MESSAGE
setInterval(async () => {
  var now_time = dateFormat(new Date(), "HH:MM:ss");
  var select =
    "id, hotel_id, audience, img_path, msg_title, msg_subtitle, msg_body, dept_link, time_period_msg, message_center_type, extended_flag, msg_snt_frm_time, msg_snt_to_time",
    table_name = "td_notification",
    //   whr = `msg_snt_type = 'D' AND msg_snt_frm_time <= TIME(NOW()) AND msg_snt_to_time >= TIME(NOW())`,
    whr = `msg_snt_type = 'D'`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let dt of res_dt.msg) {
      switch (dt.message_center_type) {
        case 'H':
          await sendHotelMessage(dt.id)
          break;
        case 'E':
          await sendEmergencyMessage(dt.id)
          break;
        case 'V':
          await sendVipMessage(dt.id)
          break;
        case 'G':
          await sendGroupMessage(dt.id)
          break;
        case 'M':
          await sendEmployeeMessage(dt.id)
          break;     
        default:
          break;
      }
      // if (dt.message_center_type == "E" && dt.extended_flag == "Y") {
      //   console.log("Message Send FROM DAILY TYPE extended");
      // } else {
      //   if (dt.msg_snt_frm_time <= now_time && dt.msg_snt_to_time >= now_time) {
      //     console.log("Message Send FROM DAILY TYPE Not extended");
      //   }
      // }
    }
  }
}, 100000);

// WEEKLY MESSAGE
setInterval(async () => {
  var now_time = dateFormat(new Date(), "HH:MM:ss");
  var select =
    "id, hotel_id, audience, img_path, msg_title, msg_subtitle, msg_body, dept_link, time_period_msg, message_center_type, extended_flag, msg_snt_frm_time, msg_snt_to_time",
    table_name = "td_notification",
    //   whr = `msg_snt_type = 'W' AND msg_snt_frm_time <= TIME(NOW()) AND msg_snt_to_time >= TIME(NOW())`,
    whr = `msg_snt_type = 'W' AND msg_snt_day = date_format(now(), '%W')`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let dt of res_dt.msg) {
      switch (dt.message_center_type) {
        case 'H':
          await sendHotelMessage(dt.id)
          break;
        case 'E':
          await sendEmergencyMessage(dt.id)
          break;
        case 'V':
          await sendVipMessage(dt.id)
          break;
        case 'G':
          await sendGroupMessage(dt.id)
          break;
        case 'M':
          await sendEmployeeMessage(dt.id)
          break;     
        default:
          break;
      }
      // if (dt.message_center_type == "E" && dt.extended_flag == "Y") {
      //   console.log("Message Send FROM DAILY TYPE extended");
      // } else {
      //   if (dt.msg_snt_frm_time <= now_time && dt.msg_snt_to_time >= now_time) {
      //     console.log("Message Send FROM DAILY TYPE Not extended");
      //   }
      // }
    }
  }
}, 100000);

// MONTHLY MESSAGE
setInterval(async () => {
  var now_time = dateFormat(new Date(), "HH:MM:ss");
  var select =
    "id, hotel_id, audience, img_path, msg_title, msg_subtitle, msg_body, dept_link, time_period_msg, message_center_type, extended_flag, msg_snt_frm_time, msg_snt_to_time",
    table_name = "td_notification",
    whr = `msg_snt_type = 'M' AND date_format(msg_snt_dt, '%d%m') = date_format(now(), '%d%m') AND DATE_FORMAT(msg_snt_time, '%H:%i') = DATE_FORMAT(NOW(), '%H:%i')`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let dt of res_dt.msg) {
      switch (dt.message_center_type) {
        case 'H':
          await sendHotelMessage(dt.id)
          break;
        case 'E':
          await sendEmergencyMessage(dt.id)
          break;
        case 'V':
          await sendVipMessage(dt.id)
          break;
        case 'G':
          await sendGroupMessage(dt.id)
          break;
        case 'M':
          await sendEmployeeMessage(dt.id)
          break;     
        default:
          break;
      }
      // if (dt.message_center_type == "E" && dt.extended_flag == "Y") {
      //   console.log("Message Send FROM DAILY TYPE extended");
      // } else {
      //   if (dt.msg_snt_frm_time <= now_time && dt.msg_snt_to_time >= now_time) {
      //     console.log("Message Send FROM MONTHLY TYPE Not extended");
      //   }
      // }
    }
  }
}, 100000);

// MessageCenterRouter.get('/onceDaily', async (req, res) => {
//     var select = '*',
//         table_name = 'td_notification',
//         whr = `msg_snt_type = 'D' AND msg_snt_frm_time <= TIME(NOW()) AND msg_snt_to_time >= TIME(NOW())`,
//         order = null;
//     var res_dt = await db_Select(select, table_name, whr, order)
//     res.send(res_dt)
// })

MessageCenterRouter.get("/emergency_repo_dtls", async (req, res) => {
  var data = req.query;
  // console.log(data.from);
  var select =
      "a.*, '' group_name, c.user_name, c.mobile_no, c.email_id, d.room_no, d.check_in, d.check_out",
    table_name =
      "td_emergency_rec_report a, td_guest_user c, td_lodgging d",
    whr =
      data.id > 0
        ? `a.guest_group_id=c.id AND c.id=d.guest_id AND a.id = ${data.id}`
        : data.from != "" && data.from
        ? `a.guest_group_id=c.id AND c.id=d.guest_id AND a.record_date >= '${data.from}' AND a.record_date <= '${data.to}' AND a.hotel_id = '${data.hotel_id}'`
        : `a.guest_group_id=c.id AND c.id=d.guest_id AND a.hotel_id = '${data.hotel_id}'`,
    order = "GROUP BY a.id ORDER BY a.record_date DESC";
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

MessageCenterRouter.get("/emergency_repo", async (req, res) => {
  var data = req.query;
  // console.log(data.from);
  var select = "*",
    table_name = "td_emergency_rec_report",
    whr =
      data.id > 0
        ? `id = ${data.id}`
        : data.from != "" && data.from
          ? `record_date >= '${data.from}' AND record_date <= '${data.to}'`
          : "",
    order = "ORDER BY record_date DESC";
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

MessageCenterRouter.post("/emergency_repo", async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = "td_emergency_rec_report",
    fields =
      data.id > 0
        ? `guest_group_id = '${data.guest_group_id}', message_body = '${data.message_body}',
        repo_status = '${data.repo_status}', action_taken = '${data.action_taken}', 
        modified_by = '${data.user}', modified_dt = '${datetime}'`
        : `(hotel_id, record_date, guest_group_id, message_body, repo_status, action_taken, created_by, created_dt)`,
    values = `('${data.hotel_id}', '${data.record_date}', '${data.guest_group_id}', '${data.message_body}',
        '${data.repo_status}', '${data.action_taken}', '${data.user}', '${datetime}')`,
    whr = data.id > 0 ? `id = ${data.id}` : null,
    flag = data.id > 0 ? 1 : 0;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag);
  res.send(res_dt);
});

MessageCenterRouter.post("/add_vip", async (req, res) => {
  var data = req.body,
    table_name,
    fields,
    values,
    whr,
    flag,
    res_dt,
    _res_dt,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  // var res_dt = await db_Insert(table_name, fields, values, whr, flag)
  for (let dt of data.user_dt) {
    table_name = "td_guest_user";
    fields =
      dt.id > 0
        ? `user_name = '${dt.name}', modified_by='${data.user}', modified_dt='${datetime}'`
        : `(hotel_id, user_name, user_type, created_by, created_dt)`;
    values = `(${data.hotel_id}, '${dt.name}', '${data.user_type}', '${data.user}', '${datetime}')`;
    whr = dt.id > 0 ? `id=${dt.id}` : null;
    flag = dt.id > 0 ? 1 : 0;
    res_dt = await db_Insert(table_name, fields, values, whr, flag);
    let insert_id = dt.id > 0 ? dt.id : res_dt.lastId.insertId;
    table_name = "td_lodgging";
    fields =
      dt.id > 0
        ? `check_in = '${dt.check_in}', check_out = '${dt.check_out}', modified_by='${data.user}', modified_dt='${datetime}'`
        : `(hotel_id, guest_id, check_in, check_out, room_no, created_by, created_dt)`;
    values = `(${data.hotel_id}, ${insert_id}, '${dt.check_in}', '${dt.check_out}', '0', '${data.user}', '${datetime}')`;
    flag = dt.id > 0 ? 1 : 0;
    _res_dt = await db_Insert(table_name, fields, values, whr, flag);
  }
  res.send(_res_dt);
});

MessageCenterRouter.get("/guest_user", async (req, res) => {
  var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var data = req.query
  var select =
    "a.id, a.hotel_id, a.user_name, a.user_type, b.check_in, b.check_out, b.room_no",
    table_name = "td_guest_user a, td_lodgging b",
    whr = `a.hotel_id=b.hotel_id AND a.id=b.guest_id AND a.hotel_id = ${data.hotel_id} AND a.user_type = '${data.flag}' AND b.check_in <= '${datetime}' AND b.check_out >= '${datetime}'`,
    order = "ORDER BY a.user_name";
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

const sendMessage = (data) => {
  return new Promise(async (resolve, reject) => {
    var select, table_name, whr, order, res_dt, result = {}, res_dtls, len_cnt = 0;

    select = "DISTINCT DATE(send_at) send_at"
    table_name = "td_notification_dtls"
    whr = `hotel_id = ${data.hotel_id}`
    order = 'ORDER BY send_at DESC'
    res_dt = await db_Select(select, table_name, whr, order);
    if (res_dt.suc > 0 && res_dt.msg.length > 0) {
      for (let dt of res_dt.msg) {
        select = "b.*, date(a.send_at) send_dt, time(a.send_at) send_time"
        table_name = "td_notification_dtls a, td_notification b"
        whr = `a.msg_id=b.id AND date(a.send_at) = '${dateFormat(dt.send_at, "yyyy-mm-dd")}' AND b.hotel_id = ${data.hotel_id} ${data.msg_type ? 'AND b.message_center_type = "' + data.msg_type + '"' : ''}`
        order = null
        res_dt = await db_Select(select, table_name, whr, order);
        len_cnt = len_cnt + (res_dt.suc > 0 ? res_dt.msg.length : 0)
        if (res_dt.suc > 0 && res_dt.msg.length > 0) {
          result[dateFormat(dt.send_at, "yyyy-mm-dd")] = res_dt.suc > 0 ? res_dt.msg : null
        }

      }
    }
    // console.log(Object.keys(result).length, len_cnt);
    res_dtls = { suc: Object.keys(result).length > 0 ? 1 : 0, msg: result, tot_msg: len_cnt }
    resolve(res_dtls)
  })
}

const sendHotelMessage = (id) => {
  return new Promise(async (resolve, reject) => {
    var select = '*', 
      table_name = `td_notification a`, 
      whr = `a.id = ${id}`, 
      order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    console.log(res_dt);
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
      if(res_dt.msg[0].audience == '1A'){
        var token = []
        var select = 'a.id, a.id user_id, a.user_name, a.app_token_id, b.check_in, b.check_out', 
        table_name = `td_guest_user a, td_lodgging b`, 
        whr = `a.hotel_id = ${res_dt.msg[0].hotel_id} AND a.id=b.guest_id AND a.user_type = 'N' AND date(b.check_in) <= date(now()) AND date(b.check_out) >= date(now()) AND a.app_token_id IS NOT NULL`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(user_dt);
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p);
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p);
          }
        }
      }else{
        var token = []
        var select = 'a.id, a.message_center_type, a.language, a.img_path, a.msg_title, a.msg_subtitle, a.msg_body, a.dept_link, d.check_in, d.check_out, c.app_token_id, c.id user_id', 
        table_name = `td_notification a, td_notification_audience b, td_guest_user c, td_lodgging d`, 
        whr = `a.id=b.notification_id AND b.guest_user_id=c.id AND b.guest_user_id=d.guest_id AND date(d.check_in) <= date(now()) AND date(d.check_out) >= date(now()) AND a.id = ${id}`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(user_dt);
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p);
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            resolve(p);
          }
        }
      }
    }
  })
}

const sendEmergencyMessage = (id) => {
  return new Promise(async (resolve, reject) => {
    var select = '*', 
    table_name = `td_notification a`, 
    whr = `a.id = ${id}`, 
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
      var token = []
      var select = 'a.id, a.id user_id, a.user_name, a.app_token_id, b.check_in, b.check_out', 
        table_name = `td_guest_user a, td_lodgging b`, 
        whr = `a.hotel_id = ${res_dt.msg[0].hotel_id} AND a.id=b.guest_id AND date(b.check_in) <= date(now()) AND date(b.check_out) >= date(now()) AND a.app_token_id IS NOT NULL`, 
        order = null;
      var user_dt = await db_Select(select, table_name, whr, order)

      if(user_dt.suc > 0 && user_dt.msg.length > 0){
        if(user_dt.msg.length == 1){
          var p = await singleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
          console.log(p);
          resolve(p);
        }else{
          for(let user of user_dt.msg){
            user.app_token_id ? token.push(user.app_token_id) : ''
          }
          console.log(token);
          var p = await MultipleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
          console.log(p);
          resolve(p);
        }
      }
    }
  })
}

const sendVipMessage = (id) => {
  return new Promise(async (resolve, reject) => {
    var select = '*', 
    table_name = `td_notification a`, 
    whr = `a.id = ${id}`, 
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
      if(res_dt.msg[0].audience == 3){
        var token = []
        var select = 'a.id, a.id user_id, a.user_name, a.app_token_id, b.check_in, b.check_out', 
        table_name = `td_guest_user a, td_lodgging b`, 
        whr = `a.hotel_id = ${res_dt.msg[0].hotel_id} AND a.id=b.guest_id AND a.user_type = 'V' AND date(b.check_in) <= date(now()) AND date(b.check_out) >= date(now()) AND a.app_token_id IS NOT NULL`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(3, user_dt);
        // return;
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p)
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p)
          }
        }
      }else if(dt.audience == 4){
        var token = []
        var select = 'a.id, a.message_center_type, a.language, a.img_path, a.msg_title, a.msg_subtitle, a.msg_body, a.dept_link, d.check_in, d.check_out, c.app_token_id, c.id user_id', 
        table_name = `td_notification a, td_notification_audience b, td_guest_user c, td_lodgging d`, 
        whr = `a.id=b.notification_id AND b.guest_user_id=c.id AND b.guest_user_id=d.guest_id AND date(d.check_in) <= date(now()) AND date(d.check_out) >= date(now()) AND a.id = ${res_dt.msg[0].id} AND c.app_token_id IS NOT NULL`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(4, dt, user_dt);
        // return;
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p)
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
            resolve(p)
          }
        }
      }
    }
  })
}

const sendEmployeeMessage = (id) => {
  return new Promise(async (resolve, reject) => {
    var select = '*', 
    table_name = `td_notification a`, 
    whr = `a.id = ${id}`, 
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
      var token = []
      var select = 'a.id, a.id user_id, a.user_name, a.app_token_id', 
      table_name = `td_guest_user a`, 
      whr = `a.hotel_id = ${res_dt.msg[0].hotel_id} AND a.user_type = 'E' AND a.app_token_id IS NOT NULL`, 
      order = null;
      var user_dt = await db_Select(select, table_name, whr, order)
      // console.log(user_dt);
      // return;

      if(user_dt.suc > 0 && user_dt.msg.length > 0){
        if(user_dt.msg.length == 1){
          var p = await singleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
          console.log(p);
          resolve(p)
        }else{
          for(let user of user_dt.msg){
            user.app_token_id ? token.push(user.app_token_id) : ''
          }
          console.log(token);
          var p = await MultipleUser(res_dt.msg[0].msg_title, res_dt.msg[0].msg_body, res_dt.msg[0].dept_link, res_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
          console.log(p);
          resolve(p)
        }
      }
    }
  })
}

const sendGroupMessage = (id) => {
  return new Promise(async (resolve, reject) => {
    var select = '*', 
    table_name = `td_notification a`, 
    whr = `a.id = ${id}`, 
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
      if(res_dt.msg[0].audience == 5){
        var token = []
        var select = 'a.id, a.user_name, a.app_token_id, b.check_in, b.check_out', 
        table_name = `td_guest_user a, td_lodgging b`, 
        whr = `a.hotel_id = ${res_dt.msg[0].hotel_id} AND a.id=b.guest_id AND a.user_type = 'G' AND date(b.check_in) <= date(now()) AND date(b.check_out) >= date(now()) AND a.app_token_id IS NOT NULL`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(user_dt);
        // return;
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(dt.msg_title, dt.msg_body, dt.dept_link, dt.id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(dt.msg_title, dt.msg_body, dt.dept_link, dt.id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
          }
        }
      }else if(dt.audience == 6){
        var token = []
        var select = 'a.id, a.message_center_type, a.language, a.img_path, a.msg_title, a.msg_subtitle, a.msg_body, a.dept_link, d.check_in, d.check_out, c.app_token_id, c.id user_id', 
        table_name = `td_notification a, td_notification_audience b, td_guest_user c, td_lodgging d`, 
        whr = `a.id=b.notification_id AND b.guest_user_id=c.id AND b.guest_user_id=d.guest_id AND date(d.check_in) <= date(now()) AND date(d.check_out) >= date(now()) AND a.id = ${res_dt.msg[0].id} AND c.app_token_id IS NOT NULL`, 
        order = null;
        var user_dt = await db_Select(select, table_name, whr, order)
        // console.log(user_dt);
        // return;
        // break;
        if(user_dt.suc > 0 && user_dt.msg.length > 0){
          if(user_dt.msg.length == 1){
            var p = await singleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, user_dt.msg[0].app_token_id, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
          }else{
            for(let user of user_dt.msg){
              user.app_token_id ? token.push(user.app_token_id) : ''
            }
            console.log(token);
            var p = await MultipleUser(user_dt.msg[0].msg_title, user_dt.msg[0].msg_body, user_dt.msg[0].dept_link, user_dt.msg[0].id, token, user_dt.msg[0].check_in, user_dt.msg[0].check_out, user_dt.msg[0].user_id)
            console.log(p);
          }
        }
      }
    }
  })
}

MessageCenterRouter.get('/curr_time', (req, res) => {
	res.send(dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"));
})

// MessageCenterRouter

module.exports = { MessageCenterRouter, save_message, sendMessage };