liz = User.create(email: "liz@gmail.com", password: "liz")

fiona = User.create(email: "fiona@gmail.com", password: "fiona")

Product.create(name: "Maybelline Great Lash Mascara", image_url: "https://images-na.ssl-images-amazon.com/images/I/71py7OOsRlL._SY355_.jpg", rating: 4, description: "Dark brown mascara with a fat brush. Lash doubling formula that conditions as it thickens.", user_id: liz.id)

Product.create(name: "Paula's Choice 2% BHA Liquid Exfoliant", image_url: "https://www.paulaschoice.com/dw/image/v2/BBNX_PRD/on/demandware.static/-/Sites-pc-catalog/default/dw7468afd4/images/products/skin-perfecting-2-percent-bha-liquid-2010-L.png?sw=360&sfrm=png", rating: 5, description: "Gentle, leave-on exfoliant with salicylic acid. Smooths, brightens, and evens out skin tone. Good for all skin types.", user_id: liz.id)

Product.create(name: "Glossier Generation G Lipstick", image_url: "https://images.ctfassets.net/p3w8f4svwgcg/5fvl7va5eRy41Lh264z5ay/cdc11be1f043cd64092089f22dd72092/GenG_HP_2.jpg", rating: 5, description: "Sheer, matte, blotted lipstick without the blot. Buildable color.", user_id: fiona.id)

Product.create(name: "Maybelline Superstay Matte Ink Liquid Lipstick", image_url: "https://cdn-img.prettylittlething.com/c/7/a/b/c7abd20b885b630ffdd6853c6ceb728397b3539c_CLW4737_1.JPG", rating: 4, description: "Intensely pigmented, 16 hr wear, matte liquid lipstick. Doe foot applicator. Non-drying formula.", user_id: fiona.id)

Review.create(content: "I really love these liquid lipsticks! They go on creamy and dry matte. Once they're dry they don't budge. It won't come off on clothes, even a napkin. I have 3 colors- a red, a pink and a neutral and love them all. I highly recommend these if you like the matte look.", product_id: 6, user_id: fiona.id)
