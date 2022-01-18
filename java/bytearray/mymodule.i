%module mymodule

%include ubyte.i
%apply unsigned char *UBYTE { unsigned char *buffer_variable_name };

%inline %{
  extern void compress_buffer_to_file(unsigned char *buffer, char *ofname);
%}
