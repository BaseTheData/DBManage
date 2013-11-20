-- 1. Find all the stores along with city, state, phone, description, size, weight and unit  price that hold a particular item of stock.
SELECT item.item_id as a, store.store_id as b, city.city_id as c, city.city_name as d, city.state as e, store.phone as f, item.description as g,item.sizes as h, item.weight as i, item.unit_price as j FROM city, store, item, store_hold_item WHERE city.city_id = store.city_id AND store.store_id = store_hold_item.store_id AND store_hold_item.item_id = item.item_id AND item.item_id ='"+a+"' ORDER BY store.store_id;

-- 2. Find all the orders along with customer id and order date that can be fulfilled by a given store.

-- 3. Find all stores along with city name and phone that hold items ordered by a given customer.

-- 4. Find the headquarter address along with city and state of all stores that hold stocks of an item above a particular level.

-- 5. For each customer order, show the items ordered along with description, store id and city name and the stores that hold the items.

-- 6. Find the city and the state in which a given customer lives.

-- 7. Find the stock level of a particular item in all stores in a particular city.
SELECT 

-- 8. Find the items, quantity ordered, customer, store and city of an order.

-- 9. Find a list of employee customers with name and discount rate.
SELECT employee.Employee_customer_name as name, employee.Employee_discount_rate as dis FROM employee ORDER BY employee.Customer_id;;

-- 10. Find a list of non-employee customers with name and post address.
SELECT regular.Regular_customer_name as name, regular.Regular_customer_address as address FROM regular ORDER BY regular.Customer_id;

-- 11. Find a list of all customers sorted by sales volume in ascending order.

-- 12. Find a list of walk-in customer sorted by name.
SELECT walkin.Walkin_customer_name as name FROM walkin ORDER BY walkin.Walkin_customer_name;

-- 13. Find a list of eCommerce customer sorted by email address.
SELECT ecommerce.Ecommerce_customer_name FROM ecommerce ORDER BY ecommerce.Ecommerce_customer_email;