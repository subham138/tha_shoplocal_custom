const express = require("express");
const dateFormat = require("dateformat");
const { db_Select, db_Insert, db_Check } = require("../modules/MasterModule");
const FunDirectoryRouter = express.Router();

FunDirectoryRouter.get('/fun_directory', async (req, res) => {
  var data = req.query;
  var select = "*",
    table_name = "td_fun_directory",
    whr = data.id > 0 ? `id = ${data.id}` : "",
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
})

const funDirectorySaveData = (data, img_path) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_fun_directory",
      fields = data.id > 0 ? `${img_path ? "top_img = '" + img_path + "'," : ""} bg_color = '${data.bg_color}', txt_color = '${data.txt_color}', modified_by = '${data.user}', modified_dt = '${datetime}'` : `(${img_path ? 'top_img, ' : ''} bg_color, txt_color, created_by, created_dt)`,
      values = `(${img_path ? '"' + img_path + '", ' : ''} '${data.bg_color}', '${data.txt_color}', '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    resolve(res_dt)
  })
};

FunDirectoryRouter.get('/fun_directory_menu', async (req, res) => {
    var data = req.query
    var select = "*",
      table_name = "td_fun_directory_menu",
      whr = data.id > 0 ? `id = ${data.id}` : '',
      order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

FunDirectoryRouter.post("/fun_directory_menu", async (req, res) => {
    var data = req.body,
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var select = "COUNT(id) tot_row",
      table_name = "td_fun_directory_menu",
      whr = `active_flag = 'Y'`,
      order = null;
    var dt = await db_Select(select, table_name, whr, order);

    var active_flag = dt.suc > 0 && dt.msg[0].tot_row > 11 ? 'N' : 'Y';

    var table_name = "td_fun_directory_menu",
        fields = data.id > 0 ? `menu_name = '${data.menu_name}', menu_url = '${data.menu_url}', active_flag="${active_flag}", modified_by = '${data.user}', modified_dt = '${datetime}'` : "(menu_name, menu_url, active_flag, created_by, created_dt)",
        values = `('${data.menu_name}', '${data.menu_url}', '${active_flag}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
});

FunDirectoryRouter.post("/fun_directory_menu_active", async (req, res) => {
    var data = req.body,
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_fun_directory_menu",
      fields = `active_flag = '${data.flag}', modified_by = '${data.user}', modified_dt = '${datetime}'`,
      values = null,
      whr = `id = ${data.id}`,
      flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
});



