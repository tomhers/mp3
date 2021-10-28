/* 
 * This file provides the runtime library for cool. It implements
 * the cool classes in C.  Feel free to change it to match the structure
 * of your code generator.
*/

#include <stdbool.h>

typedef struct Object Object;
typedef struct String String;
typedef struct IO IO;
typedef struct Int Int;
typedef struct Bool Bool;

typedef struct Object_vtable Object_vtable;
typedef struct String_vtable String_vtable;
typedef struct IO_vtable IO_vtable;
typedef struct Int_vtable Int_vtable;
typedef struct Bool_vtable Bool_vtable;

/* class type definitions */
struct Object {
	Object_vtable* vtblptr;
};

struct Int {
	Int_vtable* vtblptr;
	int val;
};

struct Bool {
	Bool_vtable* vtblptr;
	bool val;
};

struct String {
	String_vtable* vtblptr;
	char* val;
};

struct IO {
	IO_vtable* vtblptr;
};


/* vtable type definitions */
struct Object_vtable {
	int level;
	int ptrtoint;
	char* name;
	Object* (*Object_new)(void);
	Object* (*Object_abort)(Object*);
	const String* (*Object_type_name)(Object*);
	Object* (*Object_copy)(Object*);
};

struct IO_vtable {
	int level;
	int ptrtoint;
	char* name;
	IO* (*IO_new)(void);
	void (*IO_init)(IO*);
	IO* (*IO_out_string)(IO*, String*);
	IO* (*IO_out_int)(IO*, Int*);
	String* (*IO_in_string)(IO*);
	Int* (*IO_in_int)(IO*);

	Object* (*Object_abort)(IO*);
	const String* (*Object_type_name)(IO*);
	IO* (*Object_copy)(IO*);

};

struct Int_vtable {
	int level;
	int ptrtoint;
	char* name;
	Int* (*Int_new)(void);

	Object* (*Object_abort)(Int*);
	const String* (*Object_type_name)(Int*);
	Int* (*Object_copy)(Int*);
};

struct Bool_vtable {
	int level;
	int ptrtoint;
	char* name;
	Bool* (*Bool_new)(void);

	Object* (*Object_abort)(Bool*);
	const String* (*Object_type_name)(Bool*);
	Bool* (*Object_copy)(Bool*);
};
   
struct String_vtable {
	int level;
	int ptrtoint;
	char* name;
	String* (*String_new)(void);
	Int* (*String_length)(String*);
	String* (*String_concat)(String*, String*);
	String* (*String_substr)(String*, Int*, Int*);

	Object* (*Object_abort)(String*);
	const String* (*Object_type_name)(String*);
	String* (*Object_copy)(String*);
};

/* methods in class Object */
Object* Object_abort(Object *self);
const String* Object_type_name(Object *self);
Object* Object_copy(Object *self);
Object* Object_new(void);

/* methods in class IO */
IO* IO_new(void);
void IO_init(IO *self);
IO* IO_out_string(IO *self, String *x);
IO* IO_out_int(IO *self, int x);
String* IO_in_string(IO *self);
int IO_in_int(IO *self);

/* methods in class Int */
Int* Int_new(void);
void Int_init(Int *self, int x);

/* methods in class Bool */
Bool* Bool_new(void);

/* methods in class String */
String* String_new(void);
int String_length(String *s);
String* String_concat(String* s, String* t);
String* String_substr(String *s, int i, int j);
