const express = require('express')
const upload = require('express-fileupload')
const fs = require('fs');
const { MenuImageSave, SectionImageSave, OtherImageSave, MonthDateSave, LogoSave, SectionSave, F_Select } = require('../modules/MenuSetupModule');
const TestRouter = express.Router();
const db = require('../core/db');
const { SaveSpecialMenuImg, SpecialMonthDateSave } = require('../modules/SpecialModule');
const { InsertCalender } = require('../modules/CalenderModule');
const { DifImgSave, DifCovImgSave } = require('../modules/AdminModule');
const { save_message } = require('./MessageCenterRouter');
const { saveAvatar, saveVoice } = require('./ConciergeRouter');
const { db_Check, db_Insert, db_Select } = require('../modules/MasterModule');
const { FlipBookSave, FileApprove } = require("./FlipBookRouter");
const { CalendarSaveData } = require("./CalenderRouter");
const { funDirectorySaveData, SaveFunDirMenuImgDt, SaveFunDirSecMenu, FunDirCalendarSaveData, SaveResDirMenuSec } = require("./FunDirectoryRouter");
const { saveDirData, dirImageSave } = require("./DirectoryRouter");
const { SaveRaiseSupportLog } = require('./SupportLogRouter');
const dateFormat = require("dateformat");

TestRouter.use(upload());

//var dir = 'public';
//var subDir = "public/uploads";

//if (!fs.existsSync(dir)) {
//    fs.mkdirSync(dir);

//    fs.mkdirSync(subDir);
//}

// TestRouter.post('/testing', async (req, res) => {
//     // console.log({ bd: req.body });
//     var cov_file_name = '',
//         top_img_name = '';
//     if (req.files.cov_img) {
//         cov_file_name = req.body.restaurant_id + '_' + req.body.menu_id + '_cover_' + req.files.cov_img.name;
//         req.files.cov_img.mv('uploads/' + cov_file_name, async (err) => {
//             if (err) {
//                 console.log(err);
//             } else {
//                 console.log('Other Image Top Uploaded');
//             }
//         })
//     }
//     if (req.files.top_img) {
//         top_img_name = req.body.restaurant_id + '_' + req.body.menu_id + '_top_' + req.files.top_img.name;
//         req.files.top_img.mv('uploads/' + top_img_name, async (err) => {
//             if (err) {
//                 console.log(err);
//             } else {
//                 console.log('Other Image Top Uploaded');
//             }
//         })
//     }

//     var dt = await MenuImageSave(req.body, cov_file_name, top_img_name);
//     var upload_menu = await UploadMenu(req.files.menu_img, req.body);
//     var upload_sec = await UploadSection(req.files.section_img, req.body);
//     res.send({ suc: 1, msg: 'Success' });
// })

TestRouter.post('/testing', async (req, res) => {
    console.log({ bd: req.body, file: req.files, req: req });
    // console.log(req.body.cov_img);
    var cov_file_name = '',
        top_img_name = '',
        data = req.body;
    var cov_file = req.files ? (req.files.cov_img ? req.files.cov_img : null) : null;
    var top_file = req.files ? (req.files.top_img ? req.files.top_img : null) : null;
    if (cov_file) {
        var cov_file_name = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_cover_' + cov_file.name;

        cov_file.mv('uploads/' + cov_file_name, async (err) => {
            if (err) {
                console.log(`${cov_file_name} not uploaded`);
            } else {
                console.log(`Successfully ${cov_file_name} uploaded`);
                // await SectionImageSave(data, filename);
            }
        })
    }
    if (top_file) {
        var top_img_name = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_top_' + top_file.name;

        top_file.mv('uploads/' + top_img_name, async (err) => {
            if (err) {
                console.log(`${top_img_name} not uploaded`);
            } else {
                console.log(`Successfully ${top_img_name} uploaded`);
                // await SectionImageSave(data, filename);
            }
        })
    }

    var dt = await MenuImageSave(req.body, cov_file_name, top_img_name);
    // var upload_menu = await UploadMenu(req.files ? (req.files.menu_img ? req.files.menu_img : null) : null, req.body);
    // var upload_sec = await UploadSection(req.files ? (req.files.section_img ? req.files.section_img : null) : null, req.body);
    res.send({ suc: 1, msg: 'Success' });
})

TestRouter.post('/menu_file_testing', async (req, res) => {
    console.log({menu_dt: req.body, menu_file: req.files});
    var menu_img = req.files ? (req.files.menu_img ? req.files.menu_img : null) : null;
    var upload_menu = await UploadMenu(menu_img, req.body)
    res.send({ suc: 1, msg: "Menu Uploaded" });
})

TestRouter.post('/sec_file_testing', async (req, res) => {
    var sec_img = req.files ? (req.files.section_img ? req.files.section_img : null) : null;
    var upload_sec = await UploadSection(sec_img, req.body);
    res.send({ suc: 1, msg: "Section Uploaded" });
})

const UploadSection = async (sec_img, data) => {
    var file_path = '';
    if (sec_img) {
        // console.log();
        var sec_file = sec_img,
            ResIdPath = "uploads/";

        if (Array.isArray(sec_img)) {
            console.log(sec_file.length);
            file_path = new Array();
            for (let i = 1; i <= sec_file.length; i++) {
                var filename = '';
                var file = sec_file[i - 1];
                filename = data.restaurant_id + '_' + data.menu_id + '_section_' + i + '_' + file.name;
                file_path.push({ i, filename });

                file.mv('uploads/' + filename, async (err) => {
                    if (err) {
                        console.log(`${filename} not uploaded`);
                    } else {
                        console.log(`Successfully ${filename} uploaded`);
                    }
                })
            }
            await SectionImageSave(data, file_path);
        } else {
            var filename = data.restaurant_id + '_' + data.menu_id + '_section_' + sec_file.name;

            sec_file.mv('uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    await SectionImageSave(data, filename);
                }
            })
        }
    } else {
        if (data.SectionUrl != '') {
            await SectionImageSave(data, file_path);
        }
    }
}

