import 'package:flutter/material.dart';
import 'package:pratices/screens/quote.dart';
import 'package:pratices/screens/quote_card.dart';

class QuotesList extends StatefulWidget {
  const QuotesList({super.key});

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quote> quotes = [
    Quote(
        text: 'Be yourself; everyone else is already taken',
        author: 'Smith Ese'),
    Quote(
        text: 'I have nothing to declare except my genius',
        author: 'Smith Ese'),
    Quote(
        text: 'The truth is rarely pure and never simple', author: 'Ese Smith')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome Quotes"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
