--1
select name, description, condition from Product ORDER BY name ASC;

--2
select name, surname, email from UserData where gold_flag='Y' and gold_start_date LIKE '%20%';

--3
select name, surname from UserData UD, Bid B where UD.email=B.bidder_email and bidding_date='22/08/2018';

--4
select P.name, description from Product P, UserData UD where P.seller_email=UD.email and UD.name='donald' and UD.surname='trump';

--5
select P.name, P.description, B.bidding_price as maximum_bid from Product P, AuctionProduct AP, Bid B where AP.id=B.bid_product_id and AP.id=P.id and B.bidding_price in (select MAX(bidding_price) from Bid group by bid_product_id);

--6
select P.name, P.description from Product P, AuctionProduct AP where P.id=AP.id and AP.id NOT IN (select AP.id from Bid B, AuctionProduct AP where AP.id=B.bid_product_id);
