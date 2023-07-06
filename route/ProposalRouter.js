const express = require('express'),
    proposalRouter = express.Router(),
    dateFormat = require('dateformat'),
    bcrypt = require('bcrypt');
const { sendPropEmail, RejectPayProposal, sendPropAcceptEmail, UserCredential } = require('../modules/EmailModule');
const { db_Select, db_Insert, db_Delete } = require('../modules/MasterModule');

proposalRouter.get('/proposal_cust', async (req, res) => {
    var hotel_id = req.query.hotel_id
    var select = '*',
        table_name = 'td_proposal',
        whr = `hotel_id = ${hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

proposalRouter.post('/proposal_cust', async (req, res) => {
    var data = req.body
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        currDt = dateFormat(new Date(), "yyyy-mm-dd");
    var table_name = 'td_proposal',
        fields = data.id > 0 ?
            `greeting = '${data.greeting}', dev_dtls = '${data.dev_dtls}' ${data.user_type != 'A' ? ', receive_dt = "' + currDt + '"' : ''}, modified_by = '${data.user}', modified_dt = '${datetime}'` :
            '(hotel_id, greeting, dev_dtls, created_by, created_dt)',
        values = `('${data.hotel_id}', '${data.greeting}', '${data.dev_dtls}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id} AND hotel_id = ${data.hotel_id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    var proposal_id = data.id > 0 ? data.id : res_dt.lastId.insertId
    if (res_dt.suc > 0) {
        await saveProDtls(data.fee_dtls, data.user, proposal_id)
    }
    res.send(res_dt)
})

const saveProDtls = (data, user, proposal_id) => {
    return new Promise(async (resolve, reject) => {
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
            res_dt, table_name, fields, values, whr, flag;
        for (let dt of data) {
            table_name = 'td_proposal_dtls'
            fields = dt.id > 0 ? `fee_type = '${dt.fee_type}', fee_amount = '${dt.fee_amount}', remarks = '${dt.notes}', additional_remarks = '${dt.additional_notes}', modified_by = '${user}', modified_dt = '${datetime}'` :
                '(proposal_id, fee_type, fee_amount, remarks, additional_remarks, created_by, created_dt)'
            values = `('${proposal_id}', '${dt.fee_type}', '${dt.fee_amount}', '${dt.notes}', '${dt.additional_notes}', '${user}', '${datetime}')`
            whr = dt.id > 0 ? `id = ${dt.id}` : null
            flag = dt.id > 0 ? 1 : 0
            res_dt = await db_Insert(table_name, fields, values, whr, flag)
            if (res_dt.suc == 0) break;
        }
        resolve(res_dt)
    })
}

proposalRouter.post('/send_proposal', async (req, res) => {
    var data = req.body
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        currDt = dateFormat(new Date(), "yyyy-mm-dd");
	var email_dt = await sendPropEmail(data.email, data.path, data.hotel_name)
    var table_name = 'td_proposal',
        fields = `send_dt = '${currDt}', status = 'P', modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = ${data.id} AND hotel_id = ${data.hotel_id}`,
        flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

proposalRouter.get('/proposal_dtls', async (req, res) => {
    var hotel_id = req.query.hotel_id, select, table_name, whr, order;
    select = '*'
    table_name = 'td_proposal'
    whr = `hotel_id = ${hotel_id}`
    order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    var prop_id = res_dt.suc > 0 ? (res_dt.msg.length > 0 ? res_dt.msg[0].id : 0) : 0
    if (prop_id > 0) {
        select = '*'
        table_name = 'td_proposal_dtls'
        whr = `proposal_id = ${prop_id}`
        order = null;
        var propDtls = await db_Select(select, table_name, whr, order)
        res_dt.msg[0]['propDtls'] = propDtls.suc > 0 ? propDtls.msg : []
    }
    res.send(res_dt)
})

proposalRouter.get('/proposal_dtls_del', async (req, res) => {
    var table_name = 'td_proposal_dtls', whr = `id = ${req.query.id}`;
    var res_dt = await db_Delete(table_name, whr)
    res.send(res_dt)
})

proposalRouter.post('/update_proposal', async (req, res) => {
    var data = req.body
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        currDt = dateFormat(new Date(), "yyyy-mm-dd");
    var table_name = 'td_proposal',
        fields = `status = '${data.status}', status_dt = '${currDt}', hotel_remarks = '${data.hotel_remarks}' ${data.user_type != 'U' ? ', admin_notes = "' + data.admin_notes + '"' : ''} ${data.status == 'D' ? ', decline_dt = "' + datetime + '"' : ''} ${data.user_type != 'A' ? ', receive_dt = "' + currDt + '"' : ''}, modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = ${data.id} AND hotel_id = ${data.hotel_id}`,
        flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
	if(data.status == 'D'){
        await RejectPayProposal(data.hotel_id, null, data.hotel_remarks)
    }else if(data.status == 'A'){
        await sendPropAcceptEmail(data.hotel_id)
    }
    res.send(res_dt)
})

proposalRouter.post('/pay_proposal', async (req, res) => {
    var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
    currDt = dateFormat(new Date(), "yyyy-mm-dd");

    var table_name = 'td_contacts_custom',
        fields = `approval_flag = 'Y', proposal_status = 'C', proposal_amt = '${data.amt}', first_pay = '${currDt}', pay_flag = 'Y', modified_by = '${data.user}', modified_dt = '${datetime}'`,
        values = null,
        whr = `id = ${data.hotel_id}`,
        flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    saveUserProp(data.hotel_id)
    res.send(res_dt)
})

const saveUserProp = async (hotel_id) => {
    var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    var a = alpha[Math.floor(Math.random() * 62)];
    var b = alpha[Math.floor(Math.random() * 62)];
    var c = alpha[Math.floor(Math.random() * 62)];
    var d = alpha[Math.floor(Math.random() * 62)];
    var e = alpha[Math.floor(Math.random() * 62)];
    var sum = a + b + c + d + e;
    var pwd = bcrypt.hashSync(sum, 10);
    var dt = '';
    return new Promise(async (resolve, reject) => {
        var select = 'id, restaurant_name, email',
        table_name = 'td_contacts_custom',
        whr = `id = ${hotel_id}`,
        order = null;
        var res_dt = await db_Select(select, table_name, whr, order)
        if(res_dt.suc > 0 && res_dt.msg.length > 0){
            var table_name = 'td_users',
            fields = `(restaurant_id, email_id, pwd, active_flag, user_type)`,
            values = `("${hotel_id}", "${res_dt.msg[0].email}", "${pwd}", "Y", "H")`,
            whr = `id = ${data.hotel_id}`,
            flag = 0;
            var result = await db_Insert(table_name, fields, values, whr, flag)
            UserCredential(hotel_id, sum)
            resolve(result)
        }else{
            resolve({suc:0, msg:res_dt.msg})
        }
        
    })
}

module.exports = { proposalRouter }