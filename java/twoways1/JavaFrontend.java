//JavaFrontend.java
import java.util.List;
import java.util.ArrayList;

public class JavaFrontend {
  static {
    System.loadLibrary("CBackend");
  }
  public static void main( String[] args ) {
    JobPool jobPool = new JobPoolImpl();
    new Server().doSomething(jobPool);
  }

  public static class JobPoolImpl extends JobPool {
    private List<PersonImpl> people = new ArrayList<>();
    public Person hireSomeone() {
      if ( people.size() > 0 ) {
        Person person = people.get(0);
        people.remove(person);
        return person;
      } else {
        System.out.println("returning new PersonImpl");
        return new PersonImpl();
      }
    }
    public void returnToJobPool(Person person) {
      people.add((PersonImpl)person);
    }
  }

  public static class PersonImpl extends Person {
    public void doSomeWorkForMe(int i) {
      System.out.println("Java working for me: "+i);
    }
  }
}
