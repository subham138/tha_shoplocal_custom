const express = require('express'),
    ReservationRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Select, db_Insert } = require('../modules/MasterModule');

ReservationRouter.get('/reserv_category', async (req, res) => {
    var data = req.query,
    select = '*', 
    table_name = 'md_reserv_category', 
    whr = data.id > 0 ? `id=${data.id}` : '', 
    order = null;
    var result = await db_Select(select, table_name, whr, order)
    res.send(result)
})

ReservationRouter.get('/reserv_setup', async (req, res) => {
    var data = req.query,
    select = '*', 
    table_name = 'td_reserv_setup', 
    whr = data.id > 0 ? `id=${data.id}` : '', 
    order = null;
    var result = await db_Select(select, table_name, whr, order)
    res.send(result)
})

ReservationRouter.post('/reserv', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = 'td_reserv_conf', 
        fields = data.id > 0 ? `f_name = "${data.f_name}", l_name = "${data.l_name}", email = "${data.email}", phone_no = "${data.phone}", c_name = "${data.c_name}", c_web = "${data.c_web}", modified_by = "${data.user}", modified_dt = ${datetime}` : 
        `(hotel_id, srv_res_flag, srv_res_id, reserv_date, reserv_time_slot, st_time, end_time, 
        no_of_pax, user_id, user_name, user_email, user_phone, occation, special_req, created_by, created_dt)`, 
        values = `("${data.hotel_id}", "${data.flag}", "${data.srv_res_id}", "${data.reserv_date}", 
        "${data.start}:00-${data.end}:00", "${data.start}:00", "${data.end}:00", "${data.seat}", "${data.user_id}", "${data.user_name}", "${data.user_email}", "${data.phone}", "${data.occation}", "${data.sp_req}", "${data.user}", "${datetime}")`, 
        whr = data.id > 0 ? `id = ${data.id}` : '', 
        flag = data.id > 0 ? 1 : 0;
    var result = await db_Insert(table_name, fields, values, whr, flag)
    res.send(result)
})

ReservationRouter.get('/reserv', async (req, res) => {
    var data = req.query,
        select = `*`,
        table_name = 'td_reserv_conf',
        whr = `hotel_id=${data.hotel_id} AND srv_res_flag='${data.flag}' AND srv_res_id=${data.srv_res_id}`,
        order = null
    var result = await db_Select(select, table_name, whr, order)
    res.send(result)
})

ReservationRouter.get('/reserv_avail_seat', async (req, res) => {
    var data = req.query,
        select = `a.hotel_id, a.srv_res_flag, a.srv_res_id, SUM(a.max_capacity) max_capacity, (SELECT SUM(b.no_of_pax) FROM td_reserv_conf b WHERE a.hotel_id=b.hotel_id AND a.srv_res_flag=b.srv_res_flag AND a.srv_res_id=b.srv_res_id AND b.reserv_date = DATE(now()) AND b.st_time >= ${data.start}) tot_pax`,
        table_name = 'td_reserv_setup a',
        whr = `hotel_id=${data.hotel_id} AND srv_res_flag='${data.flag}' AND srv_res_id=${data.srv_res_id} AND catg_id=${data.catg_id}`,
        order = `GROUP BY a.hotel_id, a.srv_res_flag, a.srv_res_id`
    var result = await db_Select(select, table_name, whr, order)
    res.send(result)
})

module.exports = {ReservationRouter}