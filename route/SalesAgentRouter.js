const { db_Insert, db_Select } = require("../modules/MasterModule");
const { Check_Data } = require("../modules/MenuSetupModule");
const { sendUserEmail } = require("../modules/EmailModule");

const express = require("express"),
    SalesAgentRouter = express.Router(),
    dateFormat = require("dateformat"),
    bcrypt = require('bcrypt');

SalesAgentRouter.get('/sales_agent', async (req, res) => {
    var data = req.query
    // console.log(data);
    var select = "*",
        table_name = "md_sales_agent",
        whr = data.id > 0 ? `id = ${data.id}` : null,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt)
})

SalesAgentRouter.post('/sales_agent', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
        currDate = dateFormat(new Date(), "yyyy-mm-dd");
    var table_name = "md_sales_agent",
        fields =
            data.id > 0
                ? `agent_name = '${data.agent_name}', address = '${data.address}',
        phone_no = '${data.phone}', whatsapp_no = '${data.whatsapp}', 
        email = '${data.email}' ${data.start_date ? ', start_date ="' + data.start_date + '"' : ''}, 
        territory = '${data.territory}', frst_comm = '${data.frst_comm}', snd_comm = '${data.snd_comm}', comments = '${data.comments}'
        ${data.email_title ? ', email_title = "' + data.email_title + '"' : ''}${data.email_body ? ', email_body = "' + data.email_body + '"' : ''}
        , modified_by = '${data.user}', modified_dt = '${datetime}'`
                : `(agent_name, address, phone_no, whatsapp_no, email, start_date, territory, frst_comm, snd_comm, comments, email_title, email_body, email_send_dt, created_by, created_dt)`,
        values = `('${data.agent_name}', '${data.address}', '${data.phone}', '${data.whatsapp}',
        '${data.email}', '${data.start_date}', '${data.territory}', '${data.frst_comm}', '${data.snd_comm}', '${data.comments}', '${data.email_title}', '${data.email_body}', '${currDate}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    if (data.msg_flag) {
        var password = bcrypt.hashSync(data.pwd, 10);
        table_name = "td_users"
        fields = data.id > 0 ? `email_id = '${data.phone}', pwd = '${password}', modified_by = '${data.user}', modified_dt = '${datetime}'`
            : `(restaurant_id, email_id, pwd, active_flag, user_type)`
        values = `(0, '${data.phone}', '${password}', 'Y', 'S')`
        whr = data.id > 0 ? `id = ${data.id}` : null
        flag = data.id > 0 ? 1 : 0;
        let pwd_res_dt = await db_Insert(table_name, fields, values, whr, flag);
		
        if(pwd_res_dt.suc > 0){
            await sendUserEmail(data.email, data.email_body, data.email_title);
        }
    }
    res.send(res_dt);
})

const salesAgentUpdate = (data, img_path) => {
    return new Promise(async (resolve, reject) => {
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"),
            currDate = dateFormat(new Date(), "yyyy-mm-dd");
        var table_name = "md_sales_agent",
            fields =
                data.id > 0
                    ? `agent_name = '${data.agent_name}', address = '${data.address}',
            phone_no = '${data.phone}', whatsapp_no = '${data.whatsapp}', 
            email = '${data.email}' ${data.start_date ? ', start_date ="' + data.start_date + '"' : ''}, 
            territory = '${data.territory}', frst_comm = '${data.frst_comm}', snd_comm = '${data.snd_comm}', comments = '${data.comments}'
            ${data.email_title ? ', email_title = "' + data.email_title + '"' : ''}${data.email_body ? ', email_body = "' + data.email_body + '"' : ''}${img_path ? `, profile_img = '${img_path}'` : ''}
            , modified_by = '${data.user}', modified_dt = '${datetime}'`
                    : `(agent_name, address, phone_no, whatsapp_no, email, start_date, territory, frst_comm, snd_comm, comments, email_title, email_body, email_send_dt${img_path ? ', profile_img': ''}, created_by, created_dt)`,
            values = `('${data.agent_name}', '${data.address}', '${data.phone}', '${data.whatsapp}',
            '${data.email}', '${data.start_date}', '${data.territory}', '${data.frst_comm}', '${data.snd_comm}', '${data.comments}', '${data.email_title}', '${data.email_body}', '${currDate}'${img_path ? `, '${img_path}'` : ''}, '${data.user}', '${datetime}')`,
            whr = data.id > 0 ? `id = ${data.id}` : null,
            flag = data.id > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag);
        resolve(res_dt)
    })
}

SalesAgentRouter.post('/sales_login', async (req, res) => {
    var data = req.body, msg_dt;
    var select = 'b.*, a.pwd',
        table_name = `td_users a, ${data.user_type == 'S' ? 'md_sales_agent b' : 'md_sub_sales_agent b'}`,
        whr = `a.email_id=b.phone_no AND a.active_flag = 'Y' AND a.email_id = '${data.uname}' AND a.user_type = '${data.user_type}'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    // console.log(res_dt);
    if (res_dt.suc > 0 && res_dt.msg.length > 0) {
        if (await bcrypt.compare(data.psw, res_dt.msg[0].pwd)) {
            msg_dt = { suc: 1, msg: 'Success', user_dt: res_dt.msg[0] }
        } else {
            msg_dt = { suc: 0, msg: 'Please check your userID or password' }
        }
    } else {
        msg_dt = { suc: 0, msg: 'No user found' }
    }
	msg_dt['sql'] = res_dt.sql
    res.send(msg_dt)
})

