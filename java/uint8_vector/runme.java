public class run {
        public static void main(String[] argv) {
                for (int i = 0; i < 100; ++i) {
                        java.nio.ByteBuffer buf = test.do_capture();
                        System.gc();
                }
        }
}
