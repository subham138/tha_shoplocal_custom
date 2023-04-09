const express = require("express");
const dateFormat = require("dateformat");
const { InsertCalender, ApproveCal } = require("../modules/CalenderModule");
const { db_Select, db_Insert } = require("../modules/MasterModule");
const { F_Select } = require("../modules/MenuSetupModule");
const CalenderRouter = express.Router();

CalenderRouter.get("/calendar", async (req, res) => {
  var data = req.query;
  var select = `id, hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, cal_type, cal_schedule`,
    table_name = "td_calendar",
    whr =
      data.id > 0
        ? `id=${data.id}`
        : `hotel_id=${data.hotel_id} AND srv_res_flag='${data.srv_res_flag}' AND srv_res_id='${data.srv_res_id}'`,
    order = "ORDER BY event_date DESC";
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

const CalendarSaveData = (data, img_path) => {
  return new Promise(async (resolve, reject) => {
    var currDate = dateFormat(new Date(), "yyyy-mm-dd"),
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_calendar",
      fields =
        data.id > 0
          ? `sugg = "${data.sugg}", modified_by = '${data.user}', modified_dt = '${datetime}'`
          : `(hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                cal_type, cal_schedule, created_by, created_dt)`,
      values = `('${data.hotel_id}', '${data.srv_res_flag}', '${data.srv_res_id}', '${data.event_date}', '${data.event_title}', 
        '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
        '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;

    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    resolve(res_dt);
  });
};

CalenderRouter.get("/get_cal", async (req, res) => {
  var id = req.query.id,
    whr = id > 0 ? `WHERE id = ${id}` : "";
  var sql = `SELECT * FROM td_calendar_custom ${whr}`;
  var data = await F_Select(sql);
  res.send(data);
});

CalenderRouter.get("/check_calender", async (req, res) => {
  var res_id = req.query.id;
  let sql = `SELECT restaurant_id, event_calendar_flag event_calendar FROM td_order_items_custom WHERE  restaurant_id = ${res_id}`;
  var data = await F_Select(sql);
  res.send(data);
});

CalenderRouter.get("/get_res_dtls", async (req, res) => {
  var res_id = req.query.id;
  let whr = res_id > 0 ? `AND a.id = "${res_id}"` : "";
  let sql = `SELECT a.*, b.setup_fee, b.monthly_fee FROM td_contacts_custom a
                JOIN td_order_items_custom b ON a.id=b.restaurant_id
                WHERE b.event_calendar_flag = 'Y' AND approval_flag = 'A' AND payment_flag = 'Y' ${whr}`;
  var data = await F_Select(sql);
  res.send(data);
});

CalenderRouter.post("/approve_cal", async (req, res) => {
  var data = req.body;
  var dt = await ApproveCal(data);
  res.send(dt);
});

// CalenderRouter.post('/calender_dtls', async (req, res) => {
//     var data = req.body;
//     var dt = await InsertCalender(data);
//     res.send(dt);
// })

module.exports = { CalenderRouter, CalendarSaveData };
