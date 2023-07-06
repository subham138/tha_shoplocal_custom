const express = require("express"),
    FlipBookRouter = express.Router(),
    dateFormat = require("dateformat"),
    bcrypt = require('bcrypt');
const { SendFlipDetailsUser } = require("../modules/EmailModule");
const { db_Insert, db_Select, db_Check } = require("../modules/MasterModule");

const FlipBookSave = (data, fileName) => {
    return new Promise(async (resolve, reject) => {
        var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        var chk_dt = await db_Select('id', 'td_flipbook', `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`, null);
        // console.log(chk_dt);
        var flip_id = 0, res_dt
        if (chk_dt.suc > 0 && chk_dt.msg.length == 0) {
            var last_dt = await db_Select('IF(MAX(id) > 0, MAX(id)+1, 1) last_id', 'td_flipbook', null, null);
            var table_name = 'td_flipbook',
                fields = '(hotel_id, guest_id, guest_name, room_no, check_in, check_out, flip_url, border_color, text_color, created_by, created_dt)',
                values = `(${data.hotel_id}, ${data.guest_id}, '${data.user_name}', ${data.room_no}, 
                '${dateFormat(data.check_in, "yyyy-mm-dd HH:MM:ss")}', '${dateFormat(data.check_out, "yyyy-mm-dd HH:MM:ss")}', 
                '${last_dt.suc > 0 && last_dt.msg.length > 0 ? data.flip_url.split('/')[0] + '/' + last_dt.msg[0].last_id : data.flip_url}', 
                '${data.border_color}', '${data.text_color}', '${data.user}', '${datetime}')`,
                whr = null,
                flag = 0;
            res_dt = await db_Insert(table_name, fields, values, whr, flag)
            flip_id = res_dt.suc > 0 ? res_dt.lastId.insertId : 0
        } else {
            flip_id = chk_dt.suc > 0 ? chk_dt.msg[0].id : 0
        }
        if (flip_id > 0) {
            var table_name = 'td_flipbook_img',
                fields = '(flip_id, img_catg, img_path, img_title, img_height, img_width, created_by, created_dt)',
                values = `(${flip_id}, '${data.flag}', '${fileName}', '${data.img_title}', '${data.img_height}', '${data.img_width}', '${data.user}', '${datetime}')`,
                whr = null,
                flag = 0;
            res_dt = await db_Insert(table_name, fields, values, whr, flag)
            resolve(res_dt)
        } else {
            resolve(res_dt)
        }
    })
}

FlipBookRouter.post('/flip_desc', async (req, res) => {
	var data = req.body,
		datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), res_dt;
	var chk_dt = await db_Select('id', 'td_flipbook', `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`, null);
	var flip_id = chk_dt.suc > 0 ? chk_dt.msg[0].id : 0
	if(flip_id > 0){
		var table_name = 'td_flipbook_caption',
			fields = '(flip_id, sl_no, flip_title, flip_body, created_by, created_dt)',
			values = `(${flip_id}, '${data.sl_no}', "${data.flip_title}", "${data.flip_body}", '${data.user}', '${datetime}')`,
			whr = null,
			flag = 0;
		res_dt = await db_Insert(table_name, fields, values, whr, flag)
	}else{
		res_dt = {suc:0, msg: 'No flipbook id found'}
	}
	res.send(res_dt)
})

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
		
		var select = 'flip_id, sl_no, flip_title, flip_body',
            table_name = 'td_flipbook_caption',
            whr = `flip_id = ${data.id}`,
            order = `ORDER BY sl_no`;
        var desc_dt = await db_Select(select, table_name, whr, order)
		res_dt.msg[0]['desc'] = desc_dt.msg
    }
    res.send(res_dt)
})