const SaveFunDirMenuImgDt = (data, img_list) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_fun_directory_menu_info",
      fields = data.id > 0 ? `menu_title = '${data.title}', menu_sub_title = '${data.sub_title}', menu_desc = '${data.desc}', modified_by = '${data.user}', modified_dt = '${datetime}'` : '(dir_menu_id, menu_title, menu_sub_title, menu_desc, created_by, created_dt)',
      values = `('${data.menu_id}', '${data.title}', '${data.sub_title}', '${data.desc}', '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    if(res_dt.suc > 0){
      if (img_list) {
        for(let dt of img_list){
          var chk_dt = await db_Check("id", "td_fun_directory_menu_img", `dir_menu_id = ${data.menu_id}`);
          table_name = 'td_fun_directory_menu_img',
          fields = chk_dt.msg > 0 && data.menu_id == 1 ? `img_path = '${dt.img_path}', modified_by = '${data.user}', modified_dt = '${datetime}'` : `(dir_menu_id, img_path, created_by, created_dt)`, 
          values = `('${data.menu_id}', '${dt.img_path}', '${data.user}', '${datetime}')`, 
          whr = chk_dt.msg > 0 && data.menu_id == 1 ? `id = ${chk_dt.res[0].id}` : null, 
          flag = chk_dt.msg > 0 && data.menu_id == 1 ? 1 : 0;
          res_dt = await db_Insert(table_name, fields, values, whr, flag)
        }
      }
      // if(data.menu_id > 1){
      //   table_name = 'td_fun_directory_menu_section',
      //   fields = chk_dt.msg > 0 && data.menu_id == 1 ? `img_path = '${dt.img_path}', modified_by = '${data.user}', modified_dt = '${datetime}'` : `(dir_menu_id, img_path, created_by, created_dt)`, 
      //   values = `('${data.menu_id}', '${dt.img_path}', '${data.user}', '${datetime}')`, 
      //   whr = chk_dt.msg > 0 && data.menu_id == 1 ? `id = ${chk_dt.res[0].id}` : null, 
      //   flag = chk_dt.msg > 0 && data.menu_id == 1 ? 1 : 0;
      //   res_dt = await db_Insert(table_name, fields, values, whr, flag)
      // }
      resolve(res_dt)
    }else{
      resolve(res_dt)
    }
    
  })
}

FunDirectoryRouter.get("/fun_directory_menu_info", async (req, res) => {
  var data = req.query;
  var select = "id, dir_menu_id, menu_title, menu_sub_title, menu_desc",
    table_name = "td_fun_directory_menu_info",
    whr = data.menu_id > 0 ? `dir_menu_id = '${data.menu_id}'` : null,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  //if(data.menu_id > 0){
    var select = "dir_menu_id, img_path",
      table_name = "td_fun_directory_menu_img",
      whr = `dir_menu_id = '${data.menu_id}'`,
      order = null;
    var dt = await db_Select(select, table_name, whr, order);
  //}
  res.send({suc: res_dt.suc, msg: res_dt.msg, img: dt.msg});
});

FunDirectoryRouter.get('/fun_directory_section', async (req, res) => {
  var data = req.query
  var select = "id, dir_menu_id, sec_name, bg_color, txt_color",
    table_name = "td_fun_directory_menu_section",
    whr = data.id > 0 ? `id = '${data.id}'` : (data.menu_id ? `dir_menu_id = '${data.menu_id}'` : null),
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt)
})

FunDirectoryRouter.post('/fun_directory_section', async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = "td_fun_directory_menu_section",
        fields = data.id > 0 ? `sec_name = '${data.sec_name}', bg_color = '${data.bg_color}', txt_color = '${data.txt_color}', modified_by = '${data.user}', modified_dt = '${datetime}'` : "(dir_menu_id, sec_name, bg_color, txt_color, created_by, created_dt)",
        values = `('${data.menu_id}', '${data.sec_name}', '${data.bg_color}', '${data.txt_color}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

FunDirectoryRouter.get("/fun_directory_sec_menu", async (req, res) => {
  var data = req.query;
  var select = "id, dir_menu_id menu_id, dir_menu_sec_id sec_id, img, title, sub_title, about, special_offer, website, map_url, phone_no",
    table_name = "td_fun_directory_menu_section_dtls",
    whr = data.id > 0 ? `id = '${data.id}'` : data.menu_id ? `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}'` : null,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

const SaveFunDirSecMenu = (data, fileName) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_fun_directory_menu_section_dtls",
      fields =
        data.id > 0
          ? `${fileName ? 'img = "' + fileName + '", ' : ''}title = '${data.title}', sub_title = '${data.sub_title}', about = '${data.about}', special_offer = '${data.special_offer}', website = '${data.website}', map_url = '${data.map_url}', phone_no = '${data.phone_no}', modified_by = '${data.user}', modified_dt = '${datetime}'`
          : `(dir_menu_id, dir_menu_sec_id ${fileName ? ', img' : ''}, title, sub_title, about, special_offer, website, map_url, phone_no, created_by, created_dt)`,
      values = `('${data.menu_id}', '${data.sec_id}' ${fileName ? ',"' + fileName + '"' : ''}, '${data.title}', '${data.sub_title}', '${data.about}', '${data.special_offer}', '${data.website}', '${data.menu_url}', '${data.phone_no}', '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    resolve(res_dt)
  })
}

FunDirectoryRouter.get("/fun_directory_calendar", async (req, res) => {
  var data = req.query;
  var select = `id, event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, cal_type, cal_schedule, start_date, end_date, event_time, event_day, bg_color, txt_color`,
    table_name = "td_fun_directory_calendar",
    whr =
      data.id > 0 ? `id=${data.id}` : null,
    order = "ORDER BY event_date DESC";
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

const FunDirCalendarSaveData = (data, img_path) => {
  return new Promise(async (resolve, reject) => {
    var currDate = dateFormat(new Date(), "yyyy-mm-dd"),
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
      if(data.cal_type == 'O'){
        var table_name = "td_fun_directory_calendar",
          fields =
            data.id > 0
              ? `event_date = '${data.event_date}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null},  bg_color = '${data.bg_color}', txt_color = '${data.txt_color}', modified_by = '${data.user}', modified_dt = '${datetime}'`
              : `(event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                    cal_type, cal_schedule, bg_color, txt_color, created_by, created_dt)`,
          values = `('${data.event_date}', '${data.event_title}', '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
            '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.bg_color}', '${data.txt_color}', '${data.user}', '${datetime}')`,
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
              var table_name = "td_fun_directory_calendar",
                fields =
                  data.id > 0
                    ? `event_date = '${dateFormat(currDt, "yyyy-mm-dd")}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, start_date = '${data.start_date}', end_date = '${data.end_date}', event_time = '${data.event_time}', event_day = '${data.event_day}', bg_color = '${data.bg_color}', txt_color = '${data.txt_color}', modified_by = '${data.user}', modified_dt = '${datetime}'`
                    : `(event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                          cal_type, cal_schedule, start_date, end_date, event_time, event_day, bg_color, txt_color, created_by, created_dt)`,
                values = `('${dateFormat(currDt, "yyyy-mm-dd")}', '${data.event_title}', 
                  '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
                  '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.start_date}', '${data.end_date}', '${data.event_time}', '${data.event_day}', '${data.bg_color}', '${data.txt_color}', '${data.user}', '${datetime}')`,
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
            var table_name = "td_fun_directory_calendar",
              fields =
                data.id > 0
                  ? `event_date = '${dateFormat(currDt, "yyyy-mm-dd")}', event_title = '${data.event_title}', event_sub_title = '${data.event_sub_title}', website = '${data.website}', video_url = '${data.video_url}', tkt_url = '${data.tkt_url}', description = '${data.description}', img_path = '${img_path ? img_path : data.img_path}', cal_type = '${data.cal_type}', cal_schedule = ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, start_date = '${data.start_date}', end_date = '${data.end_date}', event_time = '${data.event_time}', bg_color = '${data.bg_color}', txt_color = '${data.txt_color}', modified_by = '${data.user}', modified_dt = '${datetime}'`
                  : `(event_date, event_title, event_sub_title, website, video_url, tkt_url, description, img_path, 
                        cal_type, cal_schedule, start_date, end_date, event_time, bg_color, txt_color, created_by, created_dt)`,
              values = `('${dateFormat(currDt, "yyyy-mm-dd")}', '${data.event_title}', 
                '${data.event_sub_title}', '${data.website}', '${data.video_url}', '${data.tkt_url}', '${data.description}', '${img_path ? img_path : data.img_path}', 
                '${data.cal_type}', ${data.cal_type != 'O' ? '"' + data.cal_schedule + '"' : null}, '${data.start_date}', '${data.end_date}', '${data.event_time}', '${data.bg_color}', '${data.txt_color}', '${data.user}', '${datetime}')`,
              whr = data.id > 0 ? `id = ${data.id}` : null,
              flag = data.id > 0 ? 1 : 0;

            var res_dt = await db_Insert(table_name, fields, values, whr, flag);
            resolve(res_dt);
          }
        }
      }
  });
};

