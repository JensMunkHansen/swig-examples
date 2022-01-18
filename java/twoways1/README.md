You can do this, withing the constraints you favour (i.e. not maintaining a map of weak references) with a little work. It turns out in fact to be less work than I originally expected too. I'll talk through the solution first and then add some discussion on the way I first tried to do this that became too unwieldy to complete.

The high level view of the working solution is that we have three things added:

 1. Some C++ code, via %extend inside person that tries a dynamic cast
    to Director* (i.e. one base of the SWIG director heirarchy). This
    holds a jobject reference to the original Java class, if one
    exists. So we can trivially return either that jboject, or NULL if
    the cast fails.

 2. Some Java code that will return either the result of our C++ code,
    or this if not appropriate. We can then inject call that from
    witihin our javadirectorin typemap to allow an "upgrade" from new
    proxy to original object to occur.

 3. Another trick in the form of a trivial typemap that passes the
    JNIEnv object into the %extend method of #1 automatically because
    it isn't normally accessible there directly, even though it could
    be exposed like this.
    
So your interface file then becomes:

See c_backend.i

I threw in a message to stderr just to prove that it really had worked.

In real code you'd probably want to add a javaout typemap that mirrors
what the javadirectorin typemap does as well. You could probably dress
it all up neatly inside a macro too because all the code is written to
avoid assuming an fixed type names.

If I had to guess as to why SWIG doesn't do something like that by
default it's almost certainly because that would mandate use of RTTI,
but it used to be trendy to pass -fno-rtti into your compiler "for
performance", so lots of code bases try to avoid assuming dynamic
casts can be relied upon.

If all you care about is a solution stop reading now. However included
here by way of reference is my original approach to this which I
ultimately abandoned. It started out like this:

//c_backend.i
%module(directors="1") c_backend

%{
#include "c_backend.h"
%}

%feature("director") Person;
%feature("director") JobPool;
%typemap(jtype) Person * "Object"
%typemap(jnitype) Person * "jobject"
%typemap(javadirectorin) Person * "$jniinput instanceof $*javaclassname ? ($*javaclassname)$jniinput : new $*javaclassname((Long)$jniinput), false)"
%typemap(directorin,descriptor="L/java/lang/Object;") Person * {
    SwigDirector_$1_basetype *dir = dynamic_cast<SwigDirector_$1_basetype*>($1);
    if (!dir) {
        jclass cls = JCALL1(FindClass, jenv, "java/lang/Long");
        jmid ctor = JCALL3(GetMethodID, jenv, cls, "<init>", "J(V)");
        $input = JCALL3(NewObject, jenv, cls, ctor, reinterpret_cast<jlong>($1));
    }
    else {
        $input = dir->swig_get_self(jenv);
    }
}
%include "c_backend.h"

Which changed the Person types to return an Object/jobject all the way
through from the wrapper code. My plan was that it would either be an
instance of Person or java.lang.Long and we'd dynamically decide what
to construct based on the instanceof comparison.

The problem with this though is that jnitype and jtype tyemaps make no
distinction between the context they get used in. So any other usage
of Person (e.g. constructors, function inputs, director out, other
bits of the director code) all needed to be changed to work with a
Long object instead of a long primitive type. Even by matching
typemaps on the variable names it still didn't avoid the
overmatching. (Try it and note the places where long becomes Person
inside c_backendJNI.java). So it would have been ugly in terms of
requiring very explicit naming of typemaps and still have overmatched
what I wanted and thus required more intrusive changes to other
typemaps.





