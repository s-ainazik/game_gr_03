import 'game_character.dart';
import 'rpg_game.dart';
import 'heroes.dart';

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false; // добавлено для Thor
  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    // variants.shuffle();
    // defence = variants.first;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0, 1, 2, 3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    if (isStunned) {
      print('Boss is stunned and misses this round!');
      isStunned = false;
      return;
    }
    Golem? golem; // живой ли голем
    for (var hero in heroes) {
      if (hero is Golem && hero.health > 0) {
        golem = hero;
        break;
      }
    }
    for (var hero in heroes) {
      if (hero.health > 0) {
        if (hero is Berserk && defence != hero.ability) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5 or 10
          hero.blockedDamage = block;
          hero.health -= (damage - block);
        } else {
          hero.health -= damage;
        }

        if (hero is Lucky) {
          // Lucky — 25% шанс уклонения
          if (RpgGame.random.nextInt(100) < 25) {
            print('Lucky ${hero.name} dodged the attack!');
            continue;
          }
        }

        if (golem != null && hero != golem && golem.health > 0) { // Golem принимает 1/5 урона союзников 
          int redirectedDamage = damage ~/ 5;
          golem.health -= redirectedDamage;
        }
      }
    }
  }

  @override
  String toString() {
    return 'BOSS ${super.toString()} Defence = ${defence == null ? "No defence" : defence!.name}';
  }
}
