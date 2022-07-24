import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Functions {
  static bool topmangaloded = false;
  static bool allmangaloded = false;
  static dynamic topTitles;
  static dynamic topImages;
  static dynamic topUrls;
  static List<dynamic> allTitles = [];
  static List<dynamic> allImages = [];
  static List<dynamic> allUrls = [];
  static final topUrl = Uri.parse('https://m.manganelo.com/genre-all-update-latest');
  static fetchTopManga() async {
    final response = await http.get(topUrl);
    dom.Document html = dom.Document.html(response.body);
    topImages =
        html.querySelectorAll('> img').map((e) => e.attributes['src']).toList();
    topImages.removeAt(0);
    topTitles =
        html.querySelectorAll('> img').map((e) => e.attributes['alt']).toList();
    topTitles.removeAt(0);
    topUrls = html
        .querySelectorAll('h3 >a')
        .map((e) => e.attributes['href'])
        .toList();
    topmangaloded = true;
  }

  static fetchAllManga() async {
    for (var i = 1; i < 10; i++) {
      final response =
          await http.get(Uri.parse('https://m.manganelo.com/genre-all/$i'));
      dom.Document html = dom.Document.html(response.body);
      allTitles.addAll(html
          .querySelectorAll('div.content-genres-item a > img')
          .map((e) => e.attributes['alt'])
          .toList());
      allImages.addAll(html
          .querySelectorAll('div.content-genres-item a > img')
          .map((e) => e.attributes['src'])
          .toList());
      allUrls.addAll(html
          .querySelectorAll('div.content-genres-item > a')
          .map((e) => e.attributes['href'])
          .toList());
    }
    allmangaloded = true;
  }

  static fetchDetails(url) async {
      final response = await http.get(Uri.parse(url));
      dom.Document html = dom.Document.html(response.body);
      print('.................${html.querySelector('rate_row_cmd')}');
  }

}