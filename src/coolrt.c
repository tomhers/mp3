#include "coolrt.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

/* This file provides the runtime library for cool. It implements
   the functions of the cool classes in C 
   */

/* Class name strings */
const char Object_string[] 	= "Object";
const char String_string[] 	= "String";
const char Int_string[] 	= "Int";
const char Bool_string[] 	= "Bool";
const char IO_string[] 		= "IO";

const char default_string[]	= "";

extern const Object_vtable Object_vtable_prototype;
extern const IO_vtable IO_vtable_prototype;
extern const String_vtable String_vtable_prototype;
extern const Int_vtable Int_vtable_prototype;
extern const Bool_vtable Bool_vtable_prototype;

/* Class vtable prototypes */
/*const Object_vtable Object_vtable_prototype = {
	.level = 0,
	.ptrtoint = 0,
	.name = (char*)Object_string,
	.Object_new = Object_new,
	.Object_abort = (Object* (*) (Object*)) Object_abort,
	.Object_type_name = (const String* (*) (Object*)) Object_type_name,
	.Object_copy = (Object* (*) (Object*)) Object_copy
};

const Int_vtable Int_vtable_prototype = {
    .level = 1,
    .ptrtoint = 0,
    .name = (char*)Int_string,
    .Int_new = Int_new,
    .Object_abort = (Object* (*) (Int*)) Object_abort,
    .Object_type_name = (const String* (*) (Int*)) Object_type_name,
    .Object_copy = (Int* (*) (Int*)) Object_copy
};

const Bool_vtable Bool_vtable_prototype = {
    .level = 2,
    .ptrtoint = 0,
    .name = (char*)Bool_string,
    .Bool_new = Bool_new,
    .Object_abort = (Object* (*) (Bool*)) Object_abort,
    .Object_type_name = (const String* (*) (Bool*)) Object_type_name,
    .Object_copy = (Bool* (*) (Bool*)) Object_copy
};

const String_vtable String_vtable_prototype = {
    .level = 3,
    .ptrtoint = 0, 
    .name = (char*)String_string,
    .String_new = String_new,
    .Object_abort = (Object* (*) (String*)) Object_abort,
    .Object_type_name = (const String* (*) (String*)) Object_type_name,
    .Object_copy = (String* (*) (String*)) Object_copy,
    .String_length = String_length,
    .String_concat = String_concat,
    .String_substr = String_substr
};

const IO_vtable IO_vtable_prototype = {
    .level = 4,
    .ptrtoint = 0,
    .name = (char*)IO_string,
    .IO_new = IO_new,
    .Object_abort = (Object* (*) (IO*)) Object_abort,
    .Object_type_name = (const String* (*) (IO*)) Object_type_name,
    .Object_copy = (IO* (*) (IO*)) Object_copy,
    .IO_out_string = IO_out_string,
    .IO_out_int = IO_out_int,
    .IO_in_string = IO_in_string,
    .IO_in_int= IO_in_int
};*/


/*
// Methods in class object (only some are provided to you)
*/
Object* Object_abort(Object *self)
{
	printf("Abort called from class %s\n",
	       !self? "Unknown" : self->vtblptr->name);
	exit(1);
	return self;
}

const String* Object_type_name(Object *self)
{
	if (self == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
		abort();
	}
	String *s = String_new();
	s->val = self->vtblptr->name;
	return s;
}

Object* Object_copy(Object* self)
{
	if (self == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
		abort();
	}
	Object* copy = Object_new();
	copy->vtblptr = self->vtblptr;
	return copy;
}

Object* Object_new(void)
{
	Object *res = malloc(sizeof(Object));
	//memcpy(res, &temp, sizeof(Object));
	res->vtblptr = &Object_vtable_prototype;
	return res;
}


/*
// Methods in class IO (only some are provided to you)
*/

IO* IO_new(void)
{
	IO temp;
	IO *res = malloc(sizeof(IO));
	memcpy(res, &temp, sizeof(IO));
	return res;
}

IO* IO_out_string(IO *self, String* x)
{
	if (self == 0 || x == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): NULL object\n");
		abort();
	}
	printf("%s",x->val);
	return self;
}

