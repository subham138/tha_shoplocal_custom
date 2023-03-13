const express = require('express'),
    FaqRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Insert, db_Select } = require('../modules/MasterModule');

FaqRouter.get('/faq', async (req, res) => {
    var data = req.query;
    var select = '*',
        table_name = 'td_faq',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id} ${data.flag ? 'AND faq_type="' + data.flag + '"' : ''}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

FaqRouter.post('/faq', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        table_name, fields, values, whr, flag, res_dt;

    for (let dt of data.faq_dt) {
        table_name = 'td_faq'
        fields = dt.id > 0 ? `quest = '${dt.qsn}', ans = '${dt.ans}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, faq_type, quest, ans, created_by, created_dt)`
        values = `('${data.hotel_id}', '${data.faq_type}', '${dt.qsn}', '${dt.ans}', '${data.user}', '${datetime}')`
        whr = dt.id > 0 ? `id = ${dt.id}` : null
        flag = dt.id > 0 ? 1 : 0

        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }

    res.send(res_dt)
})

FaqRouter.get('/tip', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_tip',
        whr = data.id > 0 ? `id = ${data.id}` : `hotel_id = ${data.hotel_id} ${data.flag ? 'AND faq_type="' + data.flag + '"' : ''}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

FaqRouter.post('/tip', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        table_name, fields, values, whr, flag, res_dt;

    for (let dt of data.tip_dt) {
        table_name = 'td_tip'
        fields = dt.id > 0 ? `tip_title = '${dt.tip_title}', tip_desc = '${dt.tip_desc}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, tip_title, tip_desc, created_by, created_dt)`
        values = `('${data.hotel_id}', '${dt.tip_title}', '${dt.tip_desc}', '${data.user}', '${datetime}')`
        whr = dt.id > 0 ? `id = ${dt.id}` : null
        flag = dt.id > 0 ? 1 : 0

        res_dt = await db_Insert(table_name, fields, values, whr, flag)
    }
    res.send(res_dt)
})

module.exports = { FaqRouter }