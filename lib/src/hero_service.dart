import 'package:angular/angular.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'hero.dart';

@Injectable()
class HeroService {
  static const _heroesUrl = 'api/heroes';

  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getHeroes() async {
    try {
      final response = await _http.get(_heroesUrl);
      final heroes = _extractData(response)
          .map((value) => new Hero.fromJson(value))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Server Error; cause: $e');
  }

  Future<Hero> getHero(int id) async {
    try {
      final reponse = await _http.get('$_heroesUrl/$id');
      return new Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Hero>> getHeroesSlowly() {
    return new Future.delayed(const Duration(seconds: 2), getHeroes);
  }
}
