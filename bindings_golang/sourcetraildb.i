%module sourcetraildb

%{
#include "sourcetraildb.h"
%}

%insert(cgo_comment_typedefs) %{
#cgo CXXFLAGS: -std=c++11
%}

%include <typemaps.i>
%include <std_string.i>

// Convert std::string to Go string
%typemap(gotype) std::string "string"
%typemap(imtype) std::string "string"
%typemap(goin) std::string "$result = $1"
%typemap(goout) std::string "$result = $1"

// Handle errors without panic
%typemap(out) bool {
    $result = $1;
}

%include "sourcetraildb.h"