FunDirectoryRouter.get('/fun_dir_res_menu', async (req, res) => {
  var data = req.query;
  var select = `id, dir_menu_id menu_id, dir_menu_sec_id sec_id, dir_menu_sec_dt_id res_id, catg_name`,
    table_name = "td_fun_directory_res_menu_catg ",
    whr = data.id > 0 ? `id=${data.id}` : `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}' AND dir_menu_sec_dt_id = ${data.res_id}`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
})

FunDirectoryRouter.post("/fun_dir_res_menu", async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = "td_fun_directory_res_menu_catg",
    fields =
      data.id > 0
        ? `catg_name = '${data.catg_name}', modified_by = '${data.user}', modified_dt = '${datetime}'`
        : "(dir_menu_id, dir_menu_sec_id, dir_menu_sec_dt_id, catg_name, created_by, created_dt)",
    values = `('${data.menu_id}', '${data.sec_id}', '${data.res_id}', '${data.catg_name}', '${data.user}', '${datetime}')`,
    whr = data.id > 0 ? `id = ${data.id}` : null,
    flag = data.id > 0 ? 1 : 0;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag);
  res.send(res_dt);
});

FunDirectoryRouter.get("/fun_dir_res_menu_sec", async (req, res) => {
  var data = req.query;
  var select = `id, dir_menu_id menu_id, dir_menu_sec_id sec_id, dir_menu_sec_dt_id res_id, f_res_menu_catg menu_catg_id, res_sec_name sec_name, img_path`,
    table_name = "td_fun_directory_res_menu_sec",
    whr = data.id > 0 ? `id=${data.id}` : `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}' AND dir_menu_sec_dt_id = '${data.res_id}' ${data.catg_id ? 'AND f_res_menu_catg ='+ data.catg_id : '' }`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

const SaveResDirMenuSec = (data,img_path) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "td_fun_directory_res_menu_sec",
      fields =
        data.id > 0
          ? `${img_path ? 'img_path = "'+img_path + '", ' : ''} res_sec_name = '${data.sec_name}', modified_by = '${data.user}', modified_dt = '${datetime}'`
          : `(dir_menu_id, dir_menu_sec_id, dir_menu_sec_dt_id, f_res_menu_catg, res_sec_name ${img_path ? ', img_path' : ''}, created_by, created_dt)`,
      values = `('${data.menu_id}', '${data.sec_id}', '${data.res_id}', '${data.catg_id}', '${data.sec_name}'${img_path ? ', "' + img_path + '"' : ''}, '${data.user}', '${datetime}')`,
      whr = data.id > 0 ? `id = ${data.id}` : null,
      flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    resolve(res_dt);
  })
}

