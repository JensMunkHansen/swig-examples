{
  "targets": [
    {
      "target_name": "SwigJS",
      "sources": [ "example_wrap.cxx", "example.cpp" ],
      "include_dirs" : [ "<!(node -e \"require('nan')\")" ]
    }
  ]
}