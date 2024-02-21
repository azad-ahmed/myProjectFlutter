const express = require("express");
const mongoose = require('mongoose')

const authRouter = require("./routes/auth")

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://azadahmed:mongodb1234@cluster0.dyz2ecv.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

app.use(authRouter);

mongoose
    .connect(DB)
    .then(() => {
    console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, () => {
    console.log(`connected at port ${PORT}`);
});