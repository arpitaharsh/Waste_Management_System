<%@ page import="java.sql.*, java.util.*, java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String category = request.getParameter("category");
    if (category == null) {
        category = "Unknown Category";
    }
       class Product {
        String id, name, image, price;
        Product(String id, String name, String image, String price) {
            this.id = id;
            this.name = name;
            this.image = image;
            this.price = price;
        }
    }
  List<Product> products = new ArrayList<>();
if ("Plastics and Wood".equalsIgnoreCase(category)) {
        products.add(new Product("PW001", "Plastic Bottle Hanging", "images/images/PW1.png", "310.50"));
        products.add(new Product("PW002", "Wooden Wall Shelf", "images/images/PW2.png", "2270.50"));
        products.add(new Product("PW003", "Zig Zag Wall Corner Shelf", "images/images/PW3.png", "6110.50"));
        products.add(new Product("PW004", " Cute Pen/Pencil Holder(Set of 2)", "images/images/PW4.png", "970.50"));
        products.add(new Product("PW005", "Recycled Plastic Decorative Items", "images/images/PW5.png", "610.50"));
        products.add(new Product("PW006", "PET Plastic Bottle watering Can", "images/images/PW6.png", "270.50"));
        products.add(new Product("PW007", "Pallet Wood Bench", "images/images/PW7.png", "5110.50"));
        products.add(new Product("PW008", "Recycled Wood Shelf", "images/images/PW8.png", "2270.50"));
        products.add(new Product("PW009", "Decorative Candle Holder", "images/images/PW9.png", "510.50"));
        products.add(new Product("PW0010", "Recycled Plastic Bottle Planters(Set of 4)", "images/images/PW10.png", "1270.50"));
        products.add(new Product("PW0011", "Decorative Flower Baskets(set of 2)", "images/images/PW11.png", "610.50"));
        products.add(new Product("PW0012", "Triangle Wood Shelves", "images/images/PW12.png", "2270.50"));
        products.add(new Product("PW0013", "Lord Ganesha Idols", "images/images/PW13.png", "3110.50"));
        products.add(new Product("PW0014", "Plastic Bottle Planters(Set of 4)", "images/images/PW14.png", "1270.50"));
        products.add(new Product("PW0015", "Recycled plastic Bottle Decor(Set of 4)", "images/images/PW15.png", "910.50"));
        products.add(new Product("PW0016", "Recycled Plastic Bottle Planters(set  of 3)", "images/images/PW16.png", "1270.50"));
        products.add(new Product("PW0017", "Decorative Wall Hanging", "images/images/PW17.png", "1110.50"));
        products.add(new Product("PW0018", "Recycled Plastic Bags(Set of 3)", "images/images/PW18.png", "470.50"));
        products.add(new Product("PW0019", "Recycled Bottle Cap Decor", "images/images/PW19.png", "910.50"));
        products.add(new Product("PW0020", "Decorative Hangings", "images/images/PW20.png", "870.50"));
        products.add(new Product("PW0021", "Decorative Birdhouses(Set of 3)", "images/images/PW21.png", "810.50"));
        products.add(new Product("PW0022", "Recycled Bottle Fairy Houses(Set of 2)", "images/images/PW22.png", "970.50"));
        } 
