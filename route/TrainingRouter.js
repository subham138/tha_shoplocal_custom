const express = require("express");
const dateFormat = require("dateformat");
const { db_Select, db_Insert } = require("../modules/MasterModule");
const TrainingRouter = express.Router();

TrainingRouter.get('/training', async (req, res) => {
    var data = req.query
    var select = '*',
        table_name = 'td_training',
        whr = data.id ? `id=${data.id}` : `hotel_id= ${data.hotel_id}`,
        order = null;
    var res_dt = await db_Select(select, table_name, whr, order);
    res.send(res_dt)
})

TrainingRouter.post('/training', async (req, res) => {
    var data = req.body,
        datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var table_name = 'td_training',
        fields = data.id > 0 ? `training_dt_1 = '${data.tr_dt_1}', training_dt_2 = '${data.tr_dt_2}', training_dt_3 = '${data.tr_dt_3}'${data.shedule_dt ? ', shedule_dt="' + data.shedule_dt + '"' : ''}${data.accom_conf ? ', accom_conf = "' + data.accom_conf + '"' : ''}${data.ground_conf ? ', ground_conf = "' + data.ground_conf + '"' : ''}${data.appr_flag ? ', conf_approve_flag = "' + data.appr_flag + '"' : ''}${data.air_conf ? ', air_conf = "' + data.air_conf + '"' : ''}${data.comp_dt ? ', training_comp_dt = "' + data.comp_dt + '"' : ''}${data.note ? ', note = "' + data.note + '"' : ''}, modified_by = '${data.user}', modified_dt = '${datetime}'` :
            `(hotel_id, training_dt_1, training_dt_2, training_dt_3${data.shedule_dt ? ', shedule_dt' : ''}${data.accom_conf ? ', accom_conf' : ''}${data.ground_conf ? ', ground_conf' : ''}${data.appr_flag ? ', conf_approve_flag' : ''}${data.air_conf ? ', air_conf' : ''}${data.comp_dt ? ', training_comp_dt' : ''}${data.note ? ', note' : ''}, created_by, created_dt)`,
        values = `(${data.hotel_id}, '${data.tr_dt_1}', '${data.tr_dt_2}', '${data.tr_dt_3}'${data.shedule_dt ? ', "' + data.shedule_dt + '"' : ''}${data.accom_conf ? ', "' + data.accom_conf + '"' : ''}${data.ground_conf ? ', "' + data.ground_conf + '"' : ''}${data.appr_flag ? ', "' + data.appr_flag + '"' : ''}${data.air_conf ? ', "' + data.air_conf + '"' : ''}${data.comp_dt ? ', "' + data.comp_dt + '"' : ''}${data.note ? ', "' + data.note + '"' : ''}, '${data.user}', '${datetime}')`,
        whr = data.id > 0 ? `id = ${data.id}` : null,
        flag = data.id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flag)
    res.send(res_dt)
})

module.exports = {TrainingRouter}