const UploadMenu = async (menu_img, data) => {
    var file_path = '';
    if (menu_img) {
        var sec_file = menu_img,
            ResIdPath = "uploads/";

        if (Array.isArray(sec_file)) {
            console.log(sec_file.length);
            let j = 0;
            file_path = new Array();
            for (let i = 1; i <= sec_file.length; i++) {
                var filename = '';
                var file = sec_file[i - 1];
                filename = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_menu_' + i + '_' + file.name;
                file_path.push({ i, filename });

                file.mv('uploads/' + filename, async (err) => {
                    if (err) {
                        console.log(`${filename} not uploaded`);
                    } else {
                        console.log(`Successfully ${filename} uploaded`);
                    }
                })
            }
            await OtherImageSave(data, file_path);
            // console.log(Array.isArray(file_path));
        } else {
            // console.log({ else: Array.isArray(file_path) });
            var filename = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_menu_' + sec_file.name;

            sec_file.mv('uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    await OtherImageSave(data, filename);
                }
            })
        }

    } else {
        // console.log("Null File Selected");
        if (data.MenuUrl != '') {
            await OtherImageSave(data, file_path)
        }
    }
}

TestRouter.post('/logo', async (req, res) => {
    console.log({ body: req.body, fl: req.files});
    // let res_name = req.body.restaurant_name.replace(' ', '_');
    // var data = await UploadLogo(req.files.logo_img, res_name, req.body);
    var files = req.files ? (req.files.logo_img ? req.files.logo_img : null) : null;
    var data = await UploadLogo(files, req.body);
    // console.log({logo_img: req.body.logo_img, body: req.body, req});
    res.send(data);
})

const UploadLogo = async (logo_img, data) => {
    var dt = '',
        file_path = '',
        res = '';
    if (logo_img) {
        var buffer = logo_img;
        // var dt = buffer.split(';');
        // var ext = dt[0].split('/')[1];
        var file = logo_img;
        var filename = data.hotel_id + '_' + data.venue_id + '_logo_' + file.name;

        // BASE64 FILE UPLOAD //
        // var filename = data.restaurant_id + '_' + data.venue_id + '_logo_' + data.filename;

        // console.log(filename);
        // var buffer_dt = buffer.replace(/^data:image\/png;base64,/, "");
        // buffer_dt += buffer_dt.replace('+', ' ');
        // let binaer_dt = new Buffer(buffer_dt, 'base64').toString('binary');
        // fs.writeFile("uploads/" + filename, binaer_dt, "binary", async (err) => {
        //     if (err) console.log(err); // writes out file without error, but it's not a valid image
        //     else {
        //         await LogoSave(data, filename);
        //     }
        // });
        // END //
        return new Promise((resolve, reject) => {
            file.mv("uploads/" + filename, async (err) => {
                if (err) {
                    console.log(err);
                    res = {suc:0, msg:"Error"};
                } else {
                    console.log('Logo Uploaded ' + filename);
                    res = await LogoSave(data, filename);
                }
                resolve(res);
            })
        })
    } else {
        return new Promise(async (resolve, reject) => {
            res = await LogoSave(data, file_path);
            resolve(res);
        })
        
    }
}

TestRouter.post('/cover_save', async (req, res) => {
    var img_type = 'cover';
    var files = req.files ? (req.files.cov_img ? req.files.cov_img : null) : null;
    // console.log({files: req.files, body: req.body});
    var dt = await CoverImgUpload(files, img_type, req.body);
    res.send(dt);
})

const CoverImgUpload = async (files, img_type, data) => {
    var filename = '',
        res = '';
    if (files) {
        filename = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_' + img_type + '_' + files.name;

        return new Promise(async (resolve, reject) => {
            files.mv('uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                    res = { suc: 0, msg: "err" };
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    res = await saveOtherImage(data, "C", filename);
                    // res = await UpdateOtherImg(`cover_page_url = "${data.cov_url}", cover_page_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image_custom');
                }
                resolve(res);
            })
        })
    } else {
        return new Promise(async (resolve, reject) => {
            res = await saveOtherImage(data, "C", null);
            // res = await UpdateOtherImg(`cover_page_url = "${data.cov_url}", cover_page_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image_custom');
            resolve(res);
        })
    }
}

TestRouter.post('/top_save', async (req, res) => {
    // console.log({files: req.files, body: req.body});
    var img_type = 'top';
    var files = req.files ? (req.files.top_img ? req.files.top_img : null) : null;
    var dt = await TopImgUpload(files, img_type, req.body);
    res.send(dt);
})

const TopImgUpload = async (files, img_type, data) => {
    var filename = '',
        res = '';
    if (files) {
        var filename = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_' + data.menu_id + '_' + img_type + '_' + files.name;
        return new Promise(async (resolve, reject) => {
            files.mv('uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                    res = { suc: 0, msg: "err" };
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    res = await saveOtherImage(data, 'T', filename)
                    // res = await UpdateOtherImg(`top_img_url = "${data.top_url}", top_image_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image_custom');
                }
                resolve(res);
            })
        })

        // BASE64 FILE UPLOAD //
        // var buffer = files;
        // // var dt = buffer.split(';');
        // // var ext = dt[0].split('/')[1];
        // var filename = data.restaurant_id + '_' + data.menu_id + '_' + img_type + '_' + data.filename;

        // // console.log(ext);
        // var buffer_dt = buffer.replace(/^data:image\/png;base64,/, "");
        // buffer_dt += buffer_dt.replace('+', ' ');
        // let binaer_dt = new Buffer(buffer_dt, 'base64').toString('binary');
        // return new Promise(async (resolve, reject) => {
        //     fs.writeFile("uploads/" + filename, binaer_dt, "binary", async (err) => {
        //         if (err) { console.log(err); res = { suc: 0, msg: "err" }; } // writes out file without error, but it's not a valid image
        //         else {
        //             res = await UpdateOtherImg(`top_img_url = "${data.top_url}", top_image_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image_custom');
        //         }
        //         resolve(res);
        //     });
        // })
    } else {
        return new Promise(async (resolve, reject) => {
            res = await saveOtherImage(data, "T", null);
            // res = await UpdateOtherImg(`top_img_url = "${data.top_url}", top_image_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image_custom');
            resolve(res);
        })
    }
}

