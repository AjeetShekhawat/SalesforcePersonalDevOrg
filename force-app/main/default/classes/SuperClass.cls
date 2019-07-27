public virtual class SuperClass {
    public virtual void printName() {
        System.debug('From SuperClass');
    }
    public class Subclass extends Superclass {
      public override void printName() {
            System.debug('From SubClass');
        }
    }
}
/**
 * calling to subclass method
 * SuperClass.Subclass sc = new SuperClass.Subclass();
   sc.printName();
*/