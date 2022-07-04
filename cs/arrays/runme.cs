using System;
public class runme {
    static void Main() {
        int[] array = new int[] {0, 1, 2, 3, 4};
        test.myArrayCopy(array, 5);

        int[] arrayOut = new int[] {0, 1, 2, 3, 4};
        test.myArrayCopy2(array, 5, arrayOut, 5);
        Console.WriteLine($"arrayOut[4]={arrayOut[4]}");
        Console.WriteLine($"Hello");
    }
}