const saveOtherImage = (data, flag, img_path) => {
  return new Promise(async (resolve, reject) => {
    var datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var select = "COUNT(*) count_dt",
      table_name = "td_other_image",
      whr = `hotel_id = ${data.hotel_id} AND srv_res_flag= "${data.srv_res_flag}" AND srv_res_id = "${data.srv_res_id}" AND menu_id = "${data.menu_id}"`,
      order = null;
    var chk_dt = await db_Select(select, table_name, whr, order);
    var id = chk_dt.suc > 0 ? (chk_dt.msg[0].count_dt > 0 ? 1 : 0) : 0;
    var table_name = "td_other_image",
      fields =
        id > 0
          ? flag == "C"
            ? `${img_path ? "cover_page_img = '" + img_path + "', " : ''} cover_page_url = "${data.url}", modified_by = "${data.user}", modified_dt = "${datetime}"`
            : `${img_path ? "top_image_img = '" + img_path + "', " : ''} top_img_url = "${data.url}", modified_by = "${data.user}", modified_dt = "${datetime}"`
          : flag == "C"
          ? `(hotel_id, srv_res_flag, srv_res_id, menu_id, active_flag${img_path ? ', cover_page_img' : ''}, cover_page_url, created_by, created_dt)`
          : `(hotel_id, srv_res_flag, srv_res_id, menu_id, active_flag${img_path ? ', top_image_img' : ''}, top_img_url, created_by, created_dt)`,
      values = `("${data.hotel_id}", "${data.srv_res_flag}", "${data.srv_res_id}", "${data.menu_id}", "Y" ${img_path ? ", '"+ img_path +"'" : ''}, "${data.url}", "${data.user}", "${datetime}")`,
      whr =
        id > 0
          ? `hotel_id = ${data.hotel_id} AND srv_res_flag= "${data.srv_res_flag}" AND srv_res_id = "${data.srv_res_id}" AND menu_id = "${data.menu_id}"`
          : null,
      flagInt = id > 0 ? 1 : 0;
    var res_dt = await db_Insert(table_name, fields, values, whr, flagInt);
    resolve(res_dt);
  });
};

const UpdateOtherImg = (fields, whr, table_name) => {
    var sql = `UPDATE ${table_name} SET ${fields} WHERE ${whr}`;
    var res = '';
    console.log(sql);
    return new Promise((resolve, reject) => {
        db.query(sql, (err, lastId) => {
            if (err) {
                console.log(err);
                res = { suc: 0, msg: 'Not Updated' };
            } else {
                res = { suc: 1, msg: 'Updated Successfully' };
            }
            resolve(res)
        })
    })
}

TestRouter.post('/section', async (req, res) => {
    // console.log(req.files);
    var sec_name = req.body.sec_name.replace(' ', '_');
    var img_type = 'section' + sec_name;
    console.log({files: req.files, body: req.body});
    var files = req.files ? (req.files.sec_img ? req.files.sec_img : null) : null;
    // var dt = await UploadSectionImg(req.body.sec_img, img_type, req.body);
    var dt = await UploadSectionImg(files, img_type, req.body);
    res.send(dt);
})

const UploadSectionImg = (files, img_type, data) => {
    var filename = '',
        res = '';
        // console.log({sec_len: files.length});
    if (files) {
        filename = data.hotel_id + '_' + data.srv_res_id + '_' + data.menu_id + '_' + img_type + '_' + data.filename;
        return new Promise(async (resolve, reject) => {
            files.mv('uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                    res = { suc: 0, msg: "err" };
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    res = await SectionSave(data, filename);
                }
            resolve(res);
            })
        })

        // BASE64 FILE UPLOAD //
        // var buffer = files;
        // // var dt = buffer.split(';');
        // // var ext = dt[0].split('/')[1];
        // var filename = data.restaurant_id + '_' + data.venue_id + '_' + data.menu_id + '_' + img_type + '_' + data.filename;

        // // console.log(ext);
        // var buffer_dt = buffer.replace(/^data:image\/png;base64,/, "");
        // buffer_dt += buffer_dt.replace('+', ' ');
        // let binaer_dt = new Buffer(buffer_dt, 'base64').toString('binary');
        // return new Promise(async (resolve, reject) => {
        //     fs.writeFile("uploads/" + filename, binaer_dt, "binary", async (err) => {
        //         if (err) { console.log(err); res = { suc: 0, msg: "err" }; } // writes out file without error, but it's not a valid image
        //         else {

        //             res = await SectionSave(data, filename);
        //         }
        //         resolve(res);
        //     });
        // })
    } else {
        return new Promise(async (resolve, reject) => {
            res = await SectionSave(data, filename);
            resolve(res);
        })
    }
}

TestRouter.get('/del_menu', (req, res) => {
    var sql = `DELETE FROM td_menu_image_custom WHERE restaurant_id = ${req.query.res_id} AND id = ${req.query.id}`;
    db.query(sql, (err, lastId) => {
        if (err) {
            console.log(err);
            res.send({ suc: 0, msg: JSON.stringify(err) });
        } else {
            res.send({ suc: 1, msg: "Deleted" });
        }
    })
})

