%module parser
%include "typemaps.i"

%rename("$ignore", fullname=1) MyFile::version() const noexcept;
%extend MyFile {
  void version(int* major_out, int* minor_out) {
    std::tie(*major_out, *minor_out) = self->version();
  }
}

%typemap(ctype, out="void *") int* major_out, int* minor_out "int *"
%typemap(imtype, out="void") int* major_out, int* minor_out "out int"
%typemap(cstype) int* major_out, int* minor_out "out int"
%typemap(cstype) void MyFile::version "Tuple<int, int>"
%typemap(csin, pre="    int tmp_$csinput = 0;") int* major_out, int* minor_out "out tmp_$csinput"

// implment the C# function that returns the type specified above
%typemap(csout, noblock=1, excode=SWIGEXCODE) void MyFile::version
{
  $imcall;$excode
  major_out = tmp_major_out;
  minor_out = tmp_minor_out;
  return new Tuple<int, int>(tmp_major_out, tmp_minor_out);
}


