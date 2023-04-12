const express = require("express");
const dateFormat = require("dateformat");
const { InsertCalender, ApproveCal } = require("../modules/CalenderModule");
const { db_Select, db_Insert } = require("../modules/MasterModule");
const { F_Select } = require("../modules/MenuSetupModule");
const CalenderRouter = express.Router();

CalenderRouter.get("/calendar", async (req, res) => {
  var data = req.query;
  var select = `id, hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, cal_type, cal_schedule, start_date, end_date, event_time, event_day`,
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
      if(data.cal_type == 'O'){
        var table_name = "td_calendar",
          fields =
            data.id > 0
              ? `event_date = '${data.event_date}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, modified_by = '${data.user}', modified_dt = '${datetime}'`
              : `(hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                    cal_type, cal_schedule, created_by, created_dt)`,
          values = `('${data.hotel_id}', '${data.srv_res_flag}', '${data.srv_res_id}', '${data.event_date}', '${data.event_title}', 
            '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
            '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.user}', '${datetime}')`,
          whr = data.id > 0 ? `id = ${data.id}` : null,
          flag = data.id > 0 ? 1 : 0;

        var res_dt = await db_Insert(table_name, fields, values, whr, flag);
        resolve(res_dt);
      }else{
        var dt = {
          1: "Monday",
          2: "Tuesday",
          3: "Wednesday",
          4: "Thursday",
          5: "Friday",
          6: "Saturday",
          7: "Sunday",
        };
        var days = parseInt((new Date(data.end_date) - new Date(data.start_date))/ (1000 * 3600 * 24));
        if (data.cal_schedule != 'D') {
          for (let i = 0; i <= days; i++) {
            var currDt = new Date(data.start_date);
            // console.log(currDt.setDate(currDt.getDate() + i));
            // console.log(dateFormat(currDt.setDate(currDt.getDate() + i), "yyyy-mm-dd"));
            if (dt[data.event_day] == dateFormat(currDt.setDate(currDt.getDate() + i), "dddd")) {
              // console.log(dateFormat(currDt, "yyyy-mm-dd"));
              var table_name = "td_calendar",
                fields =
                  data.id > 0
                    ? `event_date = '${dateFormat(currDt, "yyyy-mm-dd")}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, start_date = '${data.start_date}', end_date = '${data.end_date}', event_time = '${data.event_time}', event_day = '${data.event_day}', modified_by = '${data.user}', modified_dt = '${datetime}'`
                    : `(hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                          cal_type, cal_schedule, start_date, end_date, event_time, event_day, created_by, created_dt)`,
                values = `('${data.hotel_id}', '${data.srv_res_flag}', '${data.srv_res_id}', '${dateFormat(currDt, "yyyy-mm-dd")}', '${data.event_title}', 
                  '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
                  '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.start_date}', '${data.end_date}', '${data.event_time}', '${data.event_day}', '${data.user}', '${datetime}')`,
                whr = data.id > 0 ? `id = ${data.id}` : null,
                flag = data.id > 0 ? 1 : 0;

              var res_dt = await db_Insert(table_name, fields, values, whr, flag);
              resolve(res_dt);
            }
          }
        }else{
          for (let i = 0; i <= days; i++) {
            var currDt = new Date(data.start_date);
            currDt.setDate(currDt.getDate() + i)
            var table_name = "td_calendar",
              fields =
                data.id > 0
                  ? `event_date = '${dateFormat(currDt, "yyyy-mm-dd")}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, start_date = '${data.start_date}', end_date = '${data.end_date}', event_time = '${data.event_time}', modified_by = '${data.user}', modified_dt = '${datetime}'`
                  : `(hotel_id, srv_res_flag, srv_res_id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                        cal_type, cal_schedule, start_date, end_date, event_time, created_by, created_dt)`,
              values = `('${data.hotel_id}', '${data.srv_res_flag}', '${data.srv_res_id}', '${dateFormat(currDt, "yyyy-mm-dd")}', '${data.event_title}', 
                '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
                '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.start_date}', '${data.end_date}', '${data.event_time}', '${data.user}', '${datetime}')`,
              whr = data.id > 0 ? `id = ${data.id}` : null,
              flag = data.id > 0 ? 1 : 0;

            var res_dt = await db_Insert(table_name, fields, values, whr, flag);
            resolve(res_dt);
          }
        }
      }
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

CalenderRouter.get('/test_cal', (req, res) => {
  var currDate = dateFormat(new Date(), "yyyy-mm-dd"),
  days = parseInt((new Date('2023-04-26') - new Date(currDate))/ (1000 * 3600 * 24));
  console.log(days);
  
  console.log(dt[1]);
  // currDt = new Date();
  // console.log(parseInt((new Date('2023-04-26') - new Date('2023-04-12'))/ (1000 * 3600 * 24)));
  for(let i = 0; i <= days; i++){
    var currDt = new Date();
    // console.log(currDt.setDate(currDt.getDate() + i));
    // console.log(dateFormat(currDt.setDate(currDt.getDate() + i), "yyyy-mm-dd"));
    if (dt[1] == dateFormat(currDt.setDate(currDt.getDate() + i), "dddd")){
      console.log(dateFormat(currDt, "yyyy-mm-dd"));
    }
  }
})

module.exports = { CalenderRouter, CalendarSaveData };
