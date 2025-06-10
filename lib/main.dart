import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amajon Store',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade50,
        colorScheme: ColorScheme.light(
          primary: Colors.green,
          secondary: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ECommerceScreen(),
    );
  }
}

class ECommerceScreen extends StatelessWidget {
  const ECommerceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BelanjaKu App'),
        centerTitle: true,
        actions: const [Icon(Icons.notifications)],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // Banner Promo Baru
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: colorScheme.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                'FLASH SALE S/D JAM 9 MALAM!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Highlight Fitur
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.card_giftcard, color: Colors.orange),
                SizedBox(width: 8.0),
                Text('Voucher Belanja Setiap Hari'),
                SizedBox(width: 8.0),
                Icon(Icons.eco, color: Colors.green),
              ],
            ),

            // Produk A
            buildProductContainer(
              title: 'Kemeja Flanel',
              price: 'Rp 199.000',
              rating: '4.7/5',
              estDelivery: 'Est. 2-3 hari',
              bgColor: Colors.green.shade50,
              buttonColor: Colors.green,
            ),

            // Produk B
            buildProductContainer(
              title: 'Jam Tangan Kulit',
              price: 'Rp 450.000',
              rating: '4.6/5',
              estDelivery: 'Est. 3-4 hari',
              bgColor: Colors.yellow.shade50,
              buttonColor: Colors.amber,
            ),

            // Kategori Baru
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      CategoryItem(icon: Icons.chair, label: 'Perabot'),
                      CategoryItem(icon: Icons.fastfood, label: 'Makanan'),
                      CategoryItem(icon: Icons.pets, label: 'Hewan'),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      CategoryItem(icon: Icons.brush, label: 'Dekorasi'),
                      CategoryItem(icon: Icons.book, label: 'Buku'),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              color: Colors.green.shade100,
              child: const Text(
                'Belanja Nyaman, Harga Aman!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Toko',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_basket),
      ),
    );
  }

  Widget buildProductContainer({
    required String title,
    required String price,
    required String rating,
    required String estDelivery,
    required Color bgColor,
    required Color buttonColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                price,
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                onPressed: () {},
                child: const Text('Beli'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 18.0),
              const SizedBox(width: 4.0),
              Text(rating),
              const SizedBox(width: 12.0),
              const Icon(Icons.local_shipping, color: Colors.teal, size: 18.0),
              const SizedBox(width: 4.0),
              Text(estDelivery),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 6.0),
        Text(label),
      ],
    );
  }
}