TestRouter.get('/del_sec', (req, res) => {
    var sql = `DELETE FROM td_section_image_request WHERE restaurant_id = ${req.query.res_id} AND id = ${req.query.id}`;
    db.query(sql, (err, lastId) => {
        if (err) {
            console.log(err);
            res.send({ suc: 0, msg: JSON.stringify(err) });
        } else {
            res.send({ suc: 1, msg: "Deleted" });
        }
    })
})

TestRouter.post('/special_save', async (req, res) => {
    var upload_special_menu = await UploadSpecialMenu(req.files ? (req.files.special_img ? req.files.special_img : null) : null, req.body);
    // console.log(req.body);
    // var data = await SpecialMonthDateSave(res.body);
    res.send({ suc: 1, msg: "Success" });
})

const UploadSpecialMenu = async (menu_img, data) => {
    var file_path = '';
    if (menu_img) {
        var sec_file = menu_img,
            ResIdPath = "uploads/";

        if (Array.isArray(sec_file)) {
            console.log(sec_file.length);
            let j = 0;
            file_path = new Array();
            for (let i = 1; i <= sec_file.length; i++) {
                var filename = '';
                var file = sec_file[i - 1];
                filename = data.restaurant_id + '_' + data.menu_id + '_special_menu_' + i + '_' + file.name;
                file_path.push({ i, filename });

                file.mv('uploads/' + filename, async (err) => {
                    if (err) {
                        console.log(`${filename} not uploaded`);
                    } else {
                        console.log(`Successfully ${filename} uploaded`);
                    }
                })
            }
            await SaveSpecialMenuImg(data, file_path);
            // console.log(Array.isArray(file_path));
        } else {
            // console.log({ else: Array.isArray(file_path) });
            var filename = data.restaurant_id + '_' + data.menu_id + '_special_menu_' + sec_file.name;

            sec_file.mv('Uploads/' + filename, async (err) => {
                if (err) {
                    console.log(`${filename} not uploaded`);
                } else {
                    console.log(`Successfully ${filename} uploaded`);
                    await SaveSpecialMenuImg(data, filename);
                }
            })
        }

    } else {
        // console.log("Null File Selected");
        await SaveSpecialMenuImg(data, file_path)
    }
}

TestRouter.post('/calender_dtls', async (req, res) => {
    var data = req.body,
        filename = '',
        response = '';
    var img = req.files ? (req.files.img ? req.files.img : null) : null;
    if (img) {
        filename = data.res_id + '_calender_' + img.name;

        img.mv('uploads/' + filename, async (err) => {
            if (err) {
                console.log(`${filename} not uploaded`);
            } else {
                console.log(`Successfully ${filename} uploaded`);
                if (await InsertCalender(data, filename)) {
                    response = { suc: 1, msg: 'Successfully Inserted !!' };
                } else {
                    response = { suc: 0, msg: 'Not Inserted !!' }
                }
                // await SaveSpecialMenuImg(data, filename);
            }
            res.send(response);
        })
    } else {
        if (await InsertCalender(data, filename)) {
            response = { suc: 1, msg: 'Successfully Inserted !!' };
        } else {
            response = { suc: 0, msg: 'Not Inserted !!' }
        }
        res.send(response);
    }
    
})

TestRouter.post('/dif_img_save', async (req, res) => {
    var img_type = 'dif';
    console.log({dif: img_type});
    var dt = await difImgSave(req.body.dif_img, img_type, req.body);
    res.send(dt);
})

const difImgSave = async (files, img_type, data) => {
    var filename = '',
        res = '';
    if (files) {
        // var filename = data.restaurant_id + '_' + data.menu_id + '_' + img_type + '_' + files.name;
        // return new Promise(async (resolve, reject) => {
        //     files.mv('uploads/' + filename, async (err) => {
        //         if (err) {
        //             console.log(`${filename} not uploaded`);
        //         } else {
        //             console.log(`Successfully ${filename} uploaded`);
        //             dt = await UpdateOtherImg(`top_img_url = "${data.top_url}", top_image_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image');
        //             resolve(dt);
        //         }
        //     })
        // })
        var buffer = files;
        // var dt = buffer.split(';');
        // var ext = dt[0].split('/')[1];
        filename = img_type + '_' + data.filename;

        // console.log(ext);
        var buffer_dt = buffer.replace(/^data:image\/png;base64,/, "");
        buffer_dt += buffer_dt.replace('+', ' ');
        let binaer_dt = new Buffer(buffer_dt, 'base64').toString('binary');
        return new Promise(async (resolve, reject) => {
            fs.writeFile("uploads/" + filename, binaer_dt, "binary", async (err) => {
                if (err) { console.log(err); res = { suc: 0, msg: "err" }; } // writes out file without error, but it's not a valid image
                else {
                    res = await DifImgSave(filename, data.user);
                }
                resolve(res);
            });
        })
    } else {
        return new Promise(async (resolve, reject) => {
            res = { suc: 0, msg: "No File Selected !!" };
            resolve(res);
        })
    }
}

TestRouter.post('/save_other_qr', async (req, res) => {
    var data = req.body;
    var flag = data.flag,
        res_id = data.res_id,
        venue_id = data.venue_id,
        menu_url = data.menu_url,
        bitly = data.bitly,
        field_name = flag == 0 ? "dynamic_img" : (flag == 1 ? "v_card_img" : "fun_directory_img"),
        pre_name = flag == 0 ? "dynamic_qr" : (flag == 1 ? "v_card_qr" : "fun_directory_qr"),
        img = req.files ? (req.files.img ? req.files.img : false) : false,
        response = '';

    // console.log({data, img});

    // switch(flag){
    //     case 0:
    //         field_name = 'dynamic_img';
    //         pre_name = 'dynamic_qr';
    //         // response = await UploadOtherQr(res_id, pre_name, field_name, img);
    //         // res.send(response);
    //         break;
    //     case 1:
    //         field_name = 'v_card_img';
    //         pre_name = 'v_card_qr';
    //         // response = await UploadOtherQr(res_id, pre_name, field_name, img);
    //         // res.send(response);
    //         break;
    //     case 2:
    //         field_name = 'fun_directory_img';
    //         pre_name = 'fun_directory_qr';
    //         break;
    // }
    response = await UploadOtherQr(res_id, pre_name, field_name, img, venue_id, menu_url, bitly, data);
    res.send(response);
})