SalesAgentRouter.post('/sub_sales_agent', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = "md_sub_sales_agent",
        fields =
            data.id > 0
                ? `agent_name = '${data.agent_name}', address = '${data.address}',
        phone_no = '${data.phone}', whatsapp_no = '${data.whatsapp}', 
        email = '${data.email}', start_date = '${data.start_date}', 
        territory = '${data.territory}', frst_comm = '${data.frst_comm}', snd_comm = '${data.snd_comm}', comments = '${data.comments}'
        ${data.email_title ? ', email_title = "' + data.email_title + '"' : ''}${data.email_body ? ', email_body = "' + data.email_body + '"' : ''}
        , modified_by = '${data.user}', modified_dt = '${datetime}'`
                : `(sales_id, agent_name, address, phone_no, whatsapp_no, email, start_date, territory, frst_comm, snd_comm, comments, email_title, email_body, created_by, created_dt)`,
        values = `('${data.sales_id}', '${data.agent_name}', '${data.address}', '${data.phone}', '${data.whatsapp}',
        '${data.email}', '${data.start_date}', '${data.territory}', '${data.frst_comm}', '${data.snd_comm}', '${data.comments}', '${data.email_title}', '${data.email_body}', '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag);
    if (data.msg_flag) {
        var password = bcrypt.hashSync(data.pwd, 10);
        table_name = "td_users"
        fields = data.id > 0 ? `email_id = '${data.phone}', pwd = '${password}', modified_by = '${data.user}', modified_dt = '${datetime}'`
            : `(restaurant_id, email_id, pwd, active_flag)`
        values = `(0, '${data.phone}', '${password}', 'Y')`
        whr = data.id > 0 ? `id = ${data.id}` : null
        flag = data.id > 0 ? 1 : 0;
        let pwd_res_dt = await db_Insert(table_name, fields, values, whr, flag);
		
		if(pwd_res_dt.suc > 0){
            await sendUserEmail(data.email, data.email_body, data.email_title);
        }
    }
    res.send(res_dt);
})

SalesAgentRouter.post('/sales_agent_update_pass', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var select = 'COUNT(*) chk_user, pwd',
    table_name = `td_users`,
    whr = `email_id = '${data.user_id}'`,
    order = null
    var chk_dt = await db_Select(select, table_name, whr, order)
    if(chk_dt.suc > 0 && chk_dt.msg[0].chk_user > 0){
        if (await bcrypt.compare(data.psw, chk_dt.msg[0].pwd)) {
            var password = bcrypt.hashSync(data.pwd, 10);

            var table_name = 'td_users', 
            fields = `pwd = '${password}', modified_by = '${data.user}', modified_dt = '${datetime}'`, 
            values = null, 
            whr = `email_id = '${data.user_id}'`, 
            flag = 1;
        
            var res_dt = await db_Insert(table_name, fields, values, whr, flag);
            res.send(res_dt)
        }else{
            res.send({suc:2, msg: 'Please enter your correct old password!!'})
        }
    }else{
        res.send({suc:0, msg: 'No data found'})
    }
})

SalesAgentRouter.get("/sub_sales_agent", async (req, res) => {
  var data = req.query;
  // console.log(data);
  var select = "*",
    table_name = "md_sub_sales_agent",
    whr = data.id > 0 ? `id = ${data.id}` : `sales_id=${data.sales_id}`,
    order = null;
  var res_dt = await db_Select(select, table_name, whr, order);
  res.send(res_dt);
});

module.exports = { SalesAgentRouter, salesAgentUpdate }