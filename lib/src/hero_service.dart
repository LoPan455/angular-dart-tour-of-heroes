import 'package:angular/angular.dart';

import 'hero.dart';
import 'mock_heroes.dart';
import 'dart:async';

@Injectable()
class HeroService {
  Future<List<Hero>> getHeroes() async => mockHeroes;

  Future<Hero> getHero(int id) async =>
      (await getHeroes()).firstWhere((hero) => hero.id == id);

  Future<List<Hero>> getHeroesSlowly() {
    return new Future.delayed(const Duration(seconds: 2), getHeroes);
  }
}
