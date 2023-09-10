// creation of all the entities

db.createCollection("User");
db.createCollection("Category");
db.createCollection("Item");
db.createCollection("Order");

// Show commands for inserting records into the entities
db.User.insertOne({ _id: 1, username: "Mujeeb", user_type: "admin" });

db.Category.insertOne({ _id: 1, category_name: "Electronics" });

db.Item.insertOne({
  _id: 1,
  item_name: "Laptop",
  price: 999.99,
  size: "Medium",
  category_id: 1,
});

db.Order.insertOne({
  _id: 1,
  order_date: new Date(),
  order_status: "Pending",
  user_id: 1,
  item_id: 1,
});

// Show commands for getting records from two or more entities
db.User.find({ _id: 1 });
db.Category.find({ _id: 1 });
db.Item.find({ _id: 1 });
db.Order.find({ _id: 1 });

// Show commands for updating records from two or more entities
db.Order.updateOne(
  { order_status: "Pending" },
  { $set: { order_status: "Approved" } }
);
db.Item.updateOne({ item_name: "Laptop" }, { $set: { price: 1000 } });

// Show commands for deleting records from two or more entities

db.Order.DeleteOne({ user_id: 1 });
db.Item.DeleteOne({ item_name: "Laptop" });
