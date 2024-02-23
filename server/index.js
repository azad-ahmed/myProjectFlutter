const express = require("express");
const mongoose = require('mongoose')

const authRouter = require("./routes/auth")

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://azad:blog1234@cluster0.lwqfhgn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"


app.use(express.json());
app.use(authRouter);

mongoose
    .connect(DB)
    .then(() => {
    console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, "0.0.0.0",() => {
    console.log(`connected at port ${PORT}`);
});


