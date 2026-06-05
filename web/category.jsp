<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recycled Waste Categories</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #a8e6cf, #dcedc1); /* soft green gradient */
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
         h1 {
            color: #2e7d32;
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 40px;
        }
         .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 25px;
            max-width: 1200px;
            width: 100%;
        }

        .category {
            background-color: #ffffff;
            border-radius: 12px;
            width: calc((100% / 3) - 30px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-decoration: none;
            color: inherit;
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .category:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        .title {
            font-size: 1.2rem;
            color: #2e7d32;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .caption {
            font-size: 0.95rem;
            color: #555;
        }

        .back-link {
            margin-top: 30px;
            font-weight: bold;
            color: #2e7d32;
            text-decoration: none;
        }

        @media (max-width: 1024px) {
            .category {
                width: calc((100% / 2) - 20px);
            }
        }

        @media (max-width: 768px) {
            .category {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1>🌱 Choose a Category to Explore! 🌱</h1>
    <div class="container">
        <a href="subcategory.jsp?category=Paper and Cardboard" class="category">
            <div class="title">📄 Paper and Cardboard</div>
            <div class="caption">Recycle paper to conserve forests and resources.</div>
        </a>

        <a href="subcategory.jsp?category=Plastics and Wood" class="category">
            <div class="title">♻ Plastics and Wood</div>
            <div class="caption">Reduce waste and create new possibilities with plastics and wood.</div>
        </a>

        <a href="subcategory.jsp?category=Home and Decor" class="category">
            <div class="title">🏠 Home and Decor</div>
            <div class="caption">Transform waste into beautiful, functional decor items.</div>
        </a>

        <a href="subcategory.jsp?category=Glass" class="category">
            <div class="title">🧴 Glass</div>
            <div class="caption">Recycle glass to minimize landfill usage and promote sustainability.</div>
        </a>

        <a href="subcategory.jsp?category=Textiles" class="category">
            <div class="title">👕 Textiles</div>
            <div class="caption">Give fabrics and clothing a second life by recycling and reusing.</div>
        </a>
    </div>

    <a href="home.jsp" class="back-link">← Back to Home</a>
</body>
</html>