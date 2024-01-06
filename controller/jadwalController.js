// const db = require("../db/db");
// const path = require("path");
// const fs = require("fs").promises;
// const { DateTime } = require('luxon');

// const formatTanggal = (date) => {
//     const originalDate = DateTime.fromJSDate(new Date(date));
//     const formattedDate = originalDate.toFormat('d/M/yyyy HH:mm:ss');
//     return formattedDate;
//   };
  
//   const formatTanggalMySql = (date) => {
//     const originalDate = DateTime.fromJSDate(new Date(date));
//     const formattedDate = originalDate.toFormat('yyyy-M-dd HH:mm:ss');
//     return formattedDate;
//   };
// class JadwalController{
//     static async index(req, res) {
//         const schedule = await db("tb_jadwal_ruangan");
//         res.render("admin/ruangan/list", {
//           jadwal: schedule,
//           formatTanggal: formatTanggal,
//         });
//       }
// }