const express = require('express'),
    DirectoryRouter = express.Router(),
    dateFormat = require("dateformat");
const { db_Insert, db_Select, db_Delete } = require('../modules/MasterModule');

const saveDirData = async (data) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")
    var select = 'id, hotel_id',
        table_name = 'td_directory_setup',
        whr = `hotel_id = ${data.hotel_id}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    var id = res_dt.suc > 0 && res_dt.msg.length > 0 ? res_dt.msg[0].id : 0

    return new Promise(async (resolve, reject) => {
        var table_name = 'td_directory_setup',
        fields = id > 0 ? `bg_col = '${data.bg_col}', txt_col = '${data.txt_col}', bord_col = '${data.bord_col}', 
        expansion_col = '${data.expansion_col}', font_family = '${data.font_family}', 
        header_size = '${data.header_size}', bord_thickness = '${data.bord_thickness}', 
        other_size = '${data.other_size}', div_img='${data.div_img}', msg_btn_col = '${data.msg_btn_col}', inner_border_col = '${data.inner_border_col}', wifi_pass = '${data.wifi_pass}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, bg_col, txt_col, bord_col, expansion_col, font_family, header_size, subheader_size, 
                bord_thickness, other_size, div_img, msg_btn_col, inner_border_col, wifi_pass, created_by, created_dt)`,
        values = `('${data.hotel_id}', '${data.bg_col}', '${data.txt_col}', '${data.bord_col}', '${data.expansion_col}', 
        '${data.font_family}', '${data.header_size}', '${data.subheader_size}', '${data.bord_thickness}', 
        '${data.other_size}', '${data.div_img}', '${data.msg_btn_col}', '${data.inner_border_col}', '${data.wifi_pass}', '${data.user}', '${datetime}')`,
        whr = id > 0 ? `id = ${id}` : null,
        flag = id > 0 ? 1 : 0;
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
}

const dirImageSave = async (hotel_id, data) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss")
    var select = 'id, hotel_id',
        table_name = 'td_directory_setup_img',
        whr = `hotel_id = ${hotel_id} AND section = '${data.tag}'`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    var id = res_dt.suc > 0 && res_dt.msg.length > 0 ? res_dt.msg[0].id : 0

    return new Promise(async (resolve, reject) => {
        var table_name = 'td_directory_setup_img',
        fields = id > 0 ? `section = '${data.tag}', img_path = '${data.img_path}', modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, section, img_path, created_by, created_dt)`,
        values = `('${hotel_id}', '${data.tag}', '${data.img_path}', '${data.user}', '${datetime}')`,
        whr = id > 0 ? `id = ${id}` : null,
        flag = id > 0 ? 1 : 0;
        res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
}

DirectoryRouter.get('/dir_setup', async (req, res) => {
    var data = req.query
    var select = 'id, hotel_id, bg_col, txt_col, bord_col, expansion_col, font_family, header_size, subheader_size, bord_thickness, other_size, div_img, msg_btn_col, inner_border_col, wifi_pass',
        table_name = 'td_directory_setup',
        whr = `hotel_id = ${data.hotel_id}`,
        order = null
    var res_dt = await db_Select(select, table_name, whr, order)
    if(res_dt.suc > 0 && res_dt.msg.length > 0){
        var select = 'id, hotel_id, section, img_path',
            table_name = 'td_directory_setup_img',
            whr = `hotel_id = ${data.hotel_id}`,
            order = null
        var res_img_dt = await db_Select(select, table_name, whr, order)
        if(res_img_dt.suc > 0 && res_img_dt.msg.length > 0){
            for(let dt of res_img_dt.msg){
                res_dt.msg[0][dt.section] = dt.img_path
            }
            console.log(res_dt);
        }
    }
    res.send(res_dt)
})

module.exports = {DirectoryRouter, saveDirData, dirImageSave}