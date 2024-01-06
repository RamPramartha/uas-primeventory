const db = require("../db/db");
const path = require("path");
const fs = require("fs").promises;

class HomeController{
    static async index(req, res) {
        const rooms1 = await db("tb_ruangan").where('kategori','lab');
        const rooms2 = await db("tb_ruangan").where('kategori','kelas');
        const rooms3 = await db("tb_ruangan").where('kategori','lainnya');
        res.render("home", {
          lab: rooms1,
          kelas: rooms2,
          lain: rooms3 ,
        });
    }
}



module.exports = HomeController;