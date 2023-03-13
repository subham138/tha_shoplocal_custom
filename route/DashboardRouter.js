
const express = require("express"),
    DashboardRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Select, db_Insert, db_Check } = require("../modules/MasterModule");

DashboardRouter.get('/dashboard_prog', async (req, res) => {
    var data = req.query, result = [], menu_list = [];
    var select = 'COUNT(*) cnt_dtls',
        table_name = 'td_contacts_custom',
        whr = `id=${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Hotel Information' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_qustionnaire'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Questionnaire' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_proposal'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Proposal' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'md_department'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Departments' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'md_employee'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Add/Manage Managers' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_pc_avatar'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Avatar' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_pc_voice'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Voice' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_group'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Add/Manage Group Leader' })
    menu_list.push({ count_dt: 1, title: 'Menu Image' })
    menu_list.push({ count_dt: 1, title: 'Menu' })
    menu_list.push({ count_dt: 1, title: 'Date Time' })
    menu_list.push({ count_dt: 1, title: 'Section' })
    menu_list.push({ count_dt: 1, title: 'Items' })
    menu_list.push({ count_dt: 1, title: 'Description Price' })
    menu_list.push({ count_dt: 1, title: 'Special Menu' })
    menu_list.push({ count_dt: 1, title: 'Notice' })
    menu_list.push({ count_dt: 1, title: 'About Us' })
    menu_list.push({ count_dt: 1, title: 'Menu Config' })
	
    result.push({ count_dt: 1, title: 'Menu Setup', menu_list: menu_list })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_notification'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Communications' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_emergency_rec_report'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Emergency' })
    result.push({ count_dt: 0, title: 'FAQ' })
    result.push({ count_dt: 0, title: 'Calendars' })
    result.push({ count_dt: 0, title: 'QR code/Signage/Holder' })
    result.push({ count_dt: 0, title: 'Your Directory' })
    result.push({ count_dt: 0, title: 'Promotions/Photo Ops' })
    result.push({ count_dt: 0, title: 'Lost & Found' })
    result.push({ count_dt: 0, title: 'Suggestion Box' })
    result.push({ count_dt: 0, title: 'Directory Setup' })
    result.push({ count_dt: 0, title: 'Training' })
    result.push({ count_dt: 0, title: 'Final Payment' })
    result.push({ count_dt: 0, title: 'No Sale' })

    res.send({ suc: 1, msg: result })
})

const dashboard_prog = async (io, hotel_id) => {
    var data = req.query, result = [];
    var select = 'COUNT(*) cnt_dtls',
        table_name = 'td_contacts_custom',
        whr = `id=${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Hotel Information' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_qustionnaire'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Questionnaire' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_proposal'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Proposal' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'md_department'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Departments' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'md_employee'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Add/Manage Managers' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_pc_avatar'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Avatar' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_pc_voice'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Voice' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_group'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Add/Manage Group Leader' })
    result.push({ count_dt: 1, title: 'Menu Setup' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_notification'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Communications' })

    select = 'COUNT(*) cnt_dtls'
    table_name = 'td_emergency_rec_report'
    whr = `hotel_id=${data.hotel_id}`
    order = null
    res_dt = await db_Select(select, table_name, whr, order)
    result.push({ count_dt: res_dt.suc > 0 ? res_dt.msg[0].cnt_dtls : 0, title: 'Emergency' })
    result.push({ count_dt: 0, title: 'FAQ' })
    result.push({ count_dt: 0, title: 'Calendars' })
    result.push({ count_dt: 0, title: 'QR code/Signage/Holder' })
    result.push({ count_dt: 0, title: 'Your Directory' })
    result.push({ count_dt: 0, title: 'Promotions/Photo Ops' })
    result.push({ count_dt: 0, title: 'Lost & Found' })
    result.push({ count_dt: 0, title: 'Suggestion Box' })
    result.push({ count_dt: 0, title: 'Directory Setup' })
    result.push({ count_dt: 0, title: 'Training' })
    result.push({ count_dt: 0, title: 'Final Payment' })
    result.push({ count_dt: 0, title: 'No Sale' })

    io.emit('dashboard_prog', {suc: 1, msg: result})
}

DashboardRouter.get('/dir_live', async (req, res) => {
    var data = req.query
    var select = "*",
      table_name = "td_directory_live",
      whr = `hotel_id=${data.hotel_id}`,
      order = null;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt)
})

DashboardRouter.post('/dir_live', async (req, res) => {
    var data = req.body,
      datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
      field;
      var menu_setup = data.div_flag.split('_')[0] == 'es' || data.div_flag.split('_')[0] == 'er' ? {flag: data.div_flag.split('_')[0], id: data.div_flag.split('_')[1]} : null

    // var chk_dt = db_Check('COUNT(*)', 'td_directory_live', `hotel_id = ${data.hotel_id}`)
    if (menu_setup){
      var table_name =
          menu_setup.flag == "es" ? "td_quest_service" : "td_quest_res_bars",
        fields = `live_dir_flag = '${data.flag}', modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = ${menu_setup.id}`,
        flag = 1;
      var res_dt = await db_Insert(table_name, fields, values, whr, flag);
      res.send(res_dt);
    }else{
        switch (data.div_flag) {
          case "cal":
            field = `ent_cal`;
            break;
          case "po":
            field = `photo_ops`;
            break;
          case "faq":
            field = `con_faq`;
            break;
          case "fun":
            field = `fun_dir`;
            break;
          case "promo":
            field = `promo`;
            break;
          case "safety":
            field = `saf_faq`;
            break;
          case "hotel_faq":
            field = `hot_faq`;
            break;
          case "lf":
            field = `lost_found`;
            break;
          case "sb":
            field = `sug_box`;
            break;
          case "vb":
            field = `flip_book`;
            break;

          default:
            break;
        }
        var table_name = "td_directory_live",
          fields =
            data.id > 0
              ? `${field} = '${data.flag}', modified_by = '${data.user}', modified_dt = '${datetime}'`
              : `(hotel_id, ${field}, created_by, created_dt)`,
          values = `(${data.hotel_id}, '${data.flag}', '${data.user}', '${datetime}')`,
          whr = data.id > 0 ? `id = ${data.id}` : null,
          flag = data.id > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag);
        res.send(res_dt);
    }
})

module.exports = { DashboardRouter, dashboard_prog }