const UploadOtherQr = (res_id, pre_name, field_name, img, venue_id, menu_url, bitly, data) => {
    var res = '',
        img_name = '';
    if (img) {
        img_name = res_id + '_' + venue_id + '_' + pre_name + '_' + img.name;
        console.log({ img_name });
        return new Promise((resolve, reject) => {
            img.mv('uploads/' + img_name, async (err) => {
                if (err) {
                    console.log(`${img_name} not uploaded`);
                    res = { suc: 0, msg: 'File Not Uploaded' }
                } else {
                    console.log(`Successfully ${img_name} uploaded`);
                    res = await SaveOtherQr(img_name, res_id, field_name, venue_id, menu_url, bitly, data);
                    // await SectionImageSave(data, filename);
                }
                resolve(res);
            })
        })
    } else {
        return new Promise((resolve, reject) => {
            res = { suc: 0, msg: 'File was empty' };
            resolve(res);
        })
    }
}

const SaveOtherQr = (filename, res_id, field_name, venue_id, menu_url, bitly, data) => {
    return new Promise(async (resolve, reject) => {
        var chk_dt = await db_Check('id, hotel_id', 'md_url', `hotel_id = ${data.hotel_id} AND srv_res_flag = '${data.srv_res_flag}' AND srv_res_id = '${data.srv_res_id}'`)
        var table_name = "md_url",
            fields =
                chk_dt.suc > 0 && chk_dt.msg > 0
                ? `url = "${menu_url}"${bitly ? ', bitly_url ="' + bitly + '"' : ''}, ${field_name} = "${filename}"`
                : `(hotel_id, srv_res_flag, srv_res_id, url, bitly_url, ${field_name})`,
            values = `(${data.hotel_id}, '${data.srv_res_flag}', '${data.srv_res_id}', "${menu_url}", "${bitly}", "${filename}")`,
            whr = chk_dt.suc > 0 && chk_dt.msg > 0 ? `hotel_id = ${data.hotel_id} AND srv_res_flag = '${data.srv_res_flag}' AND srv_res_id = '${data.srv_res_id}'` : null,
            flag = chk_dt.suc > 0 && chk_dt.msg > 0 ? 1 : 0;
        var res_dt = await db_Insert(table_name, fields, values, whr, flag)
        resolve(res_dt)
    })
    
    // let chk_sql = `SELECT COUNT(id) ck_dt, id FROM md_url_custom WHERE restaurant_id = ${res_id} AND venue_id = "${venue_id}"`;
    // var chk_dt = await F_Select(chk_sql),
    //     id = chk_dt.msg[0].id,
    //     res = '',
    //     sql = '';
    // if (chk_dt.msg[0].ck_dt > 0) {
    //     sql = `UPDATE md_url_custom SET url = "${menu_url}", bitly_url= "${bitly}", ${field_name} = "${filename}" WHERE id = ${id}`;
    //     // console.log({ sql });
        
    // } else {
    //     sql = `INSERT INTO md_url_custom (restaurant_id, venue_id, url, bitly_url, ${field_name}) VALUES 
    //     ("${res_id}", "${venue_id}", "${menu_url}", "${bitly}", "${filename}")`
    // }
    // console.log(sql);
    // return new Promise((resolve, reject) => {
    //     db.query(sql, (err, lastId) => {
    //         if (err) {
    //             console.log(err);
    //             res = { suc: 0, msg: JSON.stringify(err) };
    //         } else {
    //             res = { suc: 1, msg: "Inserted !!" }
    //         }
    //         resolve(res);
    //     })
    // })
}

TestRouter.post('/dif_cov_img_save', async (req, res) => {
    var img_type = 'dif_cov';
    console.log({cov: img_type});
    var dt = await difCovImgSave(req.body.cover_img, img_type, req.body);
    res.send(dt);
})

const difCovImgSave = async (files, img_type, data) => {
    var filename = '',
        res = '';
    if (files) {
        // var filename = data.restaurant_id + '_' + data.menu_id + '_' + img_type + '_' + files.name;
        // return new Promise(async (resolve, reject) => {
        //     files.mv('uploads/' + filename, async (err) => {
        //         if (err) {
        //             console.log(`${filename} not uploaded`);
        //         } else {
        //             console.log(`Successfully ${filename} uploaded`);
        //             dt = await UpdateOtherImg(`top_img_url = "${data.top_url}", top_image_img = "${filename}"`, `id = "${data.id}" AND restaurant_id = "${data.restaurant_id}"`, 'td_other_image');
        //             resolve(dt);
        //         }
        //     })
        // })
        var buffer = files;
        // var dt = buffer.split(';');
        // var ext = dt[0].split('/')[1];
        filename = img_type + '_' + data.cover_filename;

        // console.log(ext);
        var buffer_dt = buffer.replace(/^data:image\/png;base64,/, "");
        buffer_dt += buffer_dt.replace('+', ' ');
        let binaer_dt = new Buffer(buffer_dt, 'base64').toString('binary');
        return new Promise(async (resolve, reject) => {
            fs.writeFile("uploads/" + filename, binaer_dt, "binary", async (err) => {
                if (err) { console.log(err); res = { suc: 0, msg: "err" }; } // writes out file without error, but it's not a valid image
                else {
                    res = await DifCovImgSave(filename, data.user);
                }
                resolve(res);
            });
        })
    } else {
        return new Promise(async (resolve, reject) => {
            res = { suc: 0, msg: "No File Selected !!" };
            resolve(res);
        })
    }
}