else if ("Glass".equalsIgnoreCase(category)) {
        products.add(new Product("GG001", "Decorative Planters(Set of 6)", "images/images/G1.png", "1700.50"));
        products.add(new Product("GG002", "Recycled Wine Bottles Decor Items(Set of 4)", "images/images/G2.png", "1900.50"));
        products.add(new Product("GG003", "Hand Painted Recycled Bottle Vases(Set of 3)", "images/images/G3.png", "1100.50"));
        products.add(new Product("GG004", "Butterfly Crafted From Broken Glass Pieces","images/images/G4.png", "1099.50"));
        products.add(new Product("GG005", "Recycled Glass Bottles Decor(Set of 3)", "images/images/G5.png", "1099.50"));
        products.add(new Product("GG006", "Wine Glass Candle Holder(Set of 3)", "images/images/G6.png", "1450.50"));
        products.add(new Product("GG007", "Decorated Glass Jars(Set of 3)", "images/images/G7.png", "1210.50"));
        products.add(new Product("GG008", "Decorative Photo Frame", "images/images/G8.png", "450.50"));
        products.add(new Product("GG009", "Glass Mug Decor", "images/images/G9.png", "870.50"));
        products.add(new Product("GG0010", "Handcrafted Recycled Bottle Art", "images/images/G10.png", "950.50"));
        products.add(new Product("GG0011", "Bottle Planters(Set of 1)", "images/images/G11.png", "210.50"));
        products.add(new Product("GG0012", "Decorative Planters(Set of 2)", "images/images/G12.png", "1550.50"));
         products.add(new Product("GG0013", "Painted Glass Jars(Set of 2)", "images/images/G13.png", "910.50"));
          products.add(new Product("GG0014", "Crushed Glass Picture Frame", "images/images/G14.png", "610.50"));
           products.add(new Product("GG0015", "Painted Glass Jars(set of 3)", "images/images/G15.png", "1110.50"));
            products.add(new Product("GG0016", "Handcrafted planters", "images/images/G16.png", "510.50"));
             products.add(new Product("GG0017", "Recycled Decorated Wine Bottle Vases(Set of 1)", "images/images/G17.png", "410.50"));
             products.add(new Product("GG0018", "Chandelier Crafted From Numerous Colourful Tubes", "images/images/G18.png", "1110.50"));
        products.add(new Product("GG0019", "Recycled Test Tube Decor", "images/images/G19.png", "889.50"));
        }
else if ("Textiles".equalsIgnoreCase(category)) {
        //else if(category.equals("Textiles")) {
        products.add(new Product("TT001", "Women Shoulder Bag", "images/images/T1.png", "720.00"));
        products.add(new Product("TT002", "Hanging Planters", "images/images/T2.png", "220.00"));
        products.add(new Product("TT003", "Recycled Women Top", "images/images/T3.png", "1120.00"));
        products.add(new Product("TT004", "Jute Fashion Bags", "images/images/T4.png", "920.00"));
        products.add(new Product("TT005", "Decorative Mat", "images/images/T5.png", "720.00"));
        products.add(new Product("TT006", "Recycled Sweaters Pillow Covers(Set of 3)", "images/images/T6.png", "1220.00"));
        products.add(new Product("TT007", "Handmade Jute Bicycle With Flower Baskets", "images/images/T7.png", "520.00"));
        products.add(new Product("TT008", "Recycled Jeans Footwear", "images/images/T8.png", "420.00"));
        products.add(new Product("TT009", "Recycled Clothes Cushion", "images/images/T9.png", "1020.00"));
        products.add(new Product("TT0010", "Handmade Circular Rag Rug", "images/images/T10.png", "820.00"));
        products.add(new Product("TT0011", "Recycled Barbie Doll Clothes", "images/images/T11.png", "320.00"));
        products.add(new Product("TT0012", "Recycled Women's Clothing", "images/images/T12.png", "920.00"));
        products.add(new Product("TT0013", "Recycled Clothes Bag", "images/images/T13.png", "720.00"));
        products.add(new Product("TT0014", "Barbie Doll Clothing", "images/images/T14.png", "1220.00"));
        products.add(new Product("TT0015", "Jute Slippers", "images/images/T15.png", "520.00"));
        products.add(new Product("TT0016", "Recycled Jute Basket", "images/images/T16.png", "420.00"));
        products.add(new Product("TT0017", "Recycled Shoes", "images/images/T17.png", "1120.00"));
        products.add(new Product("TT0018", "Decorative Basket", "images/images/T18.png", "420.00"));
        products.add(new Product("TT0019", "Recycled Clothes Apron ", "images/images/T19.png", "1020.00"));
        products.add(new Product("TT0020", "Recycled Men's Clothing", "images/images/T20.png", "790.00"));
        products.add(new Product("TT0021", "Recycled Clothes Toy For Kids", "images/images/T21.png", "620.00"));
        products.add(new Product("TT0022", "Recycled Sweater Planters/Decors(Set of 4)", "images/images/T22.png", "1120.00"));
    }
