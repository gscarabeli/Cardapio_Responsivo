import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cardapio_responsivo/cardapio.dart';
import 'package:cardapio_responsivo/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  final List items = destaques;

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
              'Destaques do dia',
              style: TextStyle(fontFamily: "Caveat", fontSize: 32),
              textAlign: TextAlign.center,
            ),
          )),
          MediaQuery.of(context).orientation == Orientation.landscape
              ? const _landscapeList()
              : const _portraitList()
        ],
      ),
    );
  }
}

class _portraitList extends StatelessWidget {
  const _portraitList({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description']);
      }, childCount: items.length),
    );
  }
}

class _landscapeList extends StatelessWidget {
  const _landscapeList({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description']);
      }, childCount: items.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.05),
    );
  }
}