TestRouter.post('/message_center', async (req, res) => {
    var data = req.body
    var files = req.files ? (req.files.img ? req.files.img : null) : null;
    // console.log(files);
    var res_dt = await message_center_file_save(data, files)
    res.send(res_dt);
})

const message_center_file_save = (data, files) => {
    return new Promise(async (resolve, reject) => {
        var img_name, img_path, res_dt;
        if (files) {
            img_name = data.hotel_id + '_' + data.message_center_type + '_' + files.name;
            img_path = img_name
            files.mv('uploads/' + img_name, async (err) => {
                if (err) {
                    console.log(`${img_name} not uploaded`);
                    res = { suc: 0, msg: "err" };
                } else {
                    console.log(`Successfully ${img_name} uploaded`);
                    res_dt = await save_message(data, img_path)
                }
                resolve(res_dt);
            })
        } else {
            res_dt = await save_message(data, null)
            resolve(res_dt)
        }
    })
}

TestRouter.post('/pc_avatar', async (req, res) => {
    var data = req.body
    var files = req.files ? (req.files.img ? req.files.img : null) : null;
    // console.log(files);
    var res_dt = await avatar_file_save(data, files)
    res.send(res_dt);
})

const avatar_file_save = (data, files) => {
    return new Promise(async (resolve, reject) => {
        var img_name, img_path, res_dt;
        if (files) {
            img_name = data.hotel_id + '_avatar_' + files.name;
            img_path = img_name
            files.mv('uploads/' + img_name, async (err) => {
                if (err) {
                    console.log(`${img_name} not uploaded`);
                    res = { suc: 0, msg: "err" };
                } else {
                    console.log(`Successfully ${img_name} uploaded`);
                    res_dt = await saveAvatar(data, img_path)
                }
                resolve(res_dt);
            })
        } else {
            res_dt = await saveAvatar(data, null)
            resolve(res_dt);
        }
    })
}

// TestRouter.post('/pc_voice', async (req, res) => {
//     var data = req.body
//     var files = req.files ? (req.files.aud ? req.files.aud : null) : null;
//     // console.log(req.files);
//     var res_dt = await voice_file_save(data, files)
//     res.send(res_dt);
// })

// const voice_file_save = (data, files) => {
//     return new Promise(async (resolve, reject) => {
//         var img_name, img_path, res_dt;
//         if (files) {
//             img_name = data.hotel_id + '_' + data.srv_res_flag + '_' + data.srv_res_id + '_voice_' + files.name;
//             img_path = img_name
//             files.mv('uploads/' + img_name, async (err) => {
//                 if (err) {
//                     console.log(`${img_name} not uploaded`);
//                     res = { suc: 0, msg: "err" };
//                 } else {
//                     console.log(`Successfully ${img_name} uploaded`);
//                     res_dt = await saveVoice(data, img_path)
//                 }
//                 resolve(res_dt);
//             })
//         } else {
//             res_dt = await saveVoice(data, null)
//             resolve(res_dt);
//         }
//     })
// }

TestRouter.post('/flip_upload', async (req, res) => {
  var data = req.body
  var files = req.files ? req.files.img : null;
  var res_dt = await saveFlipBookImages(data, files)
  res.send(res_dt);
})

const saveFlipBookImages = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = 'uploads/flipBook',
      folderPath = `${data.user_name.split(' ').join('_')}_H${data.hotel_id}_R${data.room_no}`,
      subDir = `${dir}/${folderPath}`,
      img_name = files.name.split(' ').join('_'), res_dt;
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
    if (!fs.existsSync(subDir)) {
      fs.mkdirSync(subDir);
    }
    if (files) {
      files.mv(`${subDir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res_dt = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await FlipBookSave(data, `flipBook/${folderPath}/${img_name}`);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = { suc: 0, msg: "No File Found" };
      resolve(res_dt);
    }
  })
}

TestRouter.post('/flip_approve', async (req, res) => {
  var data = req.body
  var files = req.files ? req.files.bg_img : null;
  var res_dt = await saveFlipBackImages(data, files)
  res.send(res_dt);
})

const saveFlipBackImages = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = 'uploads/flipBook',
      folderPath = `${data.hotel_id}`,
      subDir = `${dir}`,
      img_name = files.name.split(' ').join('_'), res_dt;
	  
    if (files) {
      files.mv(`${subDir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res_dt = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await FileApprove(data, `flipBook/${img_name}`);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = await FileApprove(data, null);
      resolve(res_dt);
    }
  })
}



TestRouter.post("/calendar", async (req, res) => {
  var data = req.body;
  var files = req.files ? (req.files.img ? req.files.img : null) : null;
  // console.log(files);
  var res_dt = await calendar_file_save(data, files);
  res.send(res_dt);
});

const calendar_file_save = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = 'uploads/calendar'
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
    var img_name, img_path, res_dt;
    if (files) {
      img_name = data.hotel_id + "_" + files.name;
      img_path = 'calendar/' + img_name;
      files.mv(`${dir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await CalendarSaveData(data, img_path);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = await CalendarSaveData(data, null);
      resolve(res_dt);
    }
  });
};

TestRouter.post('/fun_directory', async (req, res) => {
  var data = req.body,
    files = req.files ? (req.files.img ? req.files.img : null) : null;
    var res_dt = await saveFunDirectoryImg(data, files);
    res.send(res_dt);
})

const saveFunDirectoryImg = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = "uploads/fun_directory";
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
    var img_name, img_path, res_dt;
    if (files) {
      img_name = files.name;
      img_path = "fun_directory/" + img_name;
      files.mv(`${dir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await funDirectorySaveData(data, img_path);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = await funDirectorySaveData(data, null);
      resolve(res_dt);
    }
  });
}

