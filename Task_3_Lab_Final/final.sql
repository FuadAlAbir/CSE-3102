 
SELECT Cust_id, COUNT(Item_id) AS 'Total Items', SUM(qty_sold) AS 'Total Quantity' FROM Sale GROUP BY Cust_id;

SELECT Cust_id, bill_no, bill_date, Sale.Item_id, qty_sold, price*qty_sold AS 'Total Price' FROM Item, Sale WHERE Item.Item_id = Sale.Item_id;

SELECT cust_name, SUM(qty_sold) AS 'Total Quantity', SUM(qty_sold*price) AS 'Total bill' FROM Customer, Item, Sale WHERE Customer.Cust_id = Sale.Cust_id AND Item.Item_id = Sale.Item_id GROUP BY Customer.Cust_id;
