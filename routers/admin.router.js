const { Router } = require('express')
const router = Router();
const upload = require("../middlewares/upload");

const PeminjamanController = require("../controller/peminjamanController");
// const JadwalController = require("../controller/jadwalController");

router.get("/admin/dashboard", (req, res) => {
    res.render("admin/dashboard");
});

router.get("/admin/ruangan/create", (req, res) => {
    res.render("admin/ruangan/create");
});

router.post("/admin/ruangan/delete/:kode",PeminjamanController.delete);
router.post("/admin/ruangan/store", upload.single("img"), PeminjamanController.store);

router.get("/admin/ruangan/list", PeminjamanController.index);

router.get("/admin/ruangan/edit/:kode", PeminjamanController.edit);

router.post('/admin/ruangan/edit/:kode', upload.single("img"),PeminjamanController.update)

module.exports = router;