TestRouter.post("/fun_directory_menu_info", async (req, res) => {
  var data = req.body,
    files = req.files ? (req.files.img ? req.files.img : null) : null;
  var res_dt = await saveFunDirMenuImg(data, files);
  res.send(res_dt);
});

const saveFunDirMenuImg = (data,files) => {
  var dir = "uploads/fun_directory";
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir);
  }
  var img_name, img_path, res_dt, img_list = [];
  if(files){
    if(Array.isArray(files)){
      return new Promise(async (resolve, reject) => {
        img_list.length = 0;
        for (let dt of files) {
          console.log(dt.name);
          img_name = dt.name;
          img_list.push({ img_path: "fun_directory/" + dt.name });
          img_path = "fun_directory/" + img_name;
          dt.mv(`${dir}/${img_name}`, async (err) => {
            if (err) {
              console.log(`${img_name} not uploaded`);
            } else {
              console.log(`Successfully ${img_name} uploaded`);
            }
          });
        }
        res_dt = await SaveFunDirMenuImgDt(data, img_list);
        resolve(res_dt);
      })
    }else{
      return new Promise((resolve, reject) => {
        img_name = files.name;
        img_path = "fun_directory/" + img_name;

        files.mv(`${dir}/${img_name}`, async (err) => {
          if (err) {
            console.log(`${img_name} not uploaded`);
          } else {
            console.log(`Successfully ${img_name} uploaded`);
            img_list.push({ img_path: img_path });
          }
          res_dt = await SaveFunDirMenuImgDt(data, img_list);
          resolve(res_dt);
        });
      });
    }
  }else{
    return new Promise(async (resolve, reject) => {
      res_dt = await SaveFunDirMenuImgDt(data, null);
      resolve(res_dt);
    })
  }
}

TestRouter.post("/fun_directory_sec_menu", async (req, res) => {
  var data = req.body,
    files = req.files ? (req.files.img ? req.files.img : null) : null;
  var res_dt = await saveSectionMenu(data, files);
  res.send(res_dt);
});

