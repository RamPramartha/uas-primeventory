const { Router } = require('express')
const router = Router();

const PeminjamanUserController = require("../controller/peminjamanUserController");

router.get("/peminjaman/:kode", PeminjamanUserController.index);

router.post("/peminjaman/store", PeminjamanUserController.store);


module.exports = router;