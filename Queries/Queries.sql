-- 1. Find all the stores along with city, state, phone, description, size, weight and unit  price that hold a particular item of stock.
SELECT item.item_id as a, store.store_id as b, city.city_id as c, city.city_name as d, city.state as e, store.phone as f, item.description as g,item.sizes as h, item.weight as i, item.unit_price as j FROM city, store, item, store_hold_item WHERE city.city_id = store.city_id AND store.store_id = store_hold_item.store_id AND store_hold_item.item_id = item.item_id AND item.item_id ='"+a+"' ORDER BY store.store_id;

-- 2. Find all the orders along with customer id and order date that can be fulfilled by a given store.
SELECT Orders.order_no as order, Orders.Customer_id as id, Orders.order_date as orderdate FROM orders, Order_contains_items, Store_hold_Item WHERE Store_hold_Item.store_id='"+a+"' AND Order_contains_items.order_no=orders.order_no AND NOT EXISTS (SELECT * FROM Order_contains_items, Store_hold_Item WHERE Order_contains_items.quantity_ordered>Store_hold_Item.quantity_held AND Store_hold_Item.store_id='"+a+"' AND Order_contains_items.order_no=orders.order_no);

-- 3. Find all stores along with city name and phone that hold items ordered by a given customer.
SELECT Store_hold_Item.item_id as items, Store_hold_Item.store_id as stores, city.city_name as city, store.phone as phone FROM Store_hold_Item, store, city WHERE (Store_hold_Item.item_id IN (SELECT Order_contains_items.item_id FROM Order_contains_items WHERE Order_contains_items.order_no = Orders.order_no AND Orders.Customer_id ='"+a+"')) AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id;

-- 4. Find the headquarter address along with city and state of all stores that hold stocks of an item above a particular level.
SELECT city.city_name as city, state.state as state, state.headquarter_addr as hq FROM city, state, Store_hold_Item, store WHERE Store_hold_Item.item_id='"+a+"' AND Store_hold_Item.quantity_held>'"+b+"' AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id AND city.state=state.state;

-- 5. For each customer order, show the items ordered along with description, store id and city name and the stores that hold the items.
SELECT Order_contains_items.item_id as id, item.description as des, store.store_id as store, city.city_name as city FROM Order_contains_items, item, store, city, Store_hold_Item WHERE Order_contains_items.order_no='"+a+"' AND Order_contains_items.item_id=item.item_id AND Store_hold_Item.item_id=item.item_id AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id;

-- 6. Find the city and the state in which a given customer lives.
SELECT city.city_name as city, city.state as state FROM city, customer WHERE Customer.Customer_id='"+a+"' AND Customer.city_id=city.city_id;

-- 7. Find the stock level of a particular item in all stores in a particular city.
SELECT SUM(Store_hold_Item.quantity_held) as stock, city.city_name as city, item.item_id as id, item.description as des FROM Store_hold_Item, city, store WHERE Store_hold_Item.item_id='"+b+"' AND store.store_id=Store_hold_Item.store_id AND city.city_id=store.city_id AND city.city_name='"+a+"';

-- 8. Find the items, quantity ordered, customer and city of an order.
SELECT Order_contains_items.item_id as item, item.description as des, Order_contains_items.quantity_ordered as qo, Orders.Customer_id as customer, city.city_name as city FROM orders, item, Order_contains_items, customer, city WHERE Order_contains_items.order_no='"+a+"' AND Order_contains_items.order_no=orders.order_no AND item.item_id=Order_contains_items.item_id AND Orders.Customer_id=Customer.Customer_id AND Customer.city_id=city.city_name;

-- 9. Find a list of employee customers with name and discount rate.
SELECT employee.Employee_customer_name as name, employee.Employee_discount_rate as dis FROM employee ORDER BY employee.Customer_id;

-- 10. Find a list of non-employee customers with name and post address.
SELECT regular.Regular_customer_name as name, regular.Regular_customer_address as address FROM regular ORDER BY regular.Customer_id;

-- 11. Find a list of all customers sorted by sales volume in ascending order.
SELECT Regular.Regular_customer_name as name, SUM(Order_contains_items.ordered_price) as sales FROM regular, Order_contains_items WHERE regular.Customer_id=orders.Customer_id AND Order_contains_items.order_no=orders.order_no UNION SELECT Employee.Employee_customer_name as name, SUM(Order_contains_items.ordered_price) as sales FROM employee, Order_contains_items WHERE employee.Customer_id=orders.Customer_id AND Order_contains_items.order_no=orders.order_no ORDER BY sales;

-- 12. Find a list of walk-in customer sorted by name.
SELECT walkin.Walkin_customer_name as name FROM walkin ORDER BY walkin.Walkin_customer_name;

-- 13. Find a list of eCommerce customer sorted by email address.
SELECT ecommerce.Ecommerce_customer_name as name, ecommerce.Ecommerce_customer_email as email FROM ecommerce ORDER BY email;