
// File: index.xml

// File: classexample_1_1__object.xml


%feature("docstring") example::_object "
";

// File: classdoxy2swig_1_1Doxy2SWIG.xml


%feature("docstring") doxy2swig::Doxy2SWIG "

    Converts Doxygen generated XML files into a file containing
    docstrings that can be used by SWIG-1.3.x that have support for
    feature(\"docstring\").  Once the data is parsed it is stored in
    self.pieces.  

Attributes
----------
* `with_function_signature` : ``  

* `with_type_info` : ``  

* `with_constructor_list` : ``  

* `with_attribute_list` : ``  

* `with_overloaded_functions` : ``  

* `textwidth` : ``  

* `quiet` : ``  

* `indent` : ``  

* `listitem` : ``  

* `pieces` : ``  

* `my_dir` : ``  

* `xmldoc` : ``  

* `space_re` : ``  

* `lead_spc` : ``  

* `multi` : ``  

* `ignores` : ``  
";

%feature("docstring") doxy2swig::Doxy2SWIG::get_function_signature "

    Returns the function signature string for memberdef nodes.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_mdash "
";

%feature("docstring") doxy2swig::Doxy2SWIG::parse_Text "
";

%feature("docstring") doxy2swig::Doxy2SWIG::parse_Document "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_includes "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_emphasis "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_parametername "
";

%feature("docstring") doxy2swig::Doxy2SWIG::start_new_paragraph "

    Make sure to create an empty line. This is overridden, if the previous
    text ends with the special marker ''. In that case, nothing is done.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::handle_typical_memberdefs_no_overload "

    Produce standard documentation for memberdef_nodes.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::handle_typical_memberdefs "

    Produces docstring entries containing an \"Overloaded function\"
    section with the documentation for each overload, if the function is
    overloaded and self.with_overloaded_functions is set. Else, produce
    normal documentation.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_header "

    For a user defined section def a header field is present
    which should not be printed as such, so we comment it in the
    output.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::write "
";

%feature("docstring") doxy2swig::Doxy2SWIG::subnode_parse "

    Parse the subnodes of a given node. Subnodes with tags in the
    `ignore` list are ignored. If pieces is given, use this as target for
    the parse results instead of self.pieces. Indent all lines by the amount
    given in `indent`. Note that the initial content in `pieces` is not
    indented. The final result is in any case added to self.pieces.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_verbatim "
";

%feature("docstring") doxy2swig::Doxy2SWIG::get_memberdef_nodes_and_signatures "

    Collects the memberdef nodes and corresponding signatures that
    correspond to public function entries that are at most depth 2 deeper
    than the current (compounddef) node. Returns a dictionary with
    function signatures (what swig expects after the %feature directive)
    as keys, and a list of corresponding memberdef nodes as values.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_parameteritem "
";

%feature("docstring") doxy2swig::Doxy2SWIG::add_text "

    Adds text corresponding to `value` into `self.pieces`.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_sectiondef "
";

%feature("docstring") doxy2swig::Doxy2SWIG::get_specific_subnodes "

    Given a node and a name, return a list of child `ELEMENT_NODEs`, that
    have a `tagName` matching the `name`. Search recursively for `recursive`
    levels.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_para "

    This is the only place where text wrapping is automatically performed.
    Generally, this function parses the node (locally), wraps the text, and
    then adds the result to self.pieces. However, it may be convenient to
    allow the previous content of self.pieces to be included in the text
    wrapping. For this, use the following *convention*:
    If self.pieces ends with '', treat the _previous_ entry as part of the
    current paragraph. Else, insert new-line and start a new paragraph
    and \"wrapping context\".
    Paragraphs always end with '  \\n', but if the parsed content ends with
    the special symbol '', this is passed on.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::generate "

    Parses the file set in the initialization.  The resulting
    data is stored in `self.pieces`.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_listitem "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_doxygenindex "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_compounddef "

    This produces %feature(\"docstring\") entries for classes, and handles
    class, namespace and file memberdef entries specially to allow for
    overloaded functions. For other cases, passes parsing on to standard
    handlers (which may produce unexpected results).
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::parse_Comment "

    Parse a `COMMENT_NODE`.  This does nothing for now.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_orderedlist "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_computeroutput "
";

%feature("docstring") doxy2swig::Doxy2SWIG::extract_text "

    Return the string representation of the node or list of nodes by parsing the
    subnodes, but returning the result as a string instead of adding it to
`self.pieces`.
    Note that this allows extracting text even if the node is in the ignore
list.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_member "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_ndash "
";

%feature("docstring") doxy2swig::Doxy2SWIG::make_attribute_list "

    Produces the \"Attributes\" section in class docstrings for public
    member variables (attributes).
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_blockquote "
";

%feature("docstring") doxy2swig::Doxy2SWIG::surround_parse "

    Parse the subnodes of a given node. Subnodes with tags in the
    `ignore` list are ignored. Prepend `pre_char` and append `post_char` to
    the output in self.pieces.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_heading "
";

%feature("docstring") doxy2swig::Doxy2SWIG::make_constructor_list "

    Produces the \"Constructors\" section and the constructor signatures
    (since swig does not do so for classes) for class docstrings.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_parameterdescription "
";

%feature("docstring") doxy2swig::Doxy2SWIG::__init__ "

    Initialize the instance given a source object.  `src` can
    be a file or filename.  If you do not want to include function
    definitions from doxygen then set
    `include_function_definition` to `False`.  This is handy since
    this allows you to use the swig generated function definition
    using %feature(\"autodoc\", [0,1]).  
";

%feature("docstring") doxy2swig::Doxy2SWIG::get_specific_nodes "

    Given a node and a sequence of strings in `names`, return a
    dictionary containing the names as keys and child
    `ELEMENT_NODEs`, that have a `tagName` equal to the name.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_parameterlist "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_hruler "
";

%feature("docstring") doxy2swig::Doxy2SWIG::add_line_with_subsequent_indent "

    Add line of text and wrap such that subsequent lines are indented
    by `indent` spaces.
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_bold "
";

%feature("docstring") doxy2swig::Doxy2SWIG::parse_Element "

    Parse an `ELEMENT_NODE`.  This calls specific
    `do_<tagName>` handers for different elements.  If no handler
    is available the `subnode_parse` method is called.  All
    tagNames specified in `self.ignores` are simply ignored.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_parameternamelist "
";

%feature("docstring") doxy2swig::Doxy2SWIG::parse "

    Parse a given node.  This function in turn calls the
    `parse_<nodeType>` functions which handle the respective
    nodes.  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_linebreak "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_memberdef "

    Handle cases outside of class, struct, file or namespace. These are
    now dealt with by `handle_overloaded_memberfunction`.
    Do these even exist???
  
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_itemizedlist "
";

%feature("docstring") doxy2swig::Doxy2SWIG::do_simplesect "
";

// File: structPyHeapTypeObject.xml


%feature("docstring") PyHeapTypeObject "

Attributes
----------
* `type` : `PyTypeObject`  

* `as_number` : `PyNumberMethods`  

* `as_mapping` : `PyMappingMethods`  

* `as_sequence` : `PySequenceMethods`  

* `as_buffer` : `PyBufferProcs`  

* `name` : `PyObject *`  

* `slots` : `PyObject *`  
";

// File: structswig__cast__info.xml


%feature("docstring") swig_cast_info "

Attributes
----------
* `type` : `swig_type_info *`  

* `converter` : `swig_converter_func`  

* `next` : `struct swig_cast_info *`  

* `prev` : `struct swig_cast_info *`  
";

// File: structswig__const__info.xml


%feature("docstring") swig_const_info "

Attributes
----------
* `type` : `int`  

* `name` : `char *`  

* `lvalue` : `long`  

* `dvalue` : `double`  

* `pvalue` : `void *`  

* `ptype` : `swig_type_info **`  
";

// File: structswig__globalvar.xml


%feature("docstring") swig_globalvar "

Attributes
----------
* `name` : `char *`  

* `get_attr` : `PyObject *(*`  

* `set_attr` : `int(*`  

* `next` : `struct swig_globalvar *`  
";

// File: structswig__module__info.xml


%feature("docstring") swig_module_info "

Attributes
----------
* `types` : `swig_type_info **`  

* `size` : `size_t`  

* `next` : `struct swig_module_info *`  

* `type_initial` : `swig_type_info **`  

* `cast_initial` : `swig_cast_info **`  

* `clientdata` : `void *`  
";

// File: structswig__type__info.xml


%feature("docstring") swig_type_info "

Attributes
----------
* `name` : `const char *`  

* `str` : `const char *`  

* `dcast` : `swig_dycast_func`  

* `cast` : `struct swig_cast_info *`  

* `clientdata` : `void *`  

* `owndata` : `int`  
";

// File: structswig__varlinkobject.xml


%feature("docstring") swig_varlinkobject "

Attributes
----------
* `vars` : `PyObject_HEAD swig_globalvar *`  
";

// File: structSwigPyClientData.xml


%feature("docstring") SwigPyClientData "

Attributes
----------
* `klass` : `PyObject *`  

* `newraw` : `PyObject *`  

* `newargs` : `PyObject *`  

* `destroy` : `PyObject *`  

* `delargs` : `int`  

* `implicitconv` : `int`  

* `pytype` : `PyTypeObject *`  
";

// File: structSwigPyObject.xml


%feature("docstring") SwigPyObject "

Attributes
----------
* `ptr` : `PyObject_HEAD void *`  

* `ty` : `swig_type_info *`  

* `own` : `int`  

* `next` : `PyObject *`  
";

// File: structSwigPyPacked.xml


%feature("docstring") SwigPyPacked "

Attributes
----------
* `pack` : `PyObject_HEAD void *`  

* `ty` : `swig_type_info *`  

* `size` : `size_t`  
";

// File: namespacedoxy2swig.xml

%feature("docstring") doxy2swig::my_open_write "
";

%feature("docstring") doxy2swig::main "
";

%feature("docstring") doxy2swig::my_open_read "
";

%feature("docstring") doxy2swig::shift "

    Return a list corresponding to the lines of text in the `txt` list
    indented by `indent`. Prepend instead the string given in `prepend` to the
    beginning of the first line. Note that if len(prepend) > len(indent), then
    `prepend` will be truncated (doing better is tricky!). This preserves a
    special '' entry at the end of `txt` (see `do_para` for the meaning).
  
";

// File: namespaceexample.xml

%feature("docstring") example::swig_import_helper "
";

%feature("docstring") example::my_mod "

    my_mod(int x, int y) -> int  
";

%feature("docstring") example::fact "

    fact(int n) -> int  
";

%feature("docstring") example::get_time "

    get_time() -> char *  
";

// File: namespacesetup.xml

// File: doxy2swig_8py.xml

// File: example_8c.xml

%feature("docstring") get_time "

Get the current time  

Returns
-------
string representation of time  
";

%feature("docstring") my_mod "

Module function  

Parameters
----------
* `x` :  
* `y` :  

Returns
-------
%  
";

%feature("docstring") fact "

Factorial function  

Parameters
----------
* `n` :  

Returns
-------  
";

// File: example_8h.xml

%feature("docstring") get_time "

Get the current time  

Returns
-------
string representation of time  

    get_time() -> char *  
";

%feature("docstring") my_mod "

Module function  

Parameters
----------
* `x` :  
* `y` :  

Returns
-------
%  
";

%feature("docstring") fact "

Factorial function  

Parameters
----------
* `n` :  

Returns
-------  
";

// File: example_8py.xml

// File: example__wrap_8c.xml

%feature("docstring") SWIG_PackData "
";

%feature("docstring") SWIG_Python_NewPointerObj "
";

%feature("docstring") SWIG_FromCharPtr "
";

%feature("docstring") SwigPyObject_GetDesc "
";

%feature("docstring") SWIG_Python_ConvertFunctionPtr "
";

%feature("docstring") SwigPyObject_getattr "
";

%feature("docstring") SWIG_AsVal_double "
";

%feature("docstring") SwigPyObject_next "
";

%feature("docstring") SWIG_This "
";

%feature("docstring") SWIG_Python_AppendOutput "
";

%feature("docstring") swig_varlink_dealloc "
";

%feature("docstring") SWIG_Python_TypeError "
";

%feature("docstring") SwigPyClientData_Del "
";

%feature("docstring") SWIG_Python_str_AsChar "
";

%feature("docstring") SwigPyObject_richcompare "
";

%feature("docstring") swig_varlink_setattr "
";

%feature("docstring") SWIG_Python_SetConstant "
";

%feature("docstring") SWIG_PropagateClientData "
";

%feature("docstring") SWIG_Python_NewShadowInstance "
";

%feature("docstring") SwigPyPacked_type "
";

%feature("docstring") SwigPyObject_TypeOnce "
";

%feature("docstring") SwigPyObject_append "
";

%feature("docstring") SwigPyObject_dealloc "
";

%feature("docstring") swig_varlink_getattr "
";

%feature("docstring") SwigPyObject_repr "
";

%feature("docstring") SWIG_Python_ExceptionType "
";

%feature("docstring") SWIG_Py_Void "
";

%feature("docstring") SwigPyObject_acquire "
";

%feature("docstring") swig_varlink_type "
";

%feature("docstring") SWIG_TypeQueryModule "
";

%feature("docstring") SWIG_UnpackVoidPtr "
";

%feature("docstring") SwigPyPacked_str "
";

%feature("docstring") SWIG_From_int "
";

%feature("docstring") SWIG_TypeEquiv "
";

%feature("docstring") SWIG_Python_DestroyModule "
";

%feature("docstring") Swig_var_My_variable_set "
";

%feature("docstring") SWIG_Python_ConvertPtrAndOwn "
";

%feature("docstring") SWIG_TypeCheck "
";

%feature("docstring") SWIG_Python_addvarlink "
";

%feature("docstring") SWIG_Python_SetSwigThis "
";

%feature("docstring") swig_varlink_str "
";

%feature("docstring") SWIG_Python_FixMethods "
";

%feature("docstring") SWIG_Python_GetSwigThis "
";

%feature("docstring") _wrap_fact "
";

%feature("docstring") SWIG_TypeCmp "
";

%feature("docstring") PyModule_AddObject "
";

%feature("docstring") SWIG_pchar_descriptor "
";

%feature("docstring") Swig_var_My_variable_get "
";

%feature("docstring") SWIG_Python_SetErrorMsg "
";

%feature("docstring") SwigPyObject_own "
";

%feature("docstring") PyBool_FromLong "
";

%feature("docstring") SWIG_CanCastAsInteger "
";

%feature("docstring") SWIG_AsVal_long "
";

%feature("docstring") SWIG_Python_SetModule "
";

%feature("docstring") SWIG_Python_GetModule "
";

%feature("docstring") SWIG_Python_SetErrorObj "
";

%feature("docstring") SWIG_MangledTypeQueryModule "
";

%feature("docstring") SWIG_Python_TypeQuery "
";

%feature("docstring") SWIG_TypeName "
";

%feature("docstring") SwigPyPacked_Check "
";

%feature("docstring") SwigPyObject_format "
";

%feature("docstring") SWIG_TypeClientData "
";

%feature("docstring") SwigPyClientData_New "
";

%feature("docstring") SwigPyObject_hex "
";

%feature("docstring") _wrap_get_time "
";

%feature("docstring") SWIG_Python_ErrorType "
";

%feature("docstring") SWIG_Python_AddErrorMsg "
";

%feature("docstring") SWIG_InitializeModule "
";

%feature("docstring") SWIG_globals "
";

%feature("docstring") SwigPyPacked_print "
";

%feature("docstring") _SWIG_This "
";

%feature("docstring") SWIG_Python_TypeCache "
";

%feature("docstring") SWIG_TypeNameComp "
";

%feature("docstring") SWIG_FromCharPtrAndSize "
";

%feature("docstring") SwigPyObject_long "
";

%feature("docstring") SwigPyPacked_repr "
";

%feature("docstring") PyNumber_AsSsize_t "
";

%feature("docstring") SWIG_Python_ArgFail "
";

%feature("docstring") SWIG_Python_MustGetPtr "
";

%feature("docstring") SWIG_TypePrettyName "
";

%feature("docstring") SwigPyPacked_New "
";

%feature("docstring") _wrap_my_mod "
";

%feature("docstring") SWIG_Python_str_FromChar "
";

%feature("docstring") SWIG_UnpackData "
";

%feature("docstring") SwigPyPacked_dealloc "
";

%feature("docstring") get_time "

Get the current time  

Returns
-------
string representation of time  

    get_time() -> char *  
";

%feature("docstring") SWIG_TypeCheckStruct "
";

%feature("docstring") SWIG_PackVoidPtr "
";

%feature("docstring") SWIG_Python_AddErrMesg "
";

%feature("docstring") SWIG_TypeDynamicCast "
";

%feature("docstring") SWIG_Python_ConvertPacked "
";

%feature("docstring") SWIG_PyInstanceMethod_New "
";

%feature("docstring") SWIG_Python_UnpackTuple "
";

%feature("docstring") SWIG_Python_newvarlink "
";

%feature("docstring") SwigPyPacked_compare "
";

%feature("docstring") SwigPyPacked_TypeOnce "
";

%feature("docstring") swig_varlink_print "
";

%feature("docstring") SWIG_PackDataName "
";

%feature("docstring") SWIG_AsVal_int "
";

%feature("docstring") SWIG_Python_InitShadowInstance "
";

%feature("docstring") SWIG_Python_InstallConstants "
";

%feature("docstring") SwigPyObject_type "
";

%feature("docstring") SwigPyObject_oct "
";

%feature("docstring") swig_varlink_repr "
";

%feature("docstring") SWIG_TypeCast "
";

%feature("docstring") SwigPyObject_Check "
";

%feature("docstring") my_mod "

my_mod  

Parameters
----------
* `x` :  
* `y` :  

Returns
-------
%  

Module function  

Parameters
----------
* `x` :  
* `y` :  

Returns
-------
%  
";

%feature("docstring") SWIG_init "
";

%feature("docstring") SWIG_Python_NewPackedObj "
";

%feature("docstring") SWIG_UnpackDataName "
";

%feature("docstring") SwigPyPacked_UnpackData "
";

%feature("docstring") SWIG_Python_AcquirePtr "
";

%feature("docstring") SwigPyObject_compare "
";

%feature("docstring") fact "

Factorial function  

Parameters
----------
* `n` :  

Returns
-------  
";

%feature("docstring") SWIG_TypeNewClientData "
";

%feature("docstring") SwigPyObject_New "
";

%feature("docstring") SwigPyObject_disown "
";

%feature("docstring") PyString_FromFormat "
";

%feature("docstring") SWIG_Python_CheckImplicit "
";

// File: setup_8py.xml

