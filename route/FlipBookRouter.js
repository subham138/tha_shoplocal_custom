const express = require("express"),
    FlipBookRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Insert, db_Select, db_Check } = require("../modules/MasterModule");

const FlipBookSave = (data, fileName) => {
    return new Promise(async (resolve, reject) => {
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        var chk_dt = await db_Select('id', 'td_flipbook', `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`, null);
        // console.log(chk_dt);
        var flip_id = 0, res_dt
        if (chk_dt.suc > 0 && chk_dt.msg.length == 0) {
            var table_name = 'td_flipbook',
                fields = '(hotel_id, guest_id, guest_name, room_no, check_in, check_out, flip_url, created_by, created_dt)',
                values = `(${data.hotel_id}, ${data.guest_id}, '${data.user_name}', ${data.room_no}, '${dateFormat(data.check_in, "yyyy-mm-dd HH:MM:ss")}', '${dateFormat(data.check_out, "yyyy-mm-dd HH:MM:ss")}', '${data.flip_url}', '${data.user}', '${datetime}')`,
                whr = null,
                flag = 0;
            res_dt = await db_Insert(table_name, fields, values, whr, flag)
            flip_id = res_dt.suc > 0 ? res_dt.lastId.insertId : 0
        } else {
            flip_id = chk_dt.suc > 0 ? chk_dt.msg[0]?.id : 0
        }
        if (flip_id > 0) {
            var table_name = 'td_flipbook_img',
                fields = '(flip_id, img_catg, img_path, created_by, created_dt)',
                values = `(${flip_id}, '${data.flag}', '${fileName}', '${data.user}', '${datetime}')`,
                whr = null,
                flag = 0;
            res_dt = await db_Insert(table_name, fields, values, whr, flag)
            resolve(res_dt)
        } else {
            resolve(res_dt)
        }
    })
}

FlipBookRouter.get('/flip_book', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_flipbook',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    if (data.id > 0 && res_dt.suc > 0) {
        var select = '*',
            table_name = 'td_flipbook_img',
            whr = `flip_id = ${data.id}`,
            order = null;
        var img_dt = await db_Select(select, table_name, whr, order)
        res_dt.msg[0]['img'] = img_dt.msg
    }
    res.send(res_dt)
})

FlipBookRouter.post('/flip_approve', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), res_dt;
    if (data.id > 0) {
        var table_name = 'td_flipbook',
            fields = `approve_flag = '${data.flag}', modified_by = '${data.user}', modified_dt = '${datetime}'`,
            values = null,
            whr = `id = ${data.id}`,
            flag = 1;
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    } else {
        res_dt = { suc: 0, msg: 'No ID Found' }
    }
    res.send(res_dt)
})

FlipBookRouter.post('/flip_send', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), res_dt;
    if (data.id > 0) {
        var table_name = 'td_flipbook',
            fields = `send_flag = 'Y', send_date = '${datetime}', modified_by = '${data.user}', modified_dt = '${datetime}'`,
            values = null,
            whr = `id = ${data.id}`,
            flag = 1;
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    } else {
        res_dt = { suc: 0, msg: 'No ID Found' }
    }
    res.send(res_dt)
})

module.exports = { FlipBookRouter, FlipBookSave }