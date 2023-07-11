import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<Map<String, dynamic>> entries = [
    {
      'product': 'Shoes',
      'price': '\$100',
    },
    {
      'product': 'Shirt',
      'price': '\$50',
    },
    {
      'product': 'Pants',
      'price': '\$80',
    },
    {
      'product': 'Glasses',
      'price': '\$70',
    },
    {
      'product': 'Jacket',
      'price': '\$150',
    },
    {
      'product': 'Shoes',
      'price': '\$100',
    },
    {
      'product': 'Shirt',
      'price': '\$50',
    },
    {
      'product': 'Pants',
      'price': '\$80',
    },
    {
      'product': 'Glasses',
      'price': '\$70',
    },
    {
      'product': 'Jacket',
      'price': '\$150',
    },
    {
      'product': 'Shoes',
      'price': '\$100',
    },
    {
      'product': 'Shirt',
      'price': '\$50',
    },
    {
      'product': 'Pants',
      'price': '\$80',
    },
    {
      'product': 'Glasses',
      'price': '\$70',
    },
    {
      'product': 'Jacket',
      'price': '\$150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'search',
              border: OutlineInputBorder(),
            ),
          ),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${index + 1} ${entries[index]['product']}'),
                  subtitle: Text(
                    '${entries[index]['price']}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.permanentMarker().fontFamily,
                      color: Colors.green,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
