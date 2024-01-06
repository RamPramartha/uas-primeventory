const { Router } = require('express')
const router = Router();

const HomeController = require("../controller/homeController");

router.get("/", HomeController.index);

// router.post(
//     "/peminjaman/store",
//    //   upload.single("gambar"),
//      HomeController.store
//    );



module.exports = router;