FunDirectoryRouter.get("/fun_dir_res_menu_sec_item", async (req, res) => {
  var data = req.query;
  var select = `id, dir_menu_id menu_id, dir_menu_sec_id sec_id, dir_menu_sec_dt_id res_id, f_res_menu_catg menu_catg_id, f_res_sec_id res_sec_id, item_name, item_price, item_desc`,
    table_name = "td_fun_directory_res_menu_sec_item",
    whr =
      data.id > 0
        ? `id=${data.id}`
        : `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${
            data.sec_id
          }' AND dir_menu_sec_dt_id = '${data.res_id}' ${
            data.catg_id ? "AND f_res_menu_catg =" + data.catg_id : ""
          } ${data.res_sec_id ? "AND f_res_sec_id =" + data.res_sec_id : ""}`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

FunDirectoryRouter.post("/fun_dir_res_menu_sec_item", async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
  var table_name = "td_fun_directory_res_menu_sec_item",
    fields =
      data.id > 0
        ? `item_name = '${data.item_name}', item_price = '${data.item_price}', item_desc = '${data.item_desc}', modified_by = '${data.user}', modified_dt = '${datetime}'`
        : "(dir_menu_id, dir_menu_sec_id, dir_menu_sec_dt_id, f_res_menu_catg, f_res_sec_id, item_name, item_price, item_desc, created_by, created_dt)",
    values = `('${data.menu_id}', '${data.sec_id}', '${data.res_id}', '${data.menu_catg_id}', '${data.res_sec_id}', '${data.item_name}', '${data.item_price}', '${data.item_desc}', '${data.user}', '${datetime}')`,
    whr = data.id > 0 ? `id = ${data.id}` : null,
    flag = data.id > 0 ? 1 : 0;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag);
  res.send(res_dt);
});

FunDirectoryRouter.get("/fun_dir_res_menu_preview", async (req, res) => {
  var data = req.query,
    dt1 = {},
    dt2 = {},
    dt3 = {},
    item_dt;
  var select = `id, dir_menu_sec_dt_id res_id, catg_name`,
    table_name = "td_fun_directory_res_menu_catg",
    whr = `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}'`,
    order = `GROUP BY dir_menu_sec_dt_id`;
  var res_dt = await db_Select(select, table_name, whr, order);

  if (res_dt.suc > 0 && res_dt.msg.length > 0) {
    for (let res of res_dt.msg) {
      var select = `id, catg_name`,
        table_name = "td_fun_directory_res_menu_catg",
        whr = `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}' AND dir_menu_sec_dt_id = '${res.res_id}'`,
        order = null;
      var catg_dt = await db_Select(select, table_name, whr, order);

      if (catg_dt.suc > 0 && catg_dt.msg.length > 0) {
        for (let dt of catg_dt.msg) {
          var select = `id, res_sec_name sec_name, img_path`,
            table_name = "td_fun_directory_res_menu_sec",
            whr = `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}' AND dir_menu_sec_dt_id = '${res.res_id}' AND f_res_menu_catg = ${dt.id}`,
            order = null;
          var sec_dt = await db_Select(select, table_name, whr, order);

          // console.log(sec_dt);

          if (sec_dt.suc > 0 && sec_dt.msg.length > 0) {
            dt3 = {};
            for (let sec of sec_dt.msg) {
              var select = `id, item_name, item_price, item_desc`,
                table_name = "td_fun_directory_res_menu_sec_item",
                whr = `dir_menu_id = '${data.menu_id}' AND dir_menu_sec_id = '${data.sec_id}' AND dir_menu_sec_dt_id = '${res.res_id}' AND f_res_menu_catg = ${dt.id} AND f_res_sec_id = ${sec.id}`,
                order = null;
              item_dt = await db_Select(select, table_name, whr, order);

              dt3[sec.sec_name] = { dt: item_dt.msg, img: sec.img_path };
              // break;
            }
            // console.log(dt3);
            dt2[dt.catg_name] = dt3;
            // break;
          }
        }
      }
      dt1[res.res_id] = dt2;
      // console.log(catg_dt);
    }
  }

  // console.log(dt1);
  res.send({ suc: 1, msg: dt1 });
});

module.exports = { FunDirectoryRouter, funDirectorySaveData, SaveFunDirMenuImgDt, SaveFunDirSecMenu, FunDirCalendarSaveData, SaveResDirMenuSec};