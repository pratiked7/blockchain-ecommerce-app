const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/blockEcommDB");


const paymentSchema = new mongoose.Schema({
    id: String,
    itemId: String,
    paid: Boolean
});

const Payment = mongoose.model("Payment", paymentSchema);

module.exports ={
    Payment
}