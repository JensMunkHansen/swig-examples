%module test

%pragma(java) modulecode=%{
   // Create a single cleaner thread for all our buffers to register with
   // note package level access is deliberate
   static final java.lang.ref.Cleaner cc = java.lang.ref.Cleaner.create();
   static {
     // actually load our shared object!
     System.loadLibrary("test");
   }
%}

// later on when we implement toBuffer() we need the environment pointer.
// This adds it into our method call automatically
%typemap(in,numinputs=0) JNIEnv * %{
  $1 = jenv;
%}

// Our native implementation of toBuffer on BUFFER is going to return
// a ByteBuffer straight up for us, with no need for conversions
%typemap(jtype) jobject toBuffer "java.nio.ByteBuffer"
%typemap(jstype) jobject toBuffer "java.nio.ByteBuffer"

// When we hand the ByteBuffer off to a caller we need to register
// something to do the clean up for us. This is where we register it.
%typemap(javaout) jobject toBuffer {
  java.nio.ByteBuffer buf = $jnicall; // actually call the native code
  System.out.println("In toBuffer"); // To prove it worked!

  // Our cleaner instance lives in the module itself
  $module.cc.register(buf, new Runnable(){
    public void run() {
      System.out.println("in buffer cleanup java side");
      // We add a (private) cleanup function we can just call here
      BUFFER.this.cleanup();
    }
  });

  // Now it's registered actually let them have it
  return buf;
}

// Every time we return a BUFFER * call toBuffer() on it instead
%typemap(javaout) BUFFER * {
  return new $javaclassname($jnicall, $owner).toBuffer();
}

// Since we're going to call toBuffer() the return type is different
%typemap(jstype) BUFFER * "java.nio.ByteBuffer"

// Hide lots of thing about the BUFFER class outside our package
%typemap(javaclassmodifiers) BUFFER "class"
%javamethodmodifiers BUFFER::cleanup() "private";
%javamethodmodifiers BUFFER::toBuffer "";



// BEGIN Faked definitions, just for testing...
%{
typedef struct {
  void *data;
  int len;
} BUFFER;

typedef struct {
  enum { IMAGE_ENCODING_I420 } a;
  int n;
} IMAGE_FORMAT;

BUFFER * arducam_capture(void * instance, IMAGE_FORMAT *fmt, int timeout) {
  (void)instance; (void)fmt; (void)timeout;
  BUFFER *buf = malloc(sizeof *buf);
  *buf = (BUFFER){
    .data = malloc(100),
    .len = 100,
  };
  return buf;
}

void arducam_release_buffer(BUFFER *instance) {
  free(instance->data);
  free(instance);
}
%}
// END TESTING

// All the details of BUFFER are not public for Java users
%nodefaultctor BUFFER;
%nodefaultdtor BUFFER;
typedef struct {} BUFFER;

// In addition to what's really in the buffer object we want to add another
// two methods. 
%extend BUFFER {
        // toBuffer() is used by our internals when returning a BUFFER
        jobject toBuffer(JNIEnv *jenv) const {
                // Swig provides JCALLx macros for us, but they are not usable inside %extend :(
%#ifdef __cplusplus__
                return jenv->NewDirectByteBuffer($self->data, $self->len);
%#else
                return (*jenv)->NewDirectByteBuffer(jenv, $self->data, $self->len);
%#endif
        }

        // Cleanup is used when the buffer is dead
        void cleanup() {
                arducam_release_buffer($self);
        }
}


%inline %{
// Now, wrap a modified version of your code
BUFFER *do_capture() {
    void *camera_instance = NULL;
    IMAGE_FORMAT fmt = { IMAGE_ENCODING_I420, 100 };
    BUFFER *buffer = arducam_capture(camera_instance, &fmt, 352000);
    return buffer;
}

%}
