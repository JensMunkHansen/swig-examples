Generated C++ wrapper
SWIGEXPORT void SWIGSTDCALL CSharp_parser_MyFile_version(void * jarg1, int * jarg2, int * jarg3) {
  MyFile *arg1 = (MyFile *) 0 ;
  int *arg2 = (int *) 0 ;
  int *arg3 = (int *) 0 ;
  
  arg1 = (MyFile *)jarg1; 
  arg2 = (int *)jarg2; 
  arg3 = (int *)jarg3; 
  MyFile_version(arg1,arg2,arg3);
}

Generated PInvoke Code
[global::System.Runtime.InteropServices.DllImport("parser", EntryPoint="CSharp_parser_MyFile_version")]
public static extern void MyFile_version(global::System.Runtime.InteropServices.HandleRef jarg1, out int jarg2, out int jarg3);

Generated C# Bindings
public Tuple<int, int> version(out int major_out, out int minor_out) {
  int tmp_major_out = 0;
  int tmp_minor_out = 0;
  parserPINVOKE.MyFile_version(swigCPtr, out tmp_major_out, out tmp_minor_out);
  major_out = tmp_major_out;
  minor_out = tmp_minor_out;
  return new Tuple<int, int>(tmp_major_out, tmp_minor_out);
}

Other methods
I have tried other methods but to keep the question short I won't post all the generated code here.

Returning pointer to a static array
this works, but requires static data for every method that I want to work this way. This doesn't scale. I could easily run into lifetime issues if I try to do this with member data that I assume will live long enough for C# to copy.

wrap the default generated code in a csout typemap
This also works but allocated and de-allocates a lot for a function just returning two ints! you end up with a C# wrapper something like:

public Tuple<int, int> version() {
  System.IntPtr cPtr = parserPINVOKE.MyFile_version(swigCPtr);
  pair_of_int tmp = new pair_of_int(cPtr, false);
  Tuple<int, int> ret = new Tuple<int, int>(tmp.first, tmp.second);
  tmp.Dispose();
  return ret;
}