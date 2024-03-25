import 'package:cardapio_responsivo/cardapio.dart';
import 'package:cardapio_responsivo/components/drink_item.dart';
import 'package:flutter/material.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Bebidas',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return DrinkItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price']);
            }, childCount: items.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1.2
                        : 158 / 194),
          ),
        ],
      ),
    );
  }
}
