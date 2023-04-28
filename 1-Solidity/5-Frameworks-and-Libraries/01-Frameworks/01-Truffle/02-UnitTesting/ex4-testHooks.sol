import "truffle/Assert.sol";

contract TestHooks {

  uint someValue;

  function beforeEach() {
    someValue = 5;
  }

  function beforeEachAgain() {
    someValue += 1;
  }

  function testSomeValueIsSix() {
    uint expected = 6;
    Assert.equal(someValue, expected, "someValue should have been 6");
  }
}