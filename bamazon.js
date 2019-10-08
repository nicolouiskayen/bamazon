var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "password",
  database: "bamazon_db"
});

connection.connect(function(err) {
    if (err) throw err;
    afterConnection();
  });

function afterConnection () {
    connection.query("Select * FROM products", function(err,res){
        if(err) throw err;
        for (var i=0; i<res.length;i++) {
            console.log(res[i].id + " " + res[i].product_name + " $" + res[i].price)
        }
        prompt()
    })
}

function prompt () {
    inquirer.prompt([{
        name: "productChoice",
        type: "input",
        message: "Which number item would you like?",
        validate: function(value) {
            if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
    }, {
        name: "howMany",
        type: "input",
        message: "How many would you like?",
        validate: function(value) {
            if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
    }]).then(function(answer) {
        var query = "Select price, stock_quantity FROM products WHERE ?"
        connection.query(query, {id: answer.productChoice}, function(err,res) {
            if (err) throw err;
            var stock = res[0].stock_quantity;
            var price = res[0].price;
            if (stock>=answer.howMany) {
                checkout(stock, price, answer.productChoice, answer.howMany)
            } else {
                console.log("We don't have enough!")
                prompt()
            }
        })
    })
};

function checkout(stock, price, id, user_quantity) {
    var newStock = stock - user_quantity;
    var total = parseInt(price * user_quantity);
    var query = "UPDATE products SET ? WHERE ?"
    connection.query(query, [{
        stock_quantity: newStock,
    }, {
        id: id
    }], function (err, res) {
        if (err) throw err;
        console.log("Purchase complete! Total: $" + total)
    })
}