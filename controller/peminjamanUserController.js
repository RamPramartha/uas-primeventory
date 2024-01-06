const db = require("../db/db");
const path = require("path");
const fs = require("fs").promises;
const { DateTime } = require('luxon');

const formatTanggal = (date) => {
  const originalDate = DateTime.fromJSDate(new Date(date));
  const formattedDate = originalDate.toFormat('d/M/yyyy HH:mm:ss');
  return formattedDate;
};

// const formatTanggalMySql = (date) => {
//   const originalDate = DateTime.fromJSDate(new Date(date));
//   const formattedDate = originalDate.toFormat('yyyy-M-dd HH:mm:ss');
//   return formattedDate;
// };

// const checkDuplicateJadwal = async (waktu_mulai, waktu_selesai, kode_ruangan) =>  {

//   // Jadwal yang duplicate mungkin saja
//   // waktu mulainya ada di antara waktu mulai dan waktu selesai
//   // pada jadwal yang sudah ada


//   // ruangan kode ruangan 1 2024-01-01 12:12:00
//   // jawal existing ruangan 1 2024-01-01 10:00:00 -  2024-01-01 13:00:00 
//   // apakah ada jadwal yang ada diantara waktu mulai dan waktu selesai yang kita inginkan
//   // try{
//   //   const check = await db('tb_jadwal_ruangan')
//   //     .where('kode_ruangan', kode_ruangan)
//   //     .andWhere(function() {
//   //       this.where(function() {
//   //         this.where('waktu_mulai', [
//   //           formatTanggalMySql(waktu_mulai),
//   //         ]);
//   //         this.orWhere('waktu_selesai', [
//   //           formatTanggalMySql(waktu_selesai),
//   //         ]);
//   //       });
//   //     })
//   //     // .andWhere(function() {
//   //     //   this.where(function() {
//   //     //     this.whereBetween('waktu_mulai', [
//   //     //       formatTanggalMySql(waktu_mulai),
//   //     //       formatTanggalMySql(waktu_selesai),
//   //     //     ]);
//   //     //     this.orWhereBetween('waktu_selesai', [
//   //     //       formatTanggalMySql(waktu_mulai),
//   //     //       formatTanggalMySql(waktu_selesai),
//   //     //     ]);
//   //     //   });
//   //     // })
//   //   .count('kode_jadwal_peminjaman as total_id')
//   //   console.log('Check result', check)
//   //   const totalDuplicate = parseInt(check[0].total_id)
//   //   console.log("Total duplicate", totalDuplicate)
//   //   return totalDuplicate > 0
//   // } catch(error){
//   //   console.log(error)
//   // }

// }

class PeminjamanUserController {

  static async index(req, res) {
    try{
      
      const {kode}=req.params;
      
      const stuff = await db("tb_barang").where("kode_ruangan",kode);
      const schedule = await db("tb_jadwal_ruangan");
      const schedule_index = await db("tb_jadwal_ruangan").where("kode_ruangan",kode);
      const rooms = await db("tb_ruangan").where("kode_ruangan", kode).first();
      console.log('rooms', rooms);

      if (rooms.length < 1) {
        return res.status(404).send('ruangan not found');
      }

      res.render("peminjaman", {
        ruang: rooms,
        barang: stuff,
        jadwal: schedule,
        jadwal_index: schedule_index,
        kode:kode,
        formatTanggal: formatTanggal,
      });

    } catch (error) {
      console.error(error);
      res.status(500).send('Internal Server Error');
    }
  }

  static async create(req, res) {
    const {kode} = req.params;
    const schedule = await db("tb_jadwal_ruangan").where("kode_ruangan", kode);

    res.render("peminjaman", {
      jadwal: schedule,
      
    });
  }




  static async store(req, res) {

    const { nim, kode_ruangan, kegiatan, mulai, selesai } = req.body;
    
    // console.log('tipe dari check duplicate', typeof checkDuplicateJadwal(mulai,selesai,kode))

    // if(checkDuplicateJadwal(mulai,selesai,kode) > 0){
    //   res.send('Ada jadwal yang duplicate')
    //   return
    // }

    try {
      const result = await db("tb_jadwal_ruangan").insert({
      kode_ruangan: kode_ruangan,
      id_user: nim,
      kegiatan: kegiatan,
      waktu_mulai: mulai,
      waktu_selesai: selesai
      });

    console.log("hasil result",result);

    if (result) {
      req.flash("success", "Success Menambah jadwal ruangan");
      res.redirect("/peminjaman/" + kode_ruangan);
    }
    
    } catch (error) {
      console.log(error);
    }


  }

}
module.exports = PeminjamanUserController;