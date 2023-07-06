const admin = require("firebase-admin"),
  fcm = require("fcm-notification"),
  express = require("express"),
  PushNotificationRouter = express.Router(),
  dateFormat = require("dateformat"),
  serviceAccount = require("../core/push_notification_key.json"),
  // certPath = admin.credential.cert(serviceAccount),
  FCM = new fcm(serviceAccount);

const { db_Insert, db_Select } = require("../modules/MasterModule");

PushNotificationRouter.get("/send_push_notification", async (req, res) => {
  //let Tokens = ["cf7AvDlMRGGKQ81C7Uw_NA:APA91bFEBXxj6uH5vxXIN5SpJFw8z6U6oG99DHoCRBkBDnnR9nG-8VxfhoVz7wBUJR2aEJdv9IXKbg-GxxJpgLqee4H5_-sYaQXbNghuXxbLZxazsJm_sdERXniSUn504UbTx6EF2P0r", "cU_fv88zRA-TC8APNIo_CO:APA91bHA4LjNff7YsWc9x_ocZDB1Ei7TxHzuzNskNb3PxlctZCgnxbeu_HRMHe0gcjxHnvjdvarAZFxMS7q-OGimijhlRx1rHrwO8zjHP2FcY1DDe_ZBebQK_vC7uqrNCxhURI5Zr4Fh", "eii608tGRAmqnmah5wpZgC:APA91bHzmAKH28HtOJ3p2uyP815vNwjWC7cWkE0wWbKE2h-aVUcV3uuW7x3yUAjOv1WwzTAbYQCBlS-FcOsKpTJXIBZJLnf8El9A0XGhfbD6mix-um0S5ZP9anAvQaq3nsgQibw9aio9", "f5DCFjo-QdqsKoIXff9e31:APA91bFOoC3IkSzZN21OVR7zyb_SSR4f880VnZRwtKS4qrb1_dB77ZWP45kiwXnTFeEaWzVJbRWcKxIL1wOV_N6lh4JcUBVJSAeyadwT-yNfPrX_p7aH3nn9oR9l58aNx9IkCc96LMEQ"]

  let Tokens = [
    "cU_fv88zRA-TC8APNIo_CO:APA91bHA4LjNff7YsWc9x_ocZDB1Ei7TxHzuzNskNb3PxlctZCgnxbeu_HRMHe0gcjxHnvjdvarAZFxMS7q-OGimijhlRx1rHrwO8zjHP2FcY1DDe_ZBebQK_vC7uqrNCxhURI5Zr4Fh",
    "eii608tGRAmqnmah5wpZgC:APA91bHzmAKH28HtOJ3p2uyP815vNwjWC7cWkE0wWbKE2h-aVUcV3uuW7x3yUAjOv1WwzTAbYQCBlS-FcOsKpTJXIBZJLnf8El9A0XGhfbD6mix-um0S5ZP9anAvQaq3nsgQibw9aio9",
  ];
  try {
    let message = {
      notification: {
        title: "Yeeeaasss...",
        body: "Amra Push Notification send korte pare6i....",
      },
      data: {
        orderId: "123456",
        orderDate: "2023-06-23",
      },
      android: {
        priority: "high",
        ttl: 50,
      },
      //token: ["cf7AvDlMRGGKQ81C7Uw_NA:APA91bFEBXxj6uH5vxXIN5SpJFw8z6U6oG99DHoCRBkBDnnR9nG-8VxfhoVz7wBUJR2aEJdv9IXKbg-GxxJpgLqee4H5_-sYaQXbNghuXxbLZxazsJm_sdERXniSUn504UbTx6EF2P0r", "cU_fv88zRA-TC8APNIo_CO:APA91bHA4LjNff7YsWc9x_ocZDB1Ei7TxHzuzNskNb3PxlctZCgnxbeu_HRMHe0gcjxHnvjdvarAZFxMS7q-OGimijhlRx1rHrwO8zjHP2FcY1DDe_ZBebQK_vC7uqrNCxhURI5Zr4Fh", "eii608tGRAmqnmah5wpZgC:APA91bHzmAKH28HtOJ3p2uyP815vNwjWC7cWkE0wWbKE2h-aVUcV3uuW7x3yUAjOv1WwzTAbYQCBlS-FcOsKpTJXIBZJLnf8El9A0XGhfbD6mix-um0S5ZP9anAvQaq3nsgQibw9aio9"],
    };

    FCM.sendToMultipleToken(message, Tokens, (err, resp) => {
      if (err) res.send({ suc: 0, msg: err });
      else res.send({ suc: 1, msg: resp });
    });
  } catch (err) {
    console.log(err);
  }
});

