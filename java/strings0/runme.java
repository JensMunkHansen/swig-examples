// File runme.java

public class runme {

  static {
    try {
      System.loadLibrary("example");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. " + e);
      System.exit(1);
    }
  }

  public static void main(String argv[]) {
    String animals[] = {"Cat","Dog","Cow","Goat"};
    example.print_args(animals);
    String args[] = example.get_args();
    String hello = example.get_me();
    System.out.println(hello);
    for (int i=0; i<args.length; i++)
        System.out.println(i + ":" + args[i]);
  }
}
