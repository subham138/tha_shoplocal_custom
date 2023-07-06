const express = require('express');
const { CheckData } = require('../modules/AdminModule');
const { Login, UpdateUser, UpdatePassword } = require('../modules/LoginModule');
const { F_Select } = require('../modules/MenuSetupModule');
const LogRouter = express.Router();

LogRouter.post('/login', async (req, res) => {
    var data = await Login(req.body);
    res.send(data);
})

LogRouter.get('/forgot_password', async (req, res) => {
    var data = '';
    var sql = `SELECT * FROM td_users WHERE email_id = "${req.query.Email}"`;
    var dt = await F_Select(sql);
    if (dt.msg.length > 0) {
        data = { suc: 1, msg: "Email Already Exist" };
    } else {
        data = { suc: 2, msg: "Fresh Email" };
    }
    res.send(data);
    // console.log(dt.msg.length);
})

LogRouter.get('/check_activity', async (req, res) => {
    let res_id = req.query.id;
    var sql = `SELECT status as approval_flag FROM td_proposal WHERE hotel_id = ${res_id}`;
    var data = await F_Select(sql);
    // console.log(data);
    res.send(data);
})

LogRouter.get('/check_menu_setup', async (req, res) => {
    let res_id = req.query.id;
    var sql = `SELECT restaurant_name, contact_name FROM td_contacts_custom
            WHERE id = "${res_id}"`;
    var data = await F_Select(sql);
    res.send(data);
})

LogRouter.get('/check_active_status', async (req, res) => {
    var res_id = req.query.id;
    // let sql = `SELECT * FROM md_url_custom WHERE restaurant_id = ${res_id}`;
    // let sql = `SELECT id, restaurant_id, package_name, no_of_menu, special_menu, menu_approval_flag as approval_flag FROM td_order_items_custom WHERE restaurant_id = ${res_id}`;
	let sql = `SELECT id, contact_date, restaurant_name, account_type, active_user, approval_flag, proposal_status, setup_mode, pay_flag, first_pay initial_pay, final_pay FROM td_contacts_custom WHERE id = ${res_id}`;
    var data = await F_Select(sql);
    res.send(data);
})

LogRouter.post('/update_user', async (req, res) => {
    var data = req.body;
    var dt = await UpdateUser(data);
    res.send(dt);
})

LogRouter.post('/update_password', async (req, res) => {
    var data = req.body;
    var dt = await UpdatePassword(data);
    res.send(dt);
})

module.exports = { LogRouter };