const saveSectionMenu = (data, files) => {
  var dir = "uploads/fun_directory", res_dt;
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir);
  }
  return new Promise(async (resolve, reject) => {
    if(files){
      var img_name = files.name;
      var img_path = "fun_directory/" + img_name;

      files.mv(`${dir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await SaveFunDirSecMenu(data, img_path);
          resolve(res_dt);
        }
      });
    }else{
      res_dt = await SaveFunDirSecMenu(data, null);
      resolve(res_dt);
    }
  })
}

TestRouter.post("/fun_directory_calendar", async (req, res) => {
  var data = req.body;
  var files = req.files ? (req.files.img ? req.files.img : null) : null;
  // console.log(files);
  var res_dt = await funDir_calendar_file_save(data, files);
  res.send(res_dt);
});

const funDir_calendar_file_save = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = "uploads/fun_directory";
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
    var img_name, img_path, res_dt;
    if (files) {
      img_name = 'calendar_' + files.name;
      img_path = "fun_directory/" + img_name;
      files.mv(`${dir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await FunDirCalendarSaveData(data, img_path);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = await FunDirCalendarSaveData(data, null);
      resolve(res_dt);
    }
  });
};

TestRouter.post("/fun_dir_res_menu_sec", async (req, res) => {
  var data = req.body;
  var files = req.files ? (req.files.img ? req.files.img : null) : null;
  // console.log(files);
  var res_dt = await save_dir_res_menu_sec(data, files);
  res.send(res_dt);
});

const save_dir_res_menu_sec = (data, files) => {
  return new Promise(async (resolve, reject) => {
    var dir = "uploads/fun_directory/menu";
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
    var img_name, img_path, res_dt;
    if (files) {
      img_name = `${data.menu_id}_${data.sec_id}_${data.res_id}_${data.catg_id}_${files.name}`;
      img_path = "fun_directory/menu/" + img_name;
      files.mv(`${dir}/${img_name}`, async (err) => {
        if (err) {
          console.log(`${img_name} not uploaded`);
          res = { suc: 0, msg: "err" };
        } else {
          console.log(`Successfully ${img_name} uploaded`);
          res_dt = await SaveResDirMenuSec(data, img_path);
        }
        resolve(res_dt);
      });
    } else {
      res_dt = await SaveResDirMenuSec(data, null);
      resolve(res_dt);
    }
  });
};

TestRouter.post('/dir_setup', async (req, res) => {
  var data = req.body;
  var cover = req.files ? (req.files.cover ? req.files.cover : null) : null,
  fd_img = req.files ? (req.files.fd_img ? req.files.fd_img : null) : null,
  rs_img = req.files ? (req.files.rs_img ? req.files.rs_img : null) : null,
  con_faq_img = req.files ? (req.files.con_faq_img ? req.files.con_faq_img : null) : null,
  entertainment_img = req.files ? (req.files.entertainment_img ? req.files.entertainment_img : null) : null,
  fun_directory_img = req.files ? (req.files.fun_directory_img ? req.files.fun_directory_img : null) : null,
  lost_found_img = req.files ? (req.files.lost_found_img ? req.files.lost_found_img : null) : null,
  promotions_img = req.files ? (req.files.promotions_img ? req.files.promotions_img : null) : null,
  restaurant_img = req.files ? (req.files.restaurant_img ? req.files.restaurant_img : null) : null,
  photo_ops_img = req.files ? (req.files.photo_ops_img ? req.files.photo_ops_img : null) : null,
  banner1_img = req.files ? (req.files.banner1_img ? req.files.banner1_img : null) : null,
  banner2_img = req.files ? (req.files.banner2_img ? req.files.banner2_img : null) : null,
  safety_img = req.files ? (req.files.safety_img ? req.files.safety_img : null) : null,
  hotelf_img = req.files ? (req.files.hotelf_img ? req.files.hotelf_img : null) : null,
  suggestion_img = req.files ? (req.files.suggestion_img ? req.files.suggestion_img : null) : null,
  vacation_img = req.files ? (req.files.vacation_img ? req.files.vacation_img : null) : null;
  var fileArr = []
  fileArr.push({tag: 'cover', file: cover})
  fileArr.push({tag: 'fd_img', file: fd_img})
  fileArr.push({tag: 'rs_img', file: rs_img})
  fileArr.push({tag: 'con_faq_img', file: con_faq_img})
  fileArr.push({tag: 'entertainment_img', file: entertainment_img})
  fileArr.push({tag: 'fun_directory_img', file: fun_directory_img})
  fileArr.push({tag: 'lost_found_img', file: lost_found_img})
  fileArr.push({tag: 'promotions_img', file: promotions_img})
  fileArr.push({tag: 'restaurant_img', file: restaurant_img})
  fileArr.push({tag: 'photo_ops_img', file: photo_ops_img})
  fileArr.push({tag: 'banner1_img', file: banner1_img})
  fileArr.push({tag: 'banner2_img', file: banner2_img})
  fileArr.push({tag: 'safety_img', file: safety_img})
  fileArr.push({tag: 'hotelf_img', file: hotelf_img})
  fileArr.push({tag: 'suggestion_img', file: suggestion_img})
  fileArr.push({tag: 'vacation_img', file: vacation_img})

  // console.log(fileArr);

  // var result = ''
  let pogress = 100/fileArr.length,
  start = 0
  var dir = 'uploads/directory'
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
  for(let dt of fileArr){
    if(dt.file){
      console.log(dt);
      start += pogress
      if(dt.tag == 'restaurant_img'){
        if (dt.file.length > 0) {
          var i = 0
          for(let imgDt of dt.file){
            img_name = data.hotel_id + "_rs_" + imgDt.name;
            img_path = 'https://customapi.shoplocal-lagunabeach.com/directory/' + img_name;
            // console.log(img_path);
            // dt['img_path'] = img_path
            imgDt.mv(`${dir}/${img_name}`, async (err) => {
              if (err) {
                console.log(`${img_name} not uploaded`);
                imgDt = null
              } else {
                console.log(`Successfully ${img_name} uploaded`);
                imgDt = img_path
                await dirImageSave(data.hotel_id, {tag: 'restaurant_img_'+i, img_path: img_path})
                // console.log(dt);
              }
			i++;
            });
          }
        }
      }else{ 
        img_name = data.hotel_id + "_" + dt.file.name;
        img_path = 'https://customapi.shoplocal-lagunabeach.com/directory/' + img_name;
        console.log(img_path);
        dt['img_path'] = img_path
        dt.file.mv(`${dir}/${img_name}`, async (err) => {
          if (err) {
            console.log(`${img_name} not uploaded`);
            dt.file = null
          } else {
            console.log(`Successfully ${img_name} uploaded`);
            dt.file = img_path
            await dirImageSave(data.hotel_id, dt)
            console.log(dt);
          }
        });
      }
      // console.log(dt);
    }else if(data[dt.tag] != undefined && data[dt.tag] != 'undefined' && data[dt.tag] != 'null' && data[dt.tag] != null){
      dt['img_path'] = data[dt.tag]
      await dirImageSave(data.hotel_id, dt)
    }
    // start += pogress
    // console.log(start);
    // res.write(`${start.toString()} \n`)
  }

  var iconList = JSON.parse(data.iconList)
  var restIconList = JSON.parse(data.restIcon);
  var srvIconList = JSON.parse(data.srvIcon);
	
  for(let icon of iconList){
	  if(icon.name != ''){
		icon['img_path'] = icon.name
		icon['tag'] = icon.label
		await dirImageSave(data.hotel_id, icon)
	  }
  }

  if(Object.keys(restIconList).length > 0)
  for (let icon in restIconList) {
    // icon["img_path"] = restIconList[icon].name;
    // icon["tag"] = restIconList[icon].label;
    await dirImageSave(data.hotel_id, { img_path: restIconList[icon].name, tag: restIconList[icon].label });
  }

  if(Object.keys(srvIconList).length > 0)
  for (let icon in srvIconList) {
    // icon["img_path"] = srvIconList[icon].name;
    // icon["tag"] = srvIconList[icon].label;
    await dirImageSave(data.hotel_id, { img_path: srvIconList[icon].name, tag: srvIconList[icon].label });
  }
  // console.log(fileArr);
  var result = await saveDirData(data)
  res.send({suc:1, msg:"Success", res_img: restaurant_img})
})

TestRouter.post('/raise_tkt', async (req, res) => {
  var data = req.body;
  var file = req.files ? (req.files.img ? req.files.img : null) : null;

  var dir = 'uploads/support'
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir);
  }

  if(file){
    var img_name = data.hotel_id + "_" + file.name;
    var img_path = 'support/' + img_name;
    file.mv(`${dir}/${img_name}`, async (err) => {
      if (err) {
        console.log(`${img_name} not uploaded`);
        var up_res = await SaveRaiseSupportLog(data, null)
        res.send(up_res)
      } else {
        console.log(`Successfully ${img_name} uploaded`);
        var up_res = await SaveRaiseSupportLog(data, img_path)
        res.send(up_res)
      }
    });
  }else{
    var up_res = await SaveRaiseSupportLog(data, null)
    res.send(up_res)
  }
})

module.exports = { TestRouter, UploadLogo};