else if ("Home and Decor".equalsIgnoreCase(category)) {
        products.add(new Product("HD001", "Recycled Hanging Planters(Set of 2)", "images/images/HD1.png", "370.90"));
        products.add(new Product("HD002", "Flower Vase Made With Jute Rope", "images/images/HD2.png", "310.50"));
        products.add(new Product("HD003", "Floral Hanging Made With Waste Bangles", "images/images/HD3.png", "910.50"));
        products.add(new Product("HD004", "Decorative Bottle With Ladder", "images/images/HD4.png", "899.00"));
        products.add(new Product("HD005", "Square Recycled Newspaper Pencil Holder", "images/images/HD5.png", "299.00"));
        products.add(new Product("HD006", "Waste Bottle Decor(Set of 3)", "images/images/HD6.png", "1300.50"));
        products.add(new Product("HD007", "Wall Hanging Made With Paper Cups", "images/images/HD7.png", "420.50"));
        products.add(new Product("HD008", "Rajasthani Showpiece", "images/images/HD8.png", "540.50"));
        products.add(new Product("HD009", "Handcrafted Bamboo Peacock", "images/images/HD9.png", "299.00"));
        products.add(new Product("HD0010", "Decorated Garland ", "images/images/HD10.png", "250.50"));
        products.add(new Product("HD0011", "Painted Recycled Bottle Art", "images/images/HD11.png", "310.50"));
        products.add(new Product("HD0012", "Wall Hanging Made From Waste Ice-cream Sticks", "images/images/HD12.png", "299.50"));
        products.add(new Product("HD0013", "Recycled Wine Bottle Decors", "images/images/HD13.png", "560.50"));
        products.add(new Product("HD0014", "Recycled Wine Bottle Table Decors(Set of 4)", "images/images/HD14.png", "989.00"));
        products.add(new Product("HD0015", "Recycled Wool and Bangles Wall Hanging", "images/images/HD15.png", "310.50"));
        products.add(new Product("HD0016", "Pen/Pencil Holder ", "images/images/HD16.png", "329.50"));
        products.add(new Product("HD0017", "Flower Pots", "images/images/HD17.png", "310.50"));
         products.add(new Product("HD0018", "Recycled Wine Bottle Decor(Set of 3)", "images/images/HD18.png", "1310.50"));
          products.add(new Product("HD0019", "Decorated Wall Hanging", "images/images/HD19.png", "1029.50"));
           products.add(new Product("HD0020", "Decorated Flower Basket", "images/images/HD20.png", "910.50"));
           products.add(new Product("HD0021", "Floral Wall Hanging", "images/images/HD21.png", "610.50"));
        } 
