const express = require('express'),
    contactUsRouter = express.Router(),
    dateFormat = require('dateformat');
const { db_Select, db_Insert } = require('../modules/MasterModule');

contactUsRouter.post('/contact_us', async (req, res) => {
    var data = req.body,
    datetime = dateFormat(new Date(), 'yyyy-mm-dd HH:MM:ss')
    var table_name = 'td_contact_us', 
    fields = data.id > 0 ? `f_name = "${data.f_name}", l_name = "${data.l_name}", email = "${data.email}", phone_no = "${data.phone}", c_name = "${data.c_name}", c_web = "${data.c_web}", modified_by = "${data.user}", modified_dt = ${datetime}` : 
    `(f_name, l_name, email, phone_no, c_name, c_web, created_by, created_dt)`, 
    values = `("${data.f_name}", "${data.l_name}", "${data.email}", "${data.phone_no}", "${data.c_name}", "${data.c_web}", "${data.user}", "${datetime}")`, 
    whr = data.id > 0 ? `id = ${data.id}` : '', 
    flag = data.id > 0 ? 1 : 0;
    var result = await db_Insert(table_name, fields, values, whr, flag)
    res.send(result)
})

contactUsRouter.get('/contact_us', async (req, res) => {
    var data = req.query
    var select = '*', 
    table_name = 'td_contact_us', 
    whr = data.id > 0 ? `id = ${data.id}` : '', 
    order = null;
    var result = await db_Select(select, table_name, whr, order)
    res.send(result)
})

module.exports = {contactUsRouter}