FlipBookRouter.post('/flip_approve1', async (req, res) => {
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

const FileApprove = (data, fileName) => {
	return new Promise(async (resolve, reject) => {
		var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), res_dt;
		if (data.id > 0) {
			var table_name = 'td_flipbook',
				fields = `approve_flag = '${data.flag}' ${fileName? ', flip_back_img = "'+ fileName + '"' : ''}, modified_by = '${data.user}', modified_dt = '${datetime}'`,
				values = null,
				whr = `id = ${data.id}`,
				flag = 1;
			res_dt = await db_Insert(table_name, fields, values, whr, flag)
		} else {
			res_dt = { suc: 0, msg: 'No ID Found' }
		}
		resolve(res_dt)
	})
}

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

FlipBookRouter.post('/flip_pay', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var table_name = 'td_flipbook',
            fields = `pay_amt = '${data.pay_amt}', no_of_pages = '${data.no_of_pages}', pay_flag = 'Y', addition_flag = 'Y', modified_by = '${data.user}', modified_dt = '${datetime}'`,
            values = null,
            whr = `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`,
            flag = 1;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    
    res.send(res_dt)
})

FlipBookRouter.get('/get_flip_url', async (req, res) => {
    var data = req.query
    var select = 'id, hotel_id, guest_id, guest_name, flip_url',
        table_name = 'td_flipbook',
        whr = `hotel_id = ${data.hotel_id} AND guest_id = '${data.guest_id}' AND room_no = '${data.room_no}'`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
    res.send(res_dt)
})

FlipBookRouter.post('/flip_send_user', async (req, res) => {
    var data = req.body,
		datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
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

    var select = 'a.id, a.hotel_id, a.guest_id, a.guest_name, a.room_no, a.flip_url, b.mobile_no, b.email_id',
        table_name = 'td_flipbook a, td_guest_user b',
        whr = `a.guest_id = b.id AND a.hotel_id = ${data.hotel_id} AND a.guest_id = '${data.guest_id}' AND a.room_no = '${data.room_no}'`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order)
	
	if(res_dt.suc > 0 && res_dt.msg.length > 0){
        res_dt = res_dt.msg[0]
        await SendFlipDetailsUser(res_dt.mobile_no, sum, res_dt.flip_url, res_dt.email_id, res_dt.guest_name)
        var select = 'count(id) chk_user',
            table_name = 'td_flipbook_user',
            whr = `a.hotel_id = ${data.hotel_id} AND a.user_id = '${res_dt.mobile_no}'`,
            order = null;
        var check = await db_Select(select, table_name, whr, order)
        var table_name = 'td_flipbook_user',
            fields = check.suc > 0 && check.msg[0].chk_user > 0 ? `guest_name = '${res_dt.guest_name}', 
            room_no = '${data.room_no}', flip_id = ${res_dt.id}, flip_url = '${res_dt.flip_url}', user_id = '${res_dt.mobile_no}',
            password = '${pwd}', modified_by = '${res_dt.guest_name}', modified_dt = '${datetime}'` : 
            '(hotel_id, guest_id, guest_name, room_no, flip_id, flip_url, user_id, password, created_by, created_dt)',
            values = `(${data.hotel_id}, '${data.guest_id}', '${res_dt.guest_name}', '${data.room_no}', 
            '${res_dt.id}', '${res_dt.flip_url}', '${res_dt.mobile_no}', '${pwd}', '${res_dt.guest_name}', '${datetime}')`,
            whr = `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`,
            flag = check.suc > 0 && check.msg[0].chk_user > 0 ? 1 : 0;
        var result = await db_Insert(table_name, fields, values, whr, flag)
        await SaveFlipToMessage(data.hotel_id, data.guest_id, res_dt.guest_name, res_dt.flip_url)
        res.send(result)
    }else{
        res.send({suc:0,msg:"No Data Found !! Email Not Send.."})
    }
})

const SaveFlipToMessage = (hotel_id, guest_id, guest_name, flip_url) => {
    return new Promise(async (resolve, reject) => {
		var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")
        var table_name = 'td_notification',
            fields = '(hotel_id, message_center_type, audience, language, img_path, msg_title, msg_subtitle, msg_body, time_period_msg, created_by, created_dt)',
            values = `(${hotel_id}, 'H', '${guest_id}', 'E', '1_H_msgImg_0.7156617380173327.jpg', 'FlipBook', 'Your FlipBook is ready to share.', 'To view your FlipBook please <a href="https://flipbook.shoplocal-lagunabeach.com/#/${flip_url}">Click Here</a>.', 'N', '${guest_name}', '${datetime}')`,
            whr = `hotel_id = ${data.hotel_id} AND guest_id = ${data.guest_id} AND room_no = ${data.room_no}`,
            flag = 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
}

module.exports = { FlipBookRouter, FlipBookSave, FileApprove }