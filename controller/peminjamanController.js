const db = require("../db/db");
const path = require("path");
const fs = require("fs").promises;

class PeminjamanController {
  static async index(req, res) {
    const rooms = await db("tb_ruangan");
    const stuff = await db("tb_barang");
    // const schedule = await db("tb_jadwal");
    res.render("admin/ruangan/list", {
      ruang: rooms,
      barang: stuff,
    });
  }


  static async edit(req, res) {
    const { kode } = req.params;

    try {
      let result = await db("tb_barang").where({"kode_barang": kode}).first();

      res.render("admin/ruangan/edit", {
        kode: kode,
        barang: result,
      });
    } catch (error) {
      console.log(error);
    }
  }

  static async store(req, res) {
    const { kode_ruangan, nama_barang, jumlah } = req.body;
    console.log('=============');
    console.log('barang', req.body);
    try {
      let foto_barang  = ''; 
      
      if (req.file && req.file.filename) {
        foto_barang = req.file.filename; 
      }
    
      const result = await db("tb_barang").insert({
        kode_ruangan: kode_ruangan,
        foto_barang: foto_barang,
        nama_barang: nama_barang,
        jumlah: jumlah,
      });

      if (result) {
        req.flash("success", "Success Menambah Data Barang");
        res.redirect("/admin/ruangan/list");
      }
    } catch (error) {
      console.log(error);
    }
  }

  static async update(req, res) {
    const { kode_ruangan, nama_barang, jumlah } = req.body;
    console.log('body = ',req.body);
    const { kode } = req.params;

    try {
      let data = await db("tb_barang").where("kode_barang", kode).first();
      console.log('data', data);

      if (req.file) {
        // Delete the if found
        const filePath = path.join("public/uploads", data.foto_barang);
        await fs.unlink(filePath);
      }

      let result = await db("tb_barang")
        .where("kode_barang", kode)
        .update({
          kode_ruangan: kode_ruangan,
          foto_barang: req.file ? req.file.filename : undefined,
          nama_barang: nama_barang,
          jumlah: jumlah,
        });

      if (result) {
        req.flash("success", "Success update Data Resep");
        res.redirect("/admin/ruangan/list");
      }
    } catch (error) {
      console.log(error);
    }
  }

// static async update(req, res) {
//   const { kode_ruangan, nama, jumlah } = req.body;
//   // console.log('Request Body',req.body);
//   // console.log('Request file',req.file);
//   const { kode } = req.params;

//   try {
//     let data = await db("tb_barang").where("kode_barang", kode).first();

//     // Cek apakah ada perubahan pada data sebelum melakukan update
//     if (
//       data.kode_ruangan !== kode_ruangan ||
//       data.nama_barang !== nama ||
//       data.jumlah !== jumlah ||
//       (req.file && req.file.filename !== data.foto_barang)
//     ){
//       // Ada perubahan, lakukan update
//       let result = await db("tb_barang")
//         .where("kode_barang", kode)
//         .update({
//           kode_ruangan: kode_ruangan,
//           foto_barang: req.file ? req.file.filename : data.foto_barang,
//           nama_barang: nama,
//           jumlah: jumlah,
//         });

//       if (result) {
//         req.flash("success", "Success update Data Resep");
//         res.redirect("/admin/ruangan/list");
//       }
//     } else {
//       // Tidak ada perubahan, mungkin hendak memberikan pesan atau melakukan tindakan lain
//       req.flash("info", "No changes detected");
//       res.redirect("/admin/ruangan/list");
//     }
//   } catch (error) {
//     console.log(error);
//     // Tangani kesalahan dengan cara yang sesuai
//   }
// }




  static async delete(req, res) {
    const {kode} = req.params;
    console.log(kode);
    try {
      
      await db("tb_barang").where({ 'kode_barang': kode }).del();
      res.redirect("/admin/ruangan/list"); // No content (successful deletion)
    } catch (error) {
      console.error("Error Deleting barang:", error);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

module.exports = PeminjamanController;