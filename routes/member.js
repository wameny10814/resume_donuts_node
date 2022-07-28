const express = require('express');

const router = express.Router(); // 建立 router 物件
const db = require(__dirname + "/../modules/mysql-connect");

// router.get('/add', async (req, res)=>{
//        res.render('address-book/add');
//     });


//c
router.post('/add', async (req, res)=>{
   
    // if(! req.session.admin){
    //     return res.redirect('/');
    // }
    // const schema = Joi.object({
    //     name: Joi.string()
    //         .min(3)
    //         .required()
    //         .label('姓名必填'),
    //     email: Joi.string()
    //         .email()
    //         .required(),
    //     mobile: Joi.string(),
    //     birthday: Joi.any(),
    //     address: Joi.string(),
    // });
    // 自訂訊息
    // https://stackoverflow.com/questions/48720942/node-js-joi-how-to-display-a-custom-error-messages

    // console.log( schema.validate(req.body, {abortEarly: false}) );
    const sql ="INSERT INTO `member`(`account`, `pass_hash`, `birthday`, `email`, `level`, `creat_at`) VALUES (?,?,?,?,1,NOW())"
    const {account, pass_hash,birthday,email} = req.body;
    const [result] = await db.query(sql, [account, pass_hash, birthday, email]);

    
    res.json(result);

});

module.exports = router;