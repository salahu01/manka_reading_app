import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Functions {
  static bool mangaloded = false;
  static dynamic titles;
  static dynamic images;

  static final url = Uri.parse('https://m.manganelo.com/www');
  static fetchManga() async {
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    titles=html.querySelectorAll('h3 > a').map((e) => e.innerHtml.trim()).toList();
    images = html.querySelectorAll('> img').map((e) => e.attributes['src']).toList();
    images.removeAt(0);
    mangaloded = true;
  }
}
