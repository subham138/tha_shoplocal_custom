const express = require('express'),
    LostFoundRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Insert, db_Select } = require('../modules/MasterModule');

LostFoundRouter.get('/lost_found', async (req, res) => {
    var data = req.query;
    var select = '*',
        table_name = 'td_lost_found',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id} ${data.flag ? 'AND lf_flag="' + data.flag + '"' : ''} ${data.user_flag ? 'AND saved_by="' + data.user_flag + '"' : ''}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

LostFoundRouter.post('/lost_found', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var table_name = 'td_lost_found',
        fields = data.id > 0 ? `saved_by = '${data.saved_by}', user_id = '${data.user_id}', user_name = '${data.user_name}', user_email = '${data.user_email}', lf_flag = '${data.lf_flag}', lf_date = '${dateFormat(data.lf_date, "yyyy-mm-dd")}', item_name = "${data.item_name}", item_desc = "${data.item_desc}", remarks = "${data.remarks}", approval_flag = "${data.saved_by != 'A' ? 'P' : 'Y'}", modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, saved_by, user_id, user_name, user_email, lf_flag, lf_date, item_name, item_desc, remarks, approval_flag, created_by, created_dt)`,
        values = `('${data.hotel_id}', '${data.saved_by}', '${data.user_id}', '${data.user_name}', '${data.user_email}', '${data.lf_flag}', '${dateFormat(data.lf_date, "yyyy-mm-dd")}', "${data.item_name}", "${data.item_desc}", "${data.remarks}", "${data.saved_by != 'A' ? 'P' : 'Y'}", '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;

    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

LostFoundRouter.post('/lost_found_approve', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var table_name = 'td_lost_found',
        fields = `approval_flag = "${data.approval_flag}", modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = ${data.id}`,
        flag = 1;

    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

module.exports = {LostFoundRouter}