IO* IO_out_int(IO *self, int x)
{
	if (self == 0 || x == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): NULL object\n");
		abort();
	}
	printf("%d", x);
	return self;
}

/*
 * Get one line from stream using get_line(), then discard newline character.
 * Allocate string *in_string_p and store result there.
 * Return number of chars read. 
 */
static int get_one_line(char** in_string_p, FILE* stream)
{
	/* Get one line worth of input */
	size_t len = 0;
	ssize_t num_chars_read;
	num_chars_read = getline(in_string_p, &len, stdin);
	if (*in_string_p == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__):\n   ");
		fprintf(stderr, "    allocation failed in IO::in_string()\n");
		exit(1);
	}
	
	/* Discard the newline char, if any.  It may not exist if EOF reached. */
	if (num_chars_read > 0 && (*in_string_p)[num_chars_read-1] == '\n') {
		(*in_string_p)[num_chars_read-1] = '\0';
		--len;
	}

	return len;
}

/*
 * The method IO::in_string(): String reads a string from 
 * the standard input, up to but not including a newline character.
 */
String* IO_in_string(IO *self)
{
	if (self == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
		abort();
	}

	/* Get one line worth of input with the newline, if any, discarded */
	char* in_string = 0;
	ssize_t len = get_one_line(&in_string, stdin);
	assert(in_string);
	
	/* We can take advantage of knowing the internal layout of String objects */
	String *str = String_new();
	str->val = in_string;
	return str;
}

/*
 * The method IO::in_int(): Int reads a single integer, which may be preceded
 * by whitespace. 
 * Any characters following the integer, up to and including the next newline,
 * are discarded by in_int.
 */
int IO_in_int(IO *self)
{
	if (self == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
		abort();
	}

	/* Get one line worth of input with the newline, if any, discarded */
	char* in_string = 0;
	ssize_t len = get_one_line(&in_string, stdin);
	assert(in_string);

	/* Now extract initial int and ignore the rest of the line */
	int x;
	int num_ints = 0;
	if (len)
		num_ints = sscanf(in_string, " %d", &x); /* Discards initial spaces*/

	/* If no text found, abort. */
	if (num_ints == 0) {
		fprintf(stderr, "At __FILE__(line __LINE__):\n   ");
		fprintf(stderr, "    Invalid integer on input in IO::in_int()");
		Object_abort((Object*) self);
	}
	return x;
}

Int* Int_new(void)
{
	Int *res = malloc(sizeof(Int));
	res->val = 0;
	res->vtblptr = &Int_vtable_prototype;
	//memcpy(res, &temp, sizeof(Int));
	return res;
}

void Int_init(Int *self, int x)
{
	self->val = x;
}

Bool* Bool_new(void)
{
	Bool *res = malloc(sizeof(Bool));
	res->val = false;
	res->vtblptr = &Bool_vtable_prototype;
	//memcpy(res, &temp, sizeof(Bool));
	return res;
}

String* String_new(void)
{
	String *res = malloc(sizeof(String));
	res->val = "";
	res->vtblptr = &String_vtable_prototype;
	//memcpy(res, &temp, sizeof(String));
	return res;
}

int String_length(String *s)
{
	return (int) strlen(s->val);
}

String* String_concat(String *s, String *t)
{
	char* first = s->val;
	char* second = t->val;
	int firstLen = (int) strlen(first);
	int secondLen = (int) strlen(second);

	char* res = malloc(firstLen + secondLen + 1);
	memcpy(res, first, firstLen);
	memcpy(res + firstLen, second, secondLen);
	memcpy(res + firstLen + secondLen, '\0', 1);

	String* final = String_new();
	final->val = res;
	final->vtblptr = s->vtblptr;

	return final;
}

String* String_substr(String* s, int i, int j)
{
	char* str = s->val;
	int strLen = (int) strlen(str);
	if (strLen < i + j) {
		fprintf(stderr, "At __FILE__(line __LINE__):\n   ");
		fprintf(stderr, "    Invalid range for String_substr");
		Object_abort(s);
	}

	char* res = malloc(j + 1);
	memcpy(res, str + i, j);
	memcpy(res + j, '\0', 1);

	String* final = String_new();
	final->val = res;
	final->vtblptr = s->vtblptr;

	return final;
}


