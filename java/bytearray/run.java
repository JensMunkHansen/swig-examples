public class run {
  // static {
  //   System.loadLibrary("mymodule");
  // }
  public static void main(String[] argv) {
    for (int i = 0; i < 100; ++i) {
      String s = new String();
      mymodule.compress_buffer_to_file(s);
      System.gc();
    }
  }
}
