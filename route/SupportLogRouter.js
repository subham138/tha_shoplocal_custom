const express = require('express'),
    SupportLogRouter = express.Router(),
    dateFormat = require('dateformat');
const { SendEmailSupport } = require('../modules/EmailModule');
const { db_Insert, db_Select, db_Delete } = require('../modules/MasterModule');

const SaveRaiseSupportLog = async (data, filePath) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        curr_year = dateFormat(new Date(), "yyyy");
    var select = `IF(MAX(id) > 0, MAX(id)+1, 1) last_id`, 
    table_name = 'td_support_log', 
    whr = `YEAR(tkt_date) = "${curr_year}"`, 
    order = null;
    var last_id = await db_Select(select, table_name, whr, order);
    var tkt_no = `${curr_year}-${last_id.suc > 0 ? last_id.msg[0].last_id : 1}`;
    return new Promise(async (resolve, reject) => {
        var table_name = 'td_support_log', 
        fields = data.id > 0 ? `hotel_user_name = "${data.user_name}", hotel_user_phone = "${data.phone}", hotel_user_email = "${data.email}", hotel_user_desig = "${data.desig}", issue = "${data.issue}"${filePath ? ', file_path = "' + filePath + '"' : ''}, modified_by = "${data.user}", modified_dt = "${datetime}"` : 
        `(hotel_id, tkt_date, tkt_no, hotel_user_name, hotel_user_phone, hotel_user_email, hotel_user_desig, issue${filePath ? ', file_path' : ''}, created_by, created_dt)`, 
        values = `(${data.hotel_id}, "${datetime}", "${tkt_no}", "${data.user_name}", "${data.phone}", "${data.email}", "${data.desig}", "${data.issue}"${filePath ? ', "' + filePath + '"' : ''}, "${data.user}", "${datetime}")`, 
        whr = data.id > 0 ? `id = ${data.id}` : null, 
        flag = data.id > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        await SendEmailSupport(data.email, data.user_name, data.email, data.phone, data.issue, data.hotel_name, 'P', 'A')
        resolve(res_dt)
    })
}

SupportLogRouter.get('/support_log', async (req, res) => {
    var data = req.query
    var select = `a.*, b.restaurant_name hotel_name`, 
        table_name = 'td_support_log a, td_contacts_custom b', 
        whr = data.id > 0 ? `a.hotel_id = b.id AND a.id = ${data.id}` : (data.hotel_id > 0 ? `a.hotel_id = b.id AND hotel_id = "${data.hotel_id}"` : 'a.hotel_id = b.id'), 
        order = `ORDER BY tkt_date DESC`;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt)
})

SupportLogRouter.post('/update_support_log', async (req, res) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")
	var data = req.body;
    var table_name = 'td_support_log', 
        fields = `tkt_attend_dt = "${datetime}", tkt_solved_by = "${data.user}", remarks = "${data.remarks}", tkt_status = "${data.tkt_status}", modified_by = "${data.user}", modified_dt = "${datetime}"`, 
        values = null, 
        whr = `id = ${data.id}`, 
        flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    await SendEmailSupport(data.hotel_user_email, data.hotel_user_name, data.hotel_user_email, data.hotel_user_phone, data.issue, data.hotel_name, data.tkt_status, 'U')
    res.send(res_dt)
})

SupportLogRouter.get('/support_log_del', async (req, res) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")
	var data = req.query;
    var table_name = 'td_support_log', 
        whr = `id = ${data.id}`;
    var res_dt = await db_Delete(table_name, whr)
    res.send(res_dt)
})

module.exports = {SupportLogRouter, SaveRaiseSupportLog}