const singleUser = (
  title,
  body,
  route,
  id,
  token,
  checkIn,
  checkOut,
  userId
) => {
  return new Promise((resolve, reject) => {
    try {
      let message = {
        notification: {
          title: title,
          body: body,
        },
        data: {
          notiId: id.toString(),
          route: route.toString(),
          checkIn: checkIn.toString(),
          checkOut: checkOut.toString(),
          userId: userId.toString(),
        },
        android: {
          priority: "high",
        },
        token: token,
      };

      FCM.send(message, (err, resp) => {
        if (err) resolve({ suc: 0, msg: err });
        else resolve({ suc: 1, msg: resp });
      });
    } catch (err) {
      resolve({ suc: 0, msg: err });
    }
  });
};

const MultipleUser = (
  title,
  body,
  route,
  id,
  token,
  checkIn,
  checkOut,
  userId
) => {
  return new Promise((resolve, reject) => {
    try {
      let message = {
        notification: {
          title: title,
          body: body,
        },
        data: {
          notiId: id.toString(),
          route: route.toString(),
          checkIn: checkIn.toString(),
          checkOut: checkOut.toString(),
          userId: userId.toString(),
        },
        android: {
          priority: "high",
        },
      };

      FCM.sendToMultipleToken(message, token, (err, resp) => {
        if (err) resolve({ suc: 0, msg: err });
        else resolve({ suc: 1, msg: resp });
      });
    } catch (err) {
      resolve({ suc: 0, msg: err });
    }
  });
};

PushNotificationRouter.post("/save_token", async (req, res) => {
  var data = req.body,
    datetime = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

  var table_name = "td_guest_user",
    fields = `app_token_id = "${data.token}", modified_by="${data.mobile_no}", modified_dt = '${datetime}'`,
    values = null,
    whr = `mobile_no = "${data.mobile_no}"`,
    flag = 1;
  var res_dt = await db_Insert(table_name, fields, values, whr, flag);
  res.send(res_dt);
});

PushNotificationRouter.get("/send_test_push_noti", async (req, res) => {
  var res_dt = await sendApp();
  res.send(res_dt);
});

const sendApp = () => {
  var request = require("request");
  var options = {
    method: "POST",
    url: "https://fcm.googleapis.com/fcm/send",
    headers: {
      Authorization:
        "Key=AAAAKE9pa9E:APA91bH_fuAbcdiBra6jKdfPyuqKTqbI5ldBqho4L9xUunNmGvYv0J3ZP6JaC9NMI3u0hWbM3uvDPv0_Owr1y0KHN7dcdjBjc_sVSbuFeIB_pEj2OLcXqBFXlRisiC8sC5lLMjbi1WgI",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      registration_ids: [
        "eii608tGRAmqnmah5wpZgC:APA91bHzmAKH28HtOJ3p2uyP815vNwjWC7cWkE0wWbKE2h-aVUcV3uuW7x3yUAjOv1WwzTAbYQCBlS-FcOsKpTJXIBZJLnf8El9A0XGhfbD6mix-um0S5ZP9anAvQaq3nsgQibw9aio9", "e_SPh6O4TwyP7YYJ84ZUT7:APA91bFRMrBrdsg0RpalUbZJ4YS3tW2IQGuf1j1SHfW7v42U0R6mCtatIsiv_T6YUWWdO6foz_XVrec3oNk3N3CpGsTh0pRjJN7Mq_0M1_2Cd6ElX5Cvfxee7M2FzPRoM-R8MsO6X4Af"
      ],
      notification: {
        body: "Christmas is a time for family, food and fellowship. Wishing you nothing but the best that the season has to offer.",
        title: "We wish you a merry Christmas",
        image: "https://customapi.shoplocal-lagunabeach.com/stock/79947294.png",
      },
      data: {
        notiId: "26",
        routeId: "2",
        checkIn: "2023-06-22 22:30:00",
        checkOut: "2023-06-30 20:30:00",
        userId: "43",
        msgType: "H"
      },
    }),
  };
  return new Promise((resolve, reject) => {
    request(options, function (error, response) {
      if (error) throw new Error(error);
      // console.log(response.body);
      else resolve(response.body);
    });
  });
};

module.exports = { PushNotificationRouter, singleUser, MultipleUser };