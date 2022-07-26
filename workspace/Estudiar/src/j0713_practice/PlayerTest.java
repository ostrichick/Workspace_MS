package j0713_practice;

public class PlayerTest {

  public static void main(String[] args) {
    Player player = new Player();
    BeginnerLevel newB = new BeginnerLevel();
    newB.run();
    newB.showLevelMessage();
    newB.go(3);
    newB.getClass();
    System.out.println(player.getLevel());
    player.play(2);

    IntermediateLevel iLevel = new IntermediateLevel();
    player.upgradeLevel(iLevel);
    player.play(2);

    AdvancedLevel aLevel = new AdvancedLevel();
    player.upgradeLevel(aLevel);
    player.play(3);
  }
}