else if ("Paper and Cardboard".equalsIgnoreCase(category)) {
        products.add(new Product("PC001", "Cardboard Box", "images/images/PC1.png", "380.00"));
        products.add(new Product("PC002", "Decorative Hangings", "images/images/PC2.png", "460.00"));
        products.add(new Product("PC003", "Recycled Paper Creativity", "images/images/PC3.png", "380.00"));
        products.add(new Product("PC004", "Recycled Paper teacup & Saucer Set", "images/images/PC4.png", "460.00"));
        products.add(new Product("PC005", "Colourful Strawberry themed Baskets(Set of 5)", "images/images/PC5.png", "680.00"));
        products.add(new Product("PC006", "Decorated Cardboard Box", "images/images/PC6.png", "460.00"));
        products.add(new Product("PC007", " Pink Decorated Gift Box", "images/images/PC7.png", "480.00"));
        products.add(new Product("PC008", "Light Purple Gift Box with Ribbon", "images/images/PC8.png", "560.00"));
        products.add(new Product("PC009", "Paper Pen/Pencil Holder", "images/images/PC9.png", "280.00"));
        products.add(new Product("PC0010", "Happy Birthday Banner ", "images/images/PC10.png", "460.00"));
        products.add(new Product("PC0011", "Decorative Pen/Pencil Holder", "images/images/PC11.png", "580.00"));
        products.add(new Product("PC0012", "Cardboard Gift Box", "images/images/PC12.png", "760.00"));
        products.add(new Product("PC0013", "Recycled Floral Diary", "images/images/PC13.png", "280.00"));
        products.add(new Product("PC0014", "Purple Basket Using Recycled Cardboard", "images/images/PC14.png", "360.00"));
        products.add(new Product("PC0015", "Colorful Paper Cups Garland", "images/images/PC15.png", "380.00"));
        products.add(new Product("PC0016", "Handcrafted Decorative Bowl & Lid", "images/images/PC16.png", "460.00"));
        products.add(new Product("PC0017", "Handcrafted Desk Organizer", "images/images/PC17.png", "380.00"));
        products.add(new Product("PC0018", "Handcrafted Paper Bags(Set of 2)", "images/images/PC18.png", "760.00"));
        products.add(new Product("PC0019", "Recycled Floral Spiral Diary", "images/images/PC19.png", "280.00"));
        products.add(new Product("PC0020", "Decorative Hangings(Set of 3)", "images/images/PC20.png", "960.00"));
    }
Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

        for (Product p : products) {
            String checkSql = "SELECT p_id FROM recycled_products WHERE p_id = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, p.id);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                String insertSql = "INSERT INTO recycled_products (p_id, p_name, p_price, category) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, p.id);
                pstmt.setString(2, p.name);
                pstmt.setString(3, p.price);
                pstmt.setString(4, category);
                pstmt.executeUpdate();
            }
            rs.close();
            pstmt.close();
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new PrintWriter(out));
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= category %> Products</title>
   <style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #f0f9f9, #e6f7e6);
        margin: 0;
        padding: 30px;
        color: #333;
    }

    h1 {
        text-align: center;
        color: #1b5e20;
        font-size: 36px;
        margin-bottom: 40px;
        text-transform: uppercase;
        letter-spacing: 2px;
        position: relative;
    }

    h1::after {
        content: "";
        display: block;
        width: 80px;
        height: 4px;
        background: #43a047;
        margin: 10px auto 0;
        border-radius: 5px;
    }

    .container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 30px;
        max-width: 1300px;
        margin: 0 auto;
    }

    .product {
        background: #fff;
        border-radius: 18px;
        padding: 20px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        overflow: hidden;
    }

    .product:hover {
        transform: translateY(-12px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
    }

    .product img {
        width: 100%;
        height: 250px;
        object-fit: contain;
        border-radius: 12px;
        background: #f8f8f8;
        margin-bottom: 15px;
        transition: transform 0.3s ease;
    }

    .product:hover img {
        transform: scale(1.05);
    }

    .product h3 {
        color: #2e7d32;
        font-size: 20px;
        margin: 10px 0;
        font-weight: 600;
    }

    .product p {
        color: #555;
        font-size: 15px;
        margin: 4px 0;
        line-height: 1.6;
    }

    .buy-btn {
        background: linear-gradient(45deg, #2e7d32, #66bb6a);
        color: white;
        padding: 12px 22px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: bold;
        margin-top: 12px;
        box-shadow: 0 4px 12px rgba(76,175,80,0.4);
        transition: all 0.3s ease;
    }

    .buy-btn:hover {
        background: linear-gradient(45deg, #1b5e20, #43a047);
        transform: scale(1.08);
        box-shadow: 0 6px 18px rgba(67,160,71,0.6);
    }

    .back-link {
        text-align: center;
        margin-top: 50px;
        display: block;
        color: #1b5e20;
        font-weight: bold;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #43a047;
        text-decoration: underline;
    }
   </style>
</head>
<body>
    <h1><%= category %> Products</h1>
    <div class="container">
    <% for (Product p : products) { %>
        <div class="product">
            <img src="<%= p.image %>" alt="<%= p.name %>">
            <h3><%= p.name %></h3>
            <p><strong>ID:</strong> <%= p.id %></p>
            <p><strong>Price:</strong> ₹<%= p.price %></p>
            <a href="buy.jsp?id=<%= p.id %>&name=<%= p.name %>&price=<%= p.price %>" class="buy-btn">Buy Now</a>
        </div>
    <% } %>
    </div>
    <a href="category.jsp" class="back-link">← Back to Categories</a